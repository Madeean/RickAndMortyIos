//
//  RickAndMortyModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation

// CHARACTER
struct RickAndMortyModel : Codable {
    public var results: [CharacterModel]
}

struct CharacterModel: Codable,Identifiable, Hashable{
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var image:String
}



// EPISODE
struct EpisodeRickAndMortyModel: Codable{
    public var results : [EpisodeModel]
}

struct EpisodeModel : Codable, Identifiable{
    public var id:Int
    public var name:String
    public var air_date:String
    public var episode: String
    public var characters: [String]
    public var url:String
}

//LOCATION
struct LocationRickAndMortyModel: Codable{
    public var results: [LocationModel]
}

struct LocationModel:Codable,Identifiable{
    public var id:Int
    public var name:String
    public var type:String
    public var dimension: String
    public var residents: [String]
    public var url:String
}
