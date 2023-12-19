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
}
