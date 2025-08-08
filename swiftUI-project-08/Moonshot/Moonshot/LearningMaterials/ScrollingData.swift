//
//  ScrollingData.swift
//  Moonshot
//
//  Created by Syaoki Biek on 07/08/25.
//

import SwiftUI

struct customText1: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        self.text = text
        print("creating new custom text \(text)")
    }
}

struct customText2: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        self.text = text
        print("creating new custom lazy text \(text)")
    }
}

struct ScrollingData: View {
    var body: some View {
        ScrollView { // make content can be scrollable vertically and horizontally
            HStack {
                VStack(alignment: .center) {
                    ForEach(0..<100, id: \.self) {
                        customText1(text:("Items \($0)"))
                    }
                }.frame(maxWidth: .infinity)
                
                LazyVStack(alignment: .center) { // load the content only when it appear on the view
                    ForEach(0..<100, id: \.self) {
                        customText2(text:("Items \($0)"))
                    }
                }.frame(maxWidth: .infinity)
                
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollingData()
}
