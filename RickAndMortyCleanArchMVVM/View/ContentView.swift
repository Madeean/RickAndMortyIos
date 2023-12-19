//
//  ContentView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ListViewModel()
    @State private var page:Int = 1

    var body: some View {
        NavigationView {
            ZStack{
                List(viewModel.dataListRickAndMorty, id: \.id) { character in
                    ItemListImageAndName(item: character).onAppear{
                        if viewModel.shouldLoadData(id: character.id) {
                            page += 1
                            Task{
                                await viewModel.getListRickAndMorty(page:page)
                            }
                        }
                    }
                }.listStyle(.plain)
                    .navigationTitle("Rick and Morty Characters")
                
                if viewModel.isLoading {
                    VStack{
                        indicatorView()
                        Text("please wait")
                    }.padding().background(.white).cornerRadius(20).shadow(color: .secondary, radius: 20)
                }
            }
        
        }
        .onAppear {
            // Call the function to fetch data when the view appears
            Task {
                await viewModel.getListRickAndMorty(page: 1)
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

struct indicatorView: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.red
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

#Preview {
    ContentView()
}
