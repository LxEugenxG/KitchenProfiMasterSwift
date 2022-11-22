//
//  addIngredientsCVCViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit

class AddIngredientsCVC: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
       
        var content = cell.defaultContentConfiguration()
        content.text = ingredients[indexPath.row].name
       
        cell.contentView.layer.cornerRadius = 64
        cell.contentConfiguration = content
        return cell
    }
    
    
    @IBOutlet weak var tableIngridens: UITableView!
    
    
    let apiClient = ApiClient()
    
    // leerer array
    var ingredients = [IngredientStruct]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableIngridens.delegate = self
        tableIngridens.dataSource = self

        // Do any additional setup after loading the view.
    }


//    @IBOutlet weak var ingredientsCV: UICollectionView!
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ingredients.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ingredientCell", for: indexPath) as! IngDetailCollectionViewCell
//
//        cell.labelIngredients.text = ""
//        cell.contentView.layer.cornerRadius = 64
//        return cell
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func addBtnIngredients(_ sender: Any) {
        
        let apiClient = ApiClient()
        
        
        let alert = UIAlertController(title: "zutat Hinzufügen", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0].text
            
            if textField != nil {
                
                apiClient.getIngredients(query: textField!){ result in
                    print(result.results)
                    DispatchQueue.main.async {
                        if let ingredient = result.results.first{
                            self.ingredients.append(result.results.first!)
                        }
                        
                        self.tableIngridens.reloadData()
                        
                    }
                }
                
            }
            
            
            
            // Force unwrapping because we know it exists.
            //self.list.append(textField!.text!)
            
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBOutlet weak var ingredientsList: UIView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showRecipesCVC = segue.destination as! ShowRecipesCVC
        showRecipesCVC.ingredientsList = ingredients
    }
    
    
    
    
    
}

