//
//  LoginViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseFirestore


class LoginViewController: UIViewController {
    
    //@IBOutlet weak var username: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
    }
    
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        
        Utilities.styleTextField(username)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let email = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let ingriedentsCV = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.AddIngredientsCVC) as?
                 AddIngredientsCVC
                 
                self.view.window?.rootViewController = ingriedentsCV
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 
 
 
 
 
 */
