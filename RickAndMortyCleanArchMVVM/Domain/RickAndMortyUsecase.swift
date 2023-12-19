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

    func getListRickAndMorty() async throws -> [Character] {
        return try await repository.getListRickAndMorty()
    }
}
