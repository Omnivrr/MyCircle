//
//  ContentView.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]() // State property holding an array of User objects
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("My Circle") // Sets the navigation bar title
            
            // Executes the fetchUsers() method when the view appears
            .task {
                await fetchUsers()
            }
        }
    }
    
    // Asynchronous method to fetch users from a remote JSON API
    func fetchUsers() async {
        guard users.isEmpty else { return } // Check if the users array is empty
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")! // Create a URL object
            
            // Fetches data from the specified URL asynchronously
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder() // Create a JSONDecoder object
            decoder.dateDecodingStrategy = .iso8601 // Set the date decoding strategy
            
            // Decode the fetched data into an array of User objects
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download failed") // Print an error message if downloading or decoding fails
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
