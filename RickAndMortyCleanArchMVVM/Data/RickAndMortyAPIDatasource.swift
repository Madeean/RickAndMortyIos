//
//  RickAndMortyAPIDatasource.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class RickAndMortyAPIDatasource: RickAndMortyDatasource {
    func getSearchLocation(name: String, page: Int) async throws -> LocationRickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/location?name=\(name)&page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(LocationRickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return LocationRickAndMortyResponseModel(results: listData)
    }
    
    func getSearchCharacter(name: String, page: Int) async throws -> RickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/character?name=\(name)&page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(RickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return RickAndMortyResponseModel(results: listData)
    }
    
    
    func getSearchEpisode(name: String, page: Int) async throws -> EpisodeRickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/episode?name=\(name)&page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(EpisodeRickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return EpisodeRickAndMortyResponseModel(results: listData)
    }
    
    func getListRickAndMorty(page:Int) async throws -> RickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(RickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return RickAndMortyResponseModel(results: listData)
    }
    
    func getListEpisodeRickAndMorty(page: Int) async throws -> EpisodeRickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(EpisodeRickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return EpisodeRickAndMortyResponseModel(results: listData)
    }
    
    func getLocationRickAndMorty(page: Int) async throws -> LocationRickAndMortyResponseModel {
        let url = URL(string: "https://rickandmortyapi.com/api/location?page=\(page)")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(LocationRickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return LocationRickAndMortyResponseModel(results: listData)
    }
}
