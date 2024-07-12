//
//  DeveloperPreview.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 12/07/2024.
//

import Foundation


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John smith",
            ownerImageUrl: "user",
            numberOfBathrooms: 4,
            numberOfBedrooms: 3,
            numberOfGuests: 5,
            pricePerNight: 450,
            latitude: 25.7890,
            longitude: -80.1936,
            address: "123 Miami St",
            city: "Miami",
            state: "Florida",
            title: "Miami villa",
            rating: 4.53,
            features: [.superHost, .selfCheckIn],
            amentities: [.alarmSystem, .wifi, .kitchen, .balcony, .office],
            type: .villa,
            imageURLs: ["listing-1", "listing-2", "listing-4", "listing-3"]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John smith",
            ownerImageUrl: "user",
            numberOfBathrooms: 4,
            numberOfBedrooms: 3,
            numberOfGuests: 5,
            pricePerNight: 450,
            latitude: 25.7890,
            longitude: -80.1936,
            address: "123 Chicago St",
            city: "Los Angeles",
            state: "Calfornia",
            title: "Beautiful Cali",
            rating: 4.53,
            features: [.superHost, .selfCheckIn],
            amentities: [.alarmSystem, .wifi, .kitchen, .balcony, .office],
            type: .villa,
            imageURLs: ["listing-2", "listing-3", "listing-4", "listing-1"]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John smith",
            ownerImageUrl: "user",
            numberOfBathrooms: 4,
            numberOfBedrooms: 3,
            numberOfGuests: 5,
            pricePerNight: 450,
            latitude: 25.7890,
            longitude: -80.1936,
            address: "123 Chicago St",
            city: "Los Angeles",
            state: "Calfornia",
            title: "Beautiful Cali",
            rating: 4.53,
            features: [.superHost, .selfCheckIn],
            amentities: [.alarmSystem, .wifi, .kitchen, .balcony, .office],
            type: .villa,
            imageURLs: ["listing-3", "listing-4", "listing-1", "listing-2"]
        )
    ]
}
