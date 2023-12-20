//
//  RickAndMortyUsecase.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class RickAndMortyUsecase {
    private let repository: RickAndMortyAPIRepository

    init(repository: RickAndMortyAPIRepository = RickAndMortyAPIRepository()) {
        self.repository = repository
    }

    func getListRickAndMorty(page:Int) async throws -> RickAndMortyModel {
        return try await repository.getListRickAndMorty(page: page)
    }
    
    func getListEpisodeRickAndMorty(page:Int) async throws -> EpisodeRickAndMortyModel{
        return try await repository.getListEpisodeRickAndMorty(page: page)
    }
    
    func getLocationRickAndMorty(page:Int) async throws -> LocationRickAndMortyModel{
        return try await repository.getListLocationRickAndMorty(page: page)
    }
    
    func getSearchEpisode(name:String, page:Int) async throws -> EpisodeRickAndMortyModel{
        return try await repository.getSearchEpisode(name: name, page: page)
    }
    
    func getSearchCharacter(name:String, page:Int) async throws -> RickAndMortyModel{
        return try await repository.getSearchCharacter(name: name, page: page)
    }
    
}
