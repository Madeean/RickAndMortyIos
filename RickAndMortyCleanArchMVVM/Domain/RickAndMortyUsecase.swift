//
//  RickAndMortyUsecase.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
import RxSwift

protocol RickAndMortyUsecase {
    func getListRickAndMorty(page:Int) -> Observable<RickAndMortyModel>
    func getListEpisodeRickAndMorty(page:Int) -> Observable<EpisodeRickAndMortyModel>
    func getListLocationRickAndMorty(page:Int) -> Observable<LocationRickAndMortyModel>
    
    func getSearchEpisode(name:String, page:Int)  -> Observable<EpisodeRickAndMortyModel>
    func getSearchCharacter(name:String, page:Int) -> Observable<RickAndMortyModel>
    func getSearchLocation(name:String, page:Int) -> Observable<LocationRickAndMortyModel>
}
