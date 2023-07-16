//
//  ContentView.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decorder = JSONDecoder()
            decorder.dateDecodingStrategy = .iso8601
            users = try decorder.decode([User].self, from: data)
        } catch {
            print("Download failed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
