//
//  EpisodeViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import Foundation
import RxSwift

class EpisodeViewModel: ObservableObject {
    private let disposeBag = DisposeBag()

    @Published var episodeListRickAndMorty: [EpisodeModel] = []
    @Published var isLoading = false
    @Published var isSearchMode = false
    @Published var stopLoad = false

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUseCaseImpl(repository: RickAndMortyDataRepositoryImpl())) {
        self.usecase = usecase
    }

    @MainActor func getListEpisode(page: Int) {
        stopLoad = false
        isSearchMode = false
        isLoading = true
        usecase.getListEpisodeRickAndMorty(page: page)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.episodeListRickAndMorty.append(contentsOf: result.results)
            } onError: { error in
                self.stopLoad = true
                self.isLoading = false
                print(error)
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == episodeListRickAndMorty.count - 2
    }

    @MainActor func getSearchEpisode(name: String, page: Int) {
        stopLoad = false
        isSearchMode = true
        isLoading = true
        
        usecase.getSearchEpisode(name: name, page: page)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                if result.results.isEmpty {
                    self.stopLoad = true
                } else{
                    self.episodeListRickAndMorty.append(contentsOf: result.results)
                }
            } onError: {  error in
                self.isLoading = false
                self.stopLoad = true
                print(error)
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)

    }
}
