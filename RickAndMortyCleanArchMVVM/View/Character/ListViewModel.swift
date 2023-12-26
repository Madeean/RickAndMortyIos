//
//  ListViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var dataListRickAndMorty: [CharacterModel] = []
    @Published var isLoading = false
    @Published var isSearchMode = false
    @Published var stopLoad = false

    private let usecase: RickAndMortyUsecase
    
    init(usecase: RickAndMortyUsecase = RickAndMortyUseCaseImpl(repository: RickAndMortyDataRepositoryImpl())) {
            self.usecase = usecase
        }

    @MainActor func getListRickAndMorty(page: Int) async {
        stopLoad = false
        isSearchMode = false
        isLoading = true
        do {
            let data = try await usecase.getListRickAndMorty(page: page)
            isLoading = false
            dataListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            stopLoad = true
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == dataListRickAndMorty.count - 2
    }
    
    @MainActor func getSearchEpisode(name:String, page:Int) async {
        stopLoad = false
        isSearchMode = true
        isLoading = true
        do{
            let data = try await usecase.getSearchCharacter(name: name, page: page)
            isLoading = false
            if(data.results.isEmpty){
                stopLoad = true
                print("iesmpty")
            }else{
                print("isnotempty")
                dataListRickAndMorty.append(contentsOf: data.results)
            }
        } catch {
            isLoading = false
            stopLoad = true
            print(error)
        }
    }
}
