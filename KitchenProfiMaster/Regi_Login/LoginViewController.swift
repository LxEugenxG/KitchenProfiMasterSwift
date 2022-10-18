//
//  LoginViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 16.09.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorLable: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setUpElements()
    }
    func setUpElements(){
        errorLable.alpha = 0
        
        Utilities.styleTextField(username)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(loginBtn)
    }
    
    
    @IBAction func logInBtn(_ sender: Any) {
        performSegue(withIdentifier: "addIngredients", sender: self)
        NotificationCenter.default.post(name: NSNotification.Name.init("Login"), object: username)
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


func isPasswordValid(_ password : String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
    
    
    
}
