//
//  SettingView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 20/12/23.
//

import SwiftUI

struct SettingView: View {
    @State var isDarkMode = false
    var body: some View {
        NavigationView{
            ZStack{
                List(){
                    HStack(alignment:.center){
                        Text (Image(systemName: "heart"))
                        Text("Favorite")
                    }.listRowInsets(EdgeInsets())
                    HStack{
                        Text(Image(systemName:"exclamationmark.circle"))
                        Text("About this page")
                    }.listRowInsets(EdgeInsets())
                    HStack{
                        Text(
                        Image(systemName: "moon.fill"))
                        Toggle("Dark mode",isOn: $isDarkMode)
                    }.listRowInsets(EdgeInsets())
                }.listStyle(.plain)
            }.navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

#Preview {
    SettingView()
}
