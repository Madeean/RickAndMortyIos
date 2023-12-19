//
//  RickAndMortyModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
struct RickAndMortyModel : Codable {
    public var results: [CharacterModel]
}

struct CharacterModel: Codable,Identifiable{
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var image:String
}
