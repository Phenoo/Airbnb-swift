//
//  ListingDetailView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let listing: Listing

    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1
        ))
            self._cameraPosition = State(initialValue: .region(region))
        
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading) {
                ListingItemCarouselView(listing: listing)
                    .frame(height: 300)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32,  height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack(spacing: 4){
                    Image(systemName: "star.fill")
                    Text("4.5")
                    Text(" - ")
                    Text("28 reviews")
                }
                .font(.caption2)
                .fontWeight(.semibold)
                Text("\(listing.city), \(listing.state)")
                    .font(.caption2)
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Divider()
            
            HStack{
                VStack(alignment: .leading){
                    Text("\(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        
                    Text("\(listing.numberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms  - \(listing.numberOfBathrooms) baths")
                        .font(.caption)
                }
                .frame(width: 250, alignment: .leading)
                
                Spacer()
                
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            VStack (alignment: .leading, spacing: 16){
                ForEach(listing.features) { feature in
                    HStack ( spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack (alignment: .leading ){
                            Text(feature.title)
                                .fontWeight(.semibold)
                                .font(.footnote)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        
                    }
                }
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bed in
                            VStack (alignment: .leading, spacing: 8){
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bed)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 130, height: 80)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
             
            Divider()
            
            VStack (alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                VStack ( spacing: 8){
                    ForEach(listing.amentities) { amentity in
                        HStack{
                            Image(systemName: amentity.imageName)
                            Text(amentity.title)
                            
                            Spacer()
                        }
                    }
                }
                
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where will you be?")
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 72)
        .overlay(alignment: .bottom){
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                        Text("Total before taxes")
                            .font(.caption)
                            
                        Text("Oct 16 - 20")
                            .font(.caption)
                            .underline()
                    }
                    .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
