//
//  ExploreView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @State var viewModel = ExploreViewModel(service: ExploreService())
    
    
    var body: some View {
        
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    SearchAndFilter(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.spring) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 40) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                    
            }
           
            }
        }
    }
}

#Preview {
    ExploreView()
}
