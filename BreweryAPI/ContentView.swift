//
//  ContentView.swift
//  BreweryAPI
//
//  Created by Kwong, Andreas (IRG) on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    @State private var results: [APIResult] = []
    
    var body: some View {
        
        VStack {
            TextField("Enter search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print("New value is: \(newValue)")
                }
            Text("API Results:")
        }
    }
}

#Preview {
    ContentView()
}
