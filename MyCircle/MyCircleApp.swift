//
//  MyCircleApp.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//

import SwiftUI

@main
struct MyCircleApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
