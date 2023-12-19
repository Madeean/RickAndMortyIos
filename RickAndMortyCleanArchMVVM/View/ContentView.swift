//
//  ContentView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dataListRickAndMorty.results, id: \.id) { character in
                ItemListImageAndName(item: character)
            }.listStyle(.plain)
                .navigationTitle("Rick and Morty Characters")
        }
        .onAppear {
            // Call the function to fetch data when the view appears
            Task {
                await viewModel.getListRickAndMorty()
            }
        }
    }
}

struct ItemListImageAndName: View {
    var item: CharacterModel
    var body: some View {
        ZStack {
            HStack(alignment: .top, spacing: 20) {
                
                if item.image != "" {
                    WebImage(url: URL(string: item.image)).resizable().frame(width: 100, height: 100).cornerRadius(20)
                }else{
                    Image("NoImage").resizable().frame(width: 100, height: 100).cornerRadius(20)
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text(item.name).bold().font(.title2)
                    Text("\(item.species) - \(item.species)")
                }
                Spacer()
            }.padding().background(.backgroundList)
        }.cornerRadius(20).frame(minWidth: 0,
                                 maxWidth: .infinity,
                                 minHeight: 0,
                                 maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
