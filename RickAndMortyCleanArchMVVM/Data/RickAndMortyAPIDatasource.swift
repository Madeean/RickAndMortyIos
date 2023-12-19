//
//  RickAndMortyAPIDatasource.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
class RickAndMortyAPIDatasource: RickAndMortyDatasource {
    func getListRickAndMorty() async throws -> [Character] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let session = URLSession(configuration: .default)

        let (data, _) = try await session.data(from: url)

        let decoder = JSONDecoder()
        let response = try decoder.decode(RickAndMortyResponseModel.self, from: data)
        let listData = response.results

        return listData
    }
}
