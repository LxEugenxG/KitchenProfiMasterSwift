//////
//////  RecipesApi.swift
//////  KitchenProfiMaster
//////
//////  Created by Eugen Ganske on 18.11.22.
//////

import Foundation
import UIKit

struct RecipesApi {
    
    
    func getRecipes(query: String, completion: @escaping(ApiStruc) -> Void) {
        
        //MARK: 1. URL formen
        let urlString = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=\(query)&apiKey=dd14833cfbf344aea8f14968f6961b14"
        let url = URL(string: urlString)
        guard url != nil else { return }
        
        //MARK: 2. URL Session
        let session = URLSession.shared
        
        //MARK: 3. DataTask erstellen
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // Error handling
            if error == nil && data != nil {
                
                // JSON Decoder
                let decoder = JSONDecoder()
                
                do {
                    
                    let ingStructs = try decoder.decode(ApiStruc.self, from: data!)
                    completion(ingStructs)
                    
                } catch {
                    print("Error parsing JSON")
                }
                
            }
        }
        //MARK: 4. API Call starten / fortsetzen
        dataTask.resume()
    }
    
    
    func loadImage (id: Int, completion: @escaping(UIImage) -> Void ){
        
        
        //
        let url = URL(string: "https://spoonacular.com/recipeImages/\(id)-90x90")
        guard url != nil else { return }

        URLSession.shared.dataTask(with: url!){
            data, response ,error in
            print()
            guard let data = data, error == nil else { return }
                var image = UIImage(data: data)
                //let pathURL = getScreenShotDirectory() // URL
                //let pathString = pathURL.path
                completion(image ?? UIImage(systemName: "square.slash")!)
            
            
        }.resume()
        
    }
    
    
    
}
