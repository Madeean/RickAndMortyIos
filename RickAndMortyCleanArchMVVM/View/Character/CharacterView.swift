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
    @State private var isSearchMode: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack{
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search Character...", text: $searchCharacter).onSubmit {
                            page = 1
                            Task{
                                await viewModel.getSearchEpisode(name:searchCharacter   ,page:page)
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
                            ForEach(viewModel.dataListRickAndMorty, id: \.self) { character in
                                
                                characterItemView(item: character).padding(.bottom, 10).padding(.horizontal, 8).onAppear {
                                    if viewModel.shouldLoadData(id: character.id) {
                                        page += 1
                                        Task {
                                            await viewModel.getListRickAndMorty(page: page)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.navigationBarTitle("Character", displayMode: .inline)
                    .onAppear {
                        Task {
                            await viewModel.getListRickAndMorty(page: 1)
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
