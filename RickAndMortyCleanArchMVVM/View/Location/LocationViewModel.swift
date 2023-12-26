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
    @Published var isSearchMode = false
    @Published var stopLoad = false

    private let usecase: RickAndMortyUsecase
    
    init(usecase: RickAndMortyUsecase = RickAndMortyUseCaseImpl(repository: RickAndMortyDataRepositoryImpl())) {
            self.usecase = usecase
        }

    @MainActor func getListEpisode(page: Int) async {
        stopLoad = false
        isSearchMode = false
        isLoading = true
        do {
            let data = try await usecase.getListLocationRickAndMorty(page: page)
            isLoading = false
            locationListRickAndMorty.append(contentsOf: data.results)
        } catch {
            stopLoad = true
            isLoading = false
            print(error)
        }
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == locationListRickAndMorty.count - 2
    }
    
    @MainActor func getSearchLocation(name:String, page:Int) async {
        stopLoad = false
        isSearchMode = true
        isLoading = true
        do{
            let data = try await usecase.getSearchLocation(name: name, page: page)
            isLoading = false
            if(data.results.isEmpty){
                stopLoad = true
                print("iesmpty")
            }else{
                print("isnotempty")
                locationListRickAndMorty.append(contentsOf: data.results)
            }
        } catch {
            isLoading = false
            stopLoad = true
            print(error)
        }
    }
}
