//
//  ExploreViewModel.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 12/07/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListing() }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: fsiled to fetch lsitings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
