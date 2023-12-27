//
//  RickAndMortyUseCaseImpl.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 26/12/23.
//

import Foundation
import RxSwift

class RickAndMortyUseCaseImpl: RickAndMortyUsecase {
    private let repository: RickAndMortyRepository

    init(repository: RickAndMortyRepository) {
        self.repository = repository
    }

    func getListLocationRickAndMorty(page: Int)  -> Observable<LocationRickAndMortyModel> {
        return repository.getListLocationRickAndMorty(page: page)
    }

    func getListRickAndMorty(page: Int)  -> Observable<RickAndMortyModel> {
        return repository.getListRickAndMorty(page: page)
    }

    func getListEpisodeRickAndMorty(page: Int) -> Observable<EpisodeRickAndMortyModel> {
        return repository.getListEpisodeRickAndMorty(page: page)
    }

    func getSearchEpisode(name: String, page: Int) -> Observable<EpisodeRickAndMortyModel> {
        return repository.getSearchEpisode(name: name, page: page)
    }

    func getSearchCharacter(name: String, page: Int)  -> Observable<RickAndMortyModel> {
        return repository.getSearchCharacter(name: name, page: page)
    }

    func getSearchLocation(name: String, page: Int)  -> Observable<LocationRickAndMortyModel> {
        return repository.getSearchLocation(name: name, page: page)
    }
}
