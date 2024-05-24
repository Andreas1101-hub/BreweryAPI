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
    
    @ObservedObject var apiManager = APIManager.shared
    
    var body: some View {
        
        VStack {
            TextField("Enter search item", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print("New value is: \(newValue)")
                    apiManager.searchFor(query: newValue) { results in
                        self.results = results
                    }
                }
            Text("API Results:")
            
            ForEach(results, id:\.id) { result in
                Text("\(result.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
