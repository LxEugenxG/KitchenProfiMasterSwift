//
//  addIngredientsCVCViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit

class AddIngredientsCVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    

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

        cell.ingImageView.image = UIImage(named: "apple")
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

}
