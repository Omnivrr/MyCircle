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
            .navigationTitle("My Circle")
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return } // Check if the users array is empty
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")! // Create a URL object
            let (data, _) = try await URLSession.shared.data(from: url) // Fetch data from the URL
            
            let decoder = JSONDecoder() // Create a JSONDecoder object
            decoder.dateDecodingStrategy = .iso8601 // Set the date decoding strategy
            
            users = try decoder.decode([User].self, from: data) // Decode the data into an array of User objects
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
