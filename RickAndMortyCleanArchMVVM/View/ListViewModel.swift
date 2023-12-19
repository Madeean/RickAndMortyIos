//
//  ListViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var dataListRickAndMorty: RickAndMortyModel = RickAndMortyModel(results: [])

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUsecase()) {
        self.usecase = usecase
    }

    func getListRickAndMorty() async {
        do {
            let data = try await usecase.getListRickAndMorty()
            self.dataListRickAndMorty = data
        } catch {
            print(error)
        }
    }
}
