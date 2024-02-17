//
//  ContentView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 19/12/23.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct ContentView: View {

    var body: some View {
        ZStack{
            TabView{
                EpisodeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                CharacterView()
                    .tabItem {
                        Image(systemName: "person.fill.questionmark")
                        Text("Character")
                    }
                LocationView()
                    .tabItem {
                        Image(systemName: "location.fill")
                        Text("Location")
                    }
                SettingView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Setting")
                    }
            }
        }
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
