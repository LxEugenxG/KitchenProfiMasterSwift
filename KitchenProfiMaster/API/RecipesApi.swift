////
////  RecipesApi.swift
////  KitchenProfiMaster
////
////  Created by Eugen Ganske on 18.11.22.
////
//
//import Foundation
//
//struct RecipesApi {
//    
//    
//    func getIngredients(query: String, completion: @escaping(ApiStruc) -> Void) {
//        
//        //MARK: 1. URL formen
//        let urlString = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=dd14833cfbf344aea8f14968f6961b14"
//        let url = URL(string: urlString)
//        guard url != nil else { return }
//        
//        //MARK: 2. URL Session
//        let session = URLSession.shared
//        
//        //MARK: 3. DataTask erstellen
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            // Error handling
//            if error == nil && data != nil {
//                
//                // JSON Decoder
//                let decoder = JSONDecoder()
//                
//                do {
//                    
//                    let ingStructs = try decoder.decode(ApiStruc.self, from: data!)
//                    completion(ingStructs)
//                    
//                } catch {
//                    print("Error parsing JSON")
//                }
//                
//            }
//        }
//        //MARK: 4. API Call starten / fortsetzen
//        dataTask.resume()
//    }
//    
//    
//    
//}
