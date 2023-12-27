//
//  RickAndMortyAPIDatasource.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
import RxSwift
import Alamofire

class RickAndMortyAPIDatasource: RickAndMortyDatasource {
    func getSearchLocation(name: String, page: Int) -> Observable<LocationRickAndMortyResponseModel> {
        return Observable<LocationRickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/location?name=\(name)&page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: LocationRickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(LocationRickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getSearchCharacter(name: String, page: Int) -> Observable<RickAndMortyResponseModel> {
        
        return Observable<RickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/character?name=\(name)&page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(RickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    
    func getSearchEpisode(name: String, page: Int)  -> Observable<EpisodeRickAndMortyResponseModel> {
        return Observable<EpisodeRickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/episode?name=\(name)&page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: EpisodeRickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(EpisodeRickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getListRickAndMorty(page:Int)  -> Observable<RickAndMortyResponseModel> {
        return Observable<RickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(RickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
        
    }
    
    func getListEpisodeRickAndMorty(page: Int)  -> Observable<EpisodeRickAndMortyResponseModel>{
        
        return Observable<EpisodeRickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/episode?page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: EpisodeRickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(EpisodeRickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
        
    }
    
    func getLocationRickAndMorty(page: Int) -> Observable<LocationRickAndMortyResponseModel> {
        
        return Observable<LocationRickAndMortyResponseModel>.create{ observer in
            if let url = URL(string: "https://rickandmortyapi.com/api/location?page=\(page)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: LocationRickAndMortyResponseModel.self) { response in
                        switch response.result {
                        case let .success(value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onNext(LocationRickAndMortyResponseModel(results: []))
                            observer.onCompleted()
                        }
                    }
            }
            return Disposables.create()
        }
        
        
    }
}
