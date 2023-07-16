//
//  User.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import Foundation

// Define a struct called User that conforms to Identifiable and Codable protocols
struct User: Identifiable, Codable {
    let id: UUID // Unique identifier for the user
    let isActive: Bool // Indicates if the user is active or not
    let name: String // The user's name
    let age: Int // The user's age
    let company: String // The user's company
    let email: String // The user's email address
    let address:  String // The user's address
    let about: String // Information about the user
    let registered: Date // The date when the user registered
    let tags: [String] // An array of tags associated with the user
    let friends: [Friend] // An array of Friend objects representing the user's friends
}
