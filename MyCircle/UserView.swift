//
//  UserView.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import SwiftUI

struct UserView: View {
    let user: CachedUser // User object passed to the view
    
    var body: some View {
        List {
            Section {
                Text(user.wrappedAbout)
                    .padding(.vertical) // Display the user's "about" text with vertical padding
            } header: {
                Text("About") // Section header: "About"
            }
            
            Section {
                Text("Address: \(user.wrappedAddress)") // Display the user's address
                Text("Company: \(user.wrappedCompany)") // Display the user's company
            } header: {
                Text("Contact details") // Section header: "Contact details"
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName) // Display the name of each friend
                }
            } header: {
                Text("Friends") // Section header: "Friends"
            }
        }
        .listStyle(.grouped) // Apply a grouped list style to the view
        .navigationTitle(user.wrappedName) // Set the navigation title to the user's name
        .navigationBarTitleDisplayMode(.inline) // Display the navigation bar title in the inline mode
    }
}
