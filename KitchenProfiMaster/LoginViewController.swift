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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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


