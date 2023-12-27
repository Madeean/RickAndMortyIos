//
//  RickAndMortyAPIRepository.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
import RxSwift
class RickAndMortyDataRepositoryImpl: RickAndMortyRepository {
    private let datasource: RickAndMortyAPIDatasource

    init(datasource: RickAndMortyAPIDatasource = RickAndMortyAPIDatasource()) {
        self.datasource = datasource
    }

    func getListRickAndMorty(page: Int) -> Observable<RickAndMortyModel> {
        let rawData = datasource.getListRickAndMorty(page: page).map {
            RickAndMortyResponseModel.transforms(model: $0)
        }

        return rawData
    }

    func getListEpisodeRickAndMorty(page: Int) -> Observable<EpisodeRickAndMortyModel> {
        let rawData = datasource.getListEpisodeRickAndMorty(page: page).map { EpisodeRickAndMortyResponseModel.transforms(model: $0) }

        return rawData
    }

    func getListLocationRickAndMorty(page: Int) -> Observable<LocationRickAndMortyModel> {
        let rawData = datasource.getLocationRickAndMorty(page: page).map {
            LocationRickAndMortyResponseModel.transforms(model: $0)
        }

        return rawData
    }

    func getSearchEpisode(name: String, page: Int) -> Observable<EpisodeRickAndMortyModel> {
        let rawData = datasource.getSearchEpisode(name: name, page: page).map {
            EpisodeRickAndMortyResponseModel.transforms(model: $0)
        }
        return rawData
    }

    func getSearchCharacter(name: String, page: Int) -> Observable<RickAndMortyModel> {
        let rawData = datasource.getSearchCharacter(name: name, page: page).map {
            RickAndMortyResponseModel.transforms(model: $0)
        }

        return rawData
    }

    func getSearchLocation(name: String, page: Int) -> Observable<LocationRickAndMortyModel> {
        let rawData = datasource.getSearchLocation(name: name, page: page).map {
            LocationRickAndMortyResponseModel.transforms(model: $0)
        }

        return rawData
    }
}
