//
//  ListingItemCarouselView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI

struct ListingItemCarouselView: View {
    var images = [
    "listing-5",
    "listing-5",
    "listing-5",
    "listing-5"
    ]
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingItemCarouselView()
}
