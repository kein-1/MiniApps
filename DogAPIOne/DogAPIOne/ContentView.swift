//
//  ContentView.swift
//  DogAPIOne
//
//  Created by Kein Li on 2/11/24.
//  Created for learning purposes. App should fetch a new fact with each refresh or click of
//  a button. Practice MVVM, JSON, Networking, Async/Await

import SwiftUI

struct ContentView: View {
    
    var viewModel : DogViewModel
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(viewModel.dogs, id: \.self) { dog in
                    Text(dog.data[0].attributes.body)
                }
                .onDelete(perform: viewModel.deleteFact)
            }
            .listStyle(.plain)
            .refreshable {
                await viewModel.fetchData()
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        Task {
                            await viewModel.fetchData()
                        }
                    } label: {
                        Label("Get New Fact", systemImage: "arrow.clockwise")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
            .navigationTitle("Dog facts ")
        }
    }
}

#Preview {
    @State var viewModel = DogViewModel()
    
    return ContentView(viewModel: viewModel)
}
