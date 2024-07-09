//
//  ExploreView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 07/07/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilter()
                        .onTapGesture {
                            withAnimation(.spring) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 40) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                    
            }
           
            }
        }
    }
}

#Preview {
    ExploreView()
}
