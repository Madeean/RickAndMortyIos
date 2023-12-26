//
//  RickAndMortyUsecase.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
protocol RickAndMortyUsecase {

    func getListRickAndMorty(page:Int) async throws -> RickAndMortyModel
    func getListEpisodeRickAndMorty(page:Int) async throws -> EpisodeRickAndMortyModel
    func getListLocationRickAndMorty(page:Int) async throws -> LocationRickAndMortyModel
    
    func getSearchEpisode(name:String, page:Int) async throws -> EpisodeRickAndMortyModel
    func getSearchCharacter(name:String, page:Int) async throws -> RickAndMortyModel
    func getSearchLocation(name:String, page:Int) async throws -> LocationRickAndMortyModel
    
}
