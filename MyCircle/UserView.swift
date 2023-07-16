//
//  UserView.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import SwiftUI

struct UserView: View {
    let user: User // User object passed to the view
    
    var body: some View {
        List {
            Section {
                Text(user.about)
                    .padding(.vertical) // Display the user's "about" text with vertical padding
            } header: {
                Text("About") // Section header: "About"
            }
            
            Section {
                Text("Address: \(user.address)") // Display the user's address
                Text("Company: \(user.company)") // Display the user's company
            } header: {
                Text("Contact details") // Section header: "Contact details"
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name) // Display the name of each friend
                }
            } header: {
                Text("Friends") // Section header: "Friends"
            }
        }
        .listStyle(.grouped) // Apply a grouped list style to the view
        .navigationTitle(user.name) // Set the navigation title to the user's name
        .navigationBarTitleDisplayMode(.inline) // Display the navigation bar title in the inline mode
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User.example)
    }
}
