//
//  RickAndMortyResponseModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation

//Character
struct RickAndMortyResponseModel : Codable {
    public var results: [CharacterResponseModel]
}

struct CharacterResponseModel: Codable,Identifiable{
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var image:String
}

extension RickAndMortyResponseModel{
    static func transforms(model:RickAndMortyResponseModel) -> RickAndMortyModel{
        return RickAndMortyModel(
            results: model.results.map{ item in
                transform(model: item)
            }
        )
    }
    private static func transform(model:CharacterResponseModel) -> CharacterModel{
        return CharacterModel(id: model.id, name: model.name, status: model.status, species: model.species, image: model.image)
    }
}

//Episode

struct EpisodeRickAndMortyResponseModel:Codable{
    public var results:[EpisodeResponseModel]
}

struct EpisodeResponseModel:Codable,Identifiable{
    public var id:Int
    public var name:String
    public var air_date:String
    public var episode: String
    public var characters: [String]
    public var url:String
}

extension EpisodeRickAndMortyResponseModel{
    static func transforms(model:EpisodeRickAndMortyResponseModel) -> EpisodeRickAndMortyModel{
        return EpisodeRickAndMortyModel(
            results: model.results.map{ item in
                transform(model: item)
            }
        )
    }
    private static func transform(model:EpisodeResponseModel) -> EpisodeModel{
        return EpisodeModel(id: model.id, name: model.name, air_date: model.air_date, episode: model.episode, characters: model.characters, url: model.url)
    }
}

//Location

struct LocationRickAndMortyResponseModel:Codable{
    public var results:[LocationResponseModel]
}

struct LocationResponseModel:Codable,Identifiable{
    public var id:Int
    public var name:String
    public var type:String
    public var dimension: String
    public var residents: [String]
    public var url:String
}
extension LocationRickAndMortyResponseModel{
    static func transforms(model:LocationRickAndMortyResponseModel) -> LocationRickAndMortyModel{
        return LocationRickAndMortyModel(
            results: model.results.map{ item in
                transform(model: item)
            }
        )
    }
    private static func transform(model:LocationResponseModel) -> LocationModel{
        return LocationModel(id: model.id, name: model.name, type: model.type, dimension: model.dimension, residents: model.residents, url: model.url)
    }
}
