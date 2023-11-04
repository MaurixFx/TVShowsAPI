//
//  TVShowsListView.swift
//
//
//  Created by Mauricio Figueroa on 04-11-23.
//

import SwiftUI

struct TVShowsListView: View {
    @AppStorage("setting") var setting = true
    @StateObject var viewModel = TvShowsViewModel()

    var body: some View {
        TabView {
            NavigationStack {
                VStack {
                    List(viewModel.tvShows, id: \.id) { tvShow in
                       TVShowView(tvShow: tvShow)
                    }
                    .navigationTitle("Popular")
                }
                .task {
                    await viewModel.fetch()
                }
            }
            .tabItem { Label("Home", systemImage: "house.fill") }
        }
    }
}
