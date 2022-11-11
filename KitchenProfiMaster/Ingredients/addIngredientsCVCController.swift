//
//  addIngredientsCVCViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit

class AddIngredientsCVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    let apiClient = ApiClient()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsCV.delegate = self
        ingredientsCV.dataSource = self

        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var ingredientsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ingredientCell", for: indexPath) as! IngDetailCollectionViewCell

        cell.labelIngredients.text = ""
        cell.contentView.layer.cornerRadius = 64
        return cell
    }
    

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
                        
                        
                        
                    }
                }
                
            }
            
            
            
            // Force unwrapping because we know it exists.
            //self.list.append(textField!.text!)
            self.ingredientsCV.reloadData()
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}

