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

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUsecase()) {
        self.usecase = usecase
    }

    func getListRickAndMorty(page: Int) async {
        isLoading = true
        do {
            let data = try await usecase.getListRickAndMorty(page: page)
            isLoading = false
            dataListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == dataListRickAndMorty.count - 2
    }
    
    func getSearchEpisode(name:String, page:Int) async {
        isLoading = true
        dataListRickAndMorty = []
        do{
            let data = try await usecase.getSearchCharacter(name: name, page: page)
            isLoading = false
            dataListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            print(error)
        }
    }
}
