//
//  ListViewModel.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import Foundation
import RxSwift
import SwiftUI
class ListViewModel: ObservableObject {
    private let disposeBag = DisposeBag()

    @Published var dataListRickAndMorty: [CharacterModel] = []
    @Published var isLoading = false
    @Published var isSearchMode = false
    @Published var stopLoad = false

    private let usecase: RickAndMortyUsecase

    init(usecase: RickAndMortyUsecase = RickAndMortyUseCaseImpl(repository: RickAndMortyDataRepositoryImpl())) {
        self.usecase = usecase
    }

    @MainActor func getListRickAndMorty(page: Int) {
        stopLoad = false
        isSearchMode = false
        isLoading = true
        usecase.getListRickAndMorty(page: page)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.dataListRickAndMorty.append(contentsOf: result.results)
            } onError: { error in
                self.stopLoad = true
                self.isLoading = false
                print(error)
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }

    func shouldLoadData(id: Int) -> Bool {
        return id == dataListRickAndMorty.count - 2
    }

    @MainActor func getSearchEpisode(name: String, page: Int) {
        stopLoad = false
        isSearchMode = true
        isLoading = true

        usecase.getSearchCharacter(name: name, page: page)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                if result.results.isEmpty {
                    self.stopLoad = true
                } else {
                    self.dataListRickAndMorty.append(contentsOf: result.results)
                }
            } onError: { error in
                self.isLoading = false
                self.stopLoad = true
                print(error)
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
