//
//  RickAndMortyAPIRepository.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class RickAndMortyAPIRepository: RickAndMortyRepository {

    

    private let datasource: RickAndMortyAPIDatasource

    init(datasource: RickAndMortyAPIDatasource = RickAndMortyAPIDatasource()) {
        self.datasource = datasource
    }

    func getListRickAndMorty(page:Int) async throws -> RickAndMortyModel {
        
        let rawData = try await datasource.getListRickAndMorty(page: page)
        let data = RickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
    
    func getListEpisodeRickAndMorty(page: Int) async throws -> EpisodeRickAndMortyModel {
        let rawData = try await datasource.getListEpisodeRickAndMorty(page: page)
        let data = EpisodeRickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
    
    
    func getListLocationRickAndMorty(page: Int) async throws -> LocationRickAndMortyModel {
        let rawData = try await datasource.getLocationRickAndMorty(page: page)
        let data = LocationRickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
    
    func getSearchEpisode(name: String, page: Int) async throws -> EpisodeRickAndMortyModel {
        let rawData = try await datasource.getSearchEpisode(name: name, page: page)
        let data = EpisodeRickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
    
    func getSearchCharacter(name: String, page: Int) async throws -> RickAndMortyModel {
        let rawData = try await datasource.getSearchCharacter(name: name, page: page)
        let data = RickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
    
    func getSearchLocation(name: String, page: Int) async throws -> LocationRickAndMortyModel {
        let rawData = try await datasource.getSearchLocation(name: name, page: page)
        let data  = LocationRickAndMortyResponseModel.transforms(model: rawData)
        
        return data
    }
}
