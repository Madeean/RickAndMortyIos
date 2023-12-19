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

    func getListRickAndMorty() async throws -> [Character] {
        return try await datasource.getListRickAndMorty()
    }
}
