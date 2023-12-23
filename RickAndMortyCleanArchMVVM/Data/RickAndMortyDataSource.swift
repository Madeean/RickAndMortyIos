//
//  RickAndMortyRepository.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
protocol RickAndMortyDatasource {
    func getListRickAndMorty(page:Int) async throws -> RickAndMortyResponseModel
    func getListEpisodeRickAndMorty(page:Int) async throws -> EpisodeRickAndMortyResponseModel
    func getLocationRickAndMorty(page:Int) async throws -> LocationRickAndMortyResponseModel
    
    func getSearchEpisode(name:String, page:Int) async throws -> EpisodeRickAndMortyResponseModel
    func getSearchCharacter(name:String, page:Int) async throws -> RickAndMortyResponseModel
    func getSearchLocation(name:String, page:Int) async throws -> LocationRickAndMortyResponseModel
}
