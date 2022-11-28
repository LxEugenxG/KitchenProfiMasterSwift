//
//  RecipesViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 18.11.22.
//

import UIKit

class ShowRecipesCVC: UIViewController {
    
    let ingredientsAPI = ApiClient()
    let recipesAPI = RecipesApi()
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    var ingredientsList: [IngredientStruct]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(ingredientsList)
        tabelView.delegate = self
        tabelView.dataSource = self
        
        
    }
    
}

extension ShowRecipesCVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipesCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = ingredientsList[indexPath.row].name
        print(ingredientsList[indexPath.row].image)
        recipesAPI.loadImage(id: ingredientsList[indexPath.row].image!){
            image in
            DispatchQueue.main.async {
                content.image = image
                print("wo isch bild")
                print(image)
                cell.contentConfiguration = content
            }
            
        }
        
    return cell
    }
}
