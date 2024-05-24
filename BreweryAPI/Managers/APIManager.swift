//
//  APIManager.swift
//  BreweryAPI
//
//  Created by Kwong, Andreas (IRG) on 24/05/2024.
//

import Foundation

class APIManager: ObservableObject {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let baseURL: String = "https://api.openbrewerydb.org/v1/breweries"
    
    func searchFor(query: String, completion: @escaping ([APIResult]) -> Void) {
        let query = "/autocomplete?query=\(query)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, responses, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let results = try? decoder.decode([APIResult].self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(results)
            
        }
        task.resume()
    }
    
    func detailSearchFor(id: String, completion: @escaping ([APIDetailedResult]) -> Void) {
        let id = "/search?query=\(id)"
        
        guard let url = URL(string: baseURL + id) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, responses, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let results = try? decoder.decode([APIDetailedResult].self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(results)
            
        }
        task.resume()
    }
}
