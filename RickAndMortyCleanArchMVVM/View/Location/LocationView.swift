//
//  LocationView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject private var viewModel = LocationViewModel()
    @State private var page: Int = 1
    @State private var searchLocation: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search Location...", text: $searchLocation).onSubmit {
                            viewModel.locationListRickAndMorty = []
                            page = 1
                            Task{
                                 viewModel.getSearchLocation(name:searchLocation, page:page)
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 18.0).fill(.backgroundList).strokeBorder(.black, style: StrokeStyle(lineWidth: 1.0)))
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 20)
                    
                    List() {
                        
                        ForEach(Array(viewModel.locationListRickAndMorty.enumerated()), id:\.offset){
                            index, location in
                            
                            ItemLocationList(item: location).listRowSeparator(.hidden).onAppear {
                                
                                if !viewModel.stopLoad {
                                    
                                    if viewModel.shouldLoadData(id: index) {
                                        
                                        page += 1
                                        
                                        Task{
                                            if viewModel.isSearchMode {
                                                
                                                 viewModel.getSearchLocation(name: searchLocation, page: page)
                                                
                                            } else{
                                                 viewModel.getListEpisode(page:page)
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }.listStyle(.plain)
                }

                if viewModel.isLoading {
                    VStack {
                        indicatorView()
                        Text("please wait")
                    }.padding().background(.white).cornerRadius(20).shadow(color: .secondary, radius: 20)
                }
            }.navigationBarTitle(Text("Location"), displayMode: .inline)
        }
        .onAppear {
            // Call the function to fetch data when the view appears
            Task {
                 viewModel.getListEpisode(page: 1)
            }
        }
    }
}

private struct ItemLocationList: View {
    var item: LocationModel
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 20) {
                VStack(alignment: .leading) {
                    Text(item.name).bold().font(.title2)
                    Text(item.type)
                    Text(item.dimension)
                }
                Spacer()
                Text("Detail").padding().background(.blue).foregroundColor(.white).cornerRadius(20).onTapGesture {
                    print("episode press")
                }
            }.padding().background(.backgroundList)
        }.cornerRadius(20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .shadow(color: .black.opacity(0.25), radius: 0.2, x: -1, y: 2)
    }
}

#Preview {
    LocationView()
}
