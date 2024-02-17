//
//  DetailEpisodeView.swift
//  RickAndMortyCleanArchMVVM
//
//  Created by made reihan on 26/12/23.
//

import SwiftUI

struct DetailEpisodeView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
            }
            .navigationBarTitle("Detail Episode", displayMode: .inline)
            .navigationBarItems(leading: NavigationBackTrailing {
                dismiss()
            }
            )
            .toolbarBackground(Color.green, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct NavigationBackTrailing: View {
    @State var dismiss: () -> Void
    var body: some View {
        Image(systemName: "arrow.backward").onTapGesture {
            dismiss()
        }
    }
}

#Preview {
    DetailEpisodeView()
}
