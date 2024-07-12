//
//  ExploreService.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 12/07/2024.
//

import Foundation


class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
