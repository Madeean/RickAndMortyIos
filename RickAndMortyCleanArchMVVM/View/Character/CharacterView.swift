//
//  CharacterView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import SDWebImageSwiftUI
import SwiftUI
struct CharacterView: View {
    @ObservedObject private var viewModel = ListViewModel()
    @State private var page: Int = 1
    @State private var searchCharacter: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack{
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search Character...", text: $searchCharacter).onSubmit {
                            viewModel.dataListRickAndMorty = []
                            page = 1
                            Task{
                                 viewModel.getSearchEpisode(name:searchCharacter   ,page:page)
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 18.0).fill(.backgroundList).strokeBorder(.black, style: StrokeStyle(lineWidth: 1.0)))
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 20)
                    
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(Array(viewModel.dataListRickAndMorty.enumerated()), id: \.offset) {index, character in
                                
                                characterItemView(item: character).padding(.bottom, 10).padding(.horizontal, 8).onAppear {
                                    if !viewModel.stopLoad{
                                        if viewModel.shouldLoadData(id: index) {
                                            page += 1
                                            Task {
                                                
                                                if viewModel.isSearchMode {
                                                    print("SearchMode \(searchCharacter) - page \(page)")
                                                     viewModel.getSearchEpisode(name: searchCharacter, page: page)
                                                }else{
                                                     viewModel.getListRickAndMorty(page: page)
                                                }
                                            }
                                        }
                                        
                                    } // stopload
                                }
                            }
                        }
                    }
                }.navigationBarTitle("Character", displayMode: .inline)
                    .onAppear {
                        Task {
                             viewModel.getListRickAndMorty(page: 1)
                        }
                    }
                
                if viewModel.isLoading {
                    VStack{
                        indicatorView()
                        Text("please wait")
                    }.padding().background(.white).cornerRadius(20).shadow(color: .secondary, radius: 20)
                }
            }
        }
    }
}

private struct characterItemView: View {
    var item: CharacterModel
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    AnimatedImage(
                        url: URL(string: item.image))
                        .resizable()
                        .indicator(SDWebImageActivityIndicator.medium)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    Spacer()
                }

                Text(item.name).lineLimit(1).fontWeight(.bold).font(.title3)
                Text(item.status)

            }.padding(.all, 18).background(.backgroundList)
        }.cornerRadius(20)
    }
}

#Preview {
    CharacterView()
}
