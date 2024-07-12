//
//  ListingView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    
    
    var body: some View {
        VStack (spacing: 8) {
            //images
          ListingItemCarouselView(listing: listing)
                .frame(height:300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //;ising details
            HStack (alignment: .top){
                
                VStack (alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mil away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 10")
                        .foregroundStyle(.gray)
                    Text("$\(listing.pricePerNight) night")
                        .foregroundStyle(.black)
                }
                .font(.footnote)
                
                Spacer()
                
                HStack(spacing: 2) {
                 Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
