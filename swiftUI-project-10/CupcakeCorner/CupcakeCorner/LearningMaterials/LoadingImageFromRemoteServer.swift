//
//  LoadingImageFromRemoteServer.swift
//  CupcakeCorner
//
//  Created by Syaoki Biek on 07/09/25.
//

import SwiftUI

struct LoadingImageFromRemoteServer: View {
    var body: some View {
        // specific size of image we load for remote server
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
        // we can use place holder to generate loading state
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        
        // or we can define phase from image to create condition for loading state
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    LoadingImageFromRemoteServer()
}
