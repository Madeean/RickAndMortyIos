//
//  RickAndMortyResponseModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
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

