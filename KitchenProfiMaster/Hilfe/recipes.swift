//
//  Recipes.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 18.11.22.
//

import UIKit

class Recipes: UIViewController {
    
    
    var text: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredientsTVC = segue.destination as! ShowRecipesCVC
    }

    
 

}
