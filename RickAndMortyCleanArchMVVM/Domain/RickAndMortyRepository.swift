//
//  RickAndMortyRepository.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
protocol RickAndMortyRepository {
    func getListRickAndMorty(page:Int) async throws -> RickAndMortyModel
}
