//
//  RickAndMortyAPIDatasource.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class RickAndMortyAPIDatasource: RickAndMortyDatasource {
    func getSearchLocation(name: String, page: Int) async throws -> LocationRickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/location?name=\(name)&page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(LocationRickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return LocationRickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return LocationRickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
    }
    
    func getSearchCharacter(name: String, page: Int) async throws -> RickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/character?name=\(name)&page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(RickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return RickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return RickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
    }
    
    
    func getSearchEpisode(name: String, page: Int) async throws -> EpisodeRickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/episode?name=\(name)&page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(EpisodeRickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return EpisodeRickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return EpisodeRickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
        
        
    }
    
    func getListRickAndMorty(page:Int) async throws -> RickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(RickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return RickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return RickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
    }
    
    func getListEpisodeRickAndMorty(page: Int) async throws -> EpisodeRickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(EpisodeRickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return EpisodeRickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return EpisodeRickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
    }
    
    func getLocationRickAndMorty(page: Int) async throws -> LocationRickAndMortyResponseModel {
        do {
            let url = URL(string: "https://rickandmortyapi.com/api/location?page=\(page)")!
            let session = URLSession(configuration: .default)

            let (data, _) = try await session.data(from: url)

            let decoder = JSONDecoder()
            let response = try decoder.decode(LocationRickAndMortyResponseModel.self, from: data)

            guard !response.results.isEmpty else {
                throw RickAndMortyError.emptyData
            }

            let listData = response.results

            return LocationRickAndMortyResponseModel(results: listData)
        } catch {
            // Handle errors here
            if let rickAndMortyError = error as? RickAndMortyError {
                // Handle specific error
                print("Rick and Morty API Error: \(rickAndMortyError.localizedDescription)")
            } else {
                // Handle other errors
                print("Unexpected error: \(error.localizedDescription)")
            }
            return LocationRickAndMortyResponseModel(results: [])
            // You might want to return a default or special value or call a completion handler with an error
            // return RickAndMortyResponseModel(results: [])
        }
    }
}
