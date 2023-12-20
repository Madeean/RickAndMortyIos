//
//  LocationViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import Foundation
class LocationViewModel: ObservableObject{
    @Published var locationListRickAndMorty: [LocationModel] = []
    @Published var isLoading = false

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUsecase()) {
        self.usecase = usecase
    }

    func getListEpisode(page: Int) async {
        isLoading = true
        do {
            let data = try await usecase.getLocationRickAndMorty(page: page)
            isLoading = false
            locationListRickAndMorty.append(contentsOf: data.results)
        } catch {
            isLoading = false
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == locationListRickAndMorty.count - 2
    }
}
