//
//  TVShowView.swift
//
//
//  Created by Mauricio Figueroa on 04-11-23.
//

import Foundation
import SwiftUI

struct TVShowView: View {
    let tvShow: TVShow

    var body: some View {
        HStack {
            AsyncImage(url: tvShow.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150.0, height: 150.0)
            
            Text(tvShow.name)
        }
    }
}
