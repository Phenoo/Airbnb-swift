//
//  ListingView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI

struct ListingItemView: View {
    var images = [
    "listing-5",
    "listing-5",
    "listing-5",
    "listing-5"
    ]
    
    var body: some View {
        VStack (spacing: 8) {
            //images
          ListingItemCarouselView()
                .frame(height:300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //;ising details
            HStack (alignment: .top){
                
                VStack (alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mil away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 10")
                        .foregroundStyle(.gray)
                    Text("$453 night")
                        .foregroundStyle(.black)
                }
                .font(.footnote)
                
                Spacer()
                
                HStack(spacing: 2) {
                 Image(systemName: "star.fill")
                    Text("4.4")
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ListingItemView()
}
