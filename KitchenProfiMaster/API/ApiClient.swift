//
//  ApiClint.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 10.11.22.
//

import Foundation
import UIKit

struct ApiClient {
    
    
    func getIngredients(query: String, completion: @escaping(ApiStruc) -> Void) {
        
        //MARK: 1. URL formen
        let urlString = "https://api.spoonacular.com/food/ingredients/search?query=\(query)&apiKey=dd14833cfbf344aea8f14968f6961b14"
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
    
    // dowanload image from url.
    func loadImage (image: String, completion: @escaping(UIImage) -> Void ){
        
        
        //
        let url = URL(string: "https://spoonacular.com/cdn/ingredients_100x100/\(image)")
        guard url != nil else { return }

        URLSession.shared.downloadTask(with: url!){
            localurl,urlresponse,error in
            
            do {
                var image = UIImage(data: try Data(contentsOf: localurl!))
                //let pathURL = getScreenShotDirectory() // URL
                //let pathString = pathURL.path
                completion(image ?? UIImage(systemName: "square.slash")!)
            } catch {
                print("Error creating image")
            }
            
            
        }.resume()
        
    }
//    do {
//        guard let url = Bundle.main.url(forResource: "abc", withExtension:"txt") else {
//            return
//        }
//        let dataTwo = try Data(contentsOf: url)
//        // use dataTwo
//    } catch {
//        print(error)
//    }
    
    
    
}
