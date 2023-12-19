//
//  ContentView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dataListRickAndMorty, id: \.id) { character in
                Text(character.name)
            }
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

#Preview {
    ContentView()
}
