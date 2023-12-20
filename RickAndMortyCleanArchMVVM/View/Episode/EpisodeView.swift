//
//  EpisodeView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct EpisodeView: View {
    @ObservedObject private var viewModel = EpisodeViewModel()
    @State private var page: Int = 1
    @State private var searchEpisode: String = ""
    @State private var isSearchMode: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search Episode...", text: $searchEpisode).onSubmit {
                            page = 1
                            Task{
                                await viewModel.getSearchEpisode(name:searchEpisode, page:page)
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 18.0).fill(.backgroundList).strokeBorder(.black, style: StrokeStyle(lineWidth: 1.0)))
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 20)

                    List(viewModel.episodeListRickAndMorty, id: \.id) { character in
                        ItemEpisodeList(item: character)
                            .listRowSeparator(.hidden)
                            .onAppear {
                                if viewModel.shouldLoadData(id: character.id) {
                                    page += 1
                                    Task {
                                        await viewModel.getListEpisode(page: page)
                                    }
                                }
                            }
                    }
                    .listStyle(.plain)
                }

                if viewModel.isLoading {
                    VStack {
                        indicatorView()
                        Text("Please wait")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .secondary, radius: 20)
                }
            }
            .navigationBarTitle(Text("Episode"), displayMode: .inline)
        }
        .onAppear {
            // Call the function to fetch data when the view appears
            Task {
                await viewModel.getListEpisode(page: 1)
            }
        }
    }
}

private struct ItemEpisodeList: View {
    var item: EpisodeModel
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 20) {
                VStack(alignment: .leading) {
                    Text(item.name).bold().font(.title2)
                    Text(item.episode)
                    Text(item.air_date)
                }
                Spacer()
                Button {
                    print("episode button")
                } label: {
                    Text("Detail")
                }.padding().background(.blue).foregroundColor(.white).cornerRadius(20)
            }.padding().background(.backgroundList)
        }.cornerRadius(20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .shadow(color: .black.opacity(0.25), radius: 0.2, x: -1, y: 2)
    }
}

#Preview {
    EpisodeView()
}
