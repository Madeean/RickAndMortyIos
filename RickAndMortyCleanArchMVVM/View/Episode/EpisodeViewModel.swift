//
//  EpisodeViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import Foundation
class EpisodeViewModel: ObservableObject {
    @Published var episodeListRickAndMorty: [EpisodeModel] = []
    @Published var isLoading = false
    @Published var isSearchMode = false
    @Published var stopLoad = false

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUsecase()) {
        self.usecase = usecase
    }

    @MainActor func getListEpisode(page: Int) async {
        stopLoad = false
        isSearchMode = false
        isLoading = true
        do {
            let data = try await usecase.getListEpisodeRickAndMorty(page: page)
            isLoading = false
                self.episodeListRickAndMorty.append(contentsOf: data.results)
        } catch {
            stopLoad = true
            isLoading = false
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == episodeListRickAndMorty.count - 2
    }
    
    @MainActor func getSearchEpisode(name:String, page:Int) async {
        stopLoad = false
        isSearchMode = true
        isLoading = true
        do{
            let data = try await usecase.getSearchEpisode(name: name, page: page)
            isLoading = false
            if(data.results.isEmpty){
                stopLoad = true
                print("iesmpty")
            }else{
                print("isnotempty")
                self.episodeListRickAndMorty.append(contentsOf: data.results)
            }
        } catch {
            isLoading = false
            stopLoad = true
            print(error)
        }
    }
}
