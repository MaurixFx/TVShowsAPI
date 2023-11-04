//
//  TvShowsViewModel.swift
//
//
//  Created by Mauricio Figueroa on 04-11-23.
//

import Foundation
import SwiftUI

final class TvShowsViewModel: ObservableObject {
    @Published var tvShows: [TVShow] = []
    private let client = NetworkClient()
    
    @MainActor
    func fetch() async {
        do {
            tvShows = try await client.get(from: "https://api.themoviedb.org/3/tv/popular?language=en-US&page=1&api_key=5053e40ea242e368ea05850aa8b40f68")
        } catch {
            print("Error: ", error)
        }
    }
}
