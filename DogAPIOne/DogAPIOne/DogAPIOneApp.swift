//
//  DogAPIOneApp.swift
//  DogAPIOne
//
//  Created by Kein Li on 2/11/24.
//

import SwiftUI

@main
struct DogAPIOneApp: App {
    
    @State private var viewModel = DogViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
