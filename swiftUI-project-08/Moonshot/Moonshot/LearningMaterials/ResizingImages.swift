//
//  ResizingImages.swift
//  Moonshot
//
//  Created by Syaoki Biek on 07/08/25.
//

import SwiftUI

struct ResizingImages: View {
    var body: some View {
        
        Image(.example)
            .frame(width: 300, height: 200)
            .clipped() // clipped use to only get the image based on following frame

        Image(.example)
            .resizable() // using resizesable will autoscale image following with the frame size or parent size
            .scaledToFill() // scare the source image to fill the space following frame
            .frame(width: 300, height: 200)
            .clipped()

        Image(.example)
            .resizable()
            .scaledToFit() // scale the source image to fit with the next settings
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            } // using containerRelativeFrame modifier like creating a limit size for the image following the axis choosen
    }
}

#Preview {
    ResizingImages()
}
