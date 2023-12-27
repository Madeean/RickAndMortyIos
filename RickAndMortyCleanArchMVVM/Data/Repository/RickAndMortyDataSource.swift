//
//  RickAndMortyRepository.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
import RxSwift

protocol RickAndMortyDatasource {
    func getListRickAndMorty(page:Int)  -> Observable<RickAndMortyResponseModel>
    func getListEpisodeRickAndMorty(page:Int) -> Observable<EpisodeRickAndMortyResponseModel>
    func getLocationRickAndMorty(page:Int)  -> Observable<LocationRickAndMortyResponseModel>
    
    func getSearchEpisode(name:String, page:Int) -> Observable<EpisodeRickAndMortyResponseModel>
    func getSearchCharacter(name:String, page:Int)  -> Observable<RickAndMortyResponseModel>
    func getSearchLocation(name:String, page:Int)  -> Observable<LocationRickAndMortyResponseModel>
}
