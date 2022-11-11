//
//  File.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 11.11.22.
//

import Foundation

struct ApiStruc: Codable{
    
    var results: [IngredientStruct]
    
    
    
}

struct IngredientStruct: Codable {
    
    var name: String?
    var id: Int?
    
}




