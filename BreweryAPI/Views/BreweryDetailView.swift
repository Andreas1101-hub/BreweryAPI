//
//  BreweryDetailView.swift
//  BreweryAPI
//
//  Created by Kwong, Andreas (IRG) on 24/05/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    
    @State var breweryId: String
    
    @ObservedObject var apiManager = APIManager.shared
    @State private var results: [APIDetailedResult] = []
    
    var body: some View {
        VStack {
            ForEach(results, id:\.id) { result in
                Text("\(result.name)")
                Text("\(result.address_1)")
                Text("\(result.city)")
                Text("\(result.country)")
            }
        }
        .onAppear {
            apiManager.detailSearchFor(id: breweryId) { results in
                self.results = results
            }
        }
    }
}

#Preview {
    BreweryDetailView(breweryId: "385a2831-a7d5-4d07-bcff-d9d3312c571c")
}
