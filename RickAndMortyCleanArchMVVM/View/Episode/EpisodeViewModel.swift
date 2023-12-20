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

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUsecase()) {
        self.usecase = usecase
    }

    func getListEpisode(page: Int) async {
        isLoading = true
        do {
            let data = try await usecase.getListEpisodeRickAndMorty(page: page)
            isLoading = false
            episodeListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == episodeListRickAndMorty.count - 2
    }
    
    func getSearchEpisode(name:String, page:Int) async {
        isLoading = true
        episodeListRickAndMorty = []
        do{
            let data = try await usecase.getSearchEpisode(name: name, page: page)
            isLoading = false
            episodeListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            print(error)
        }
    }
}
