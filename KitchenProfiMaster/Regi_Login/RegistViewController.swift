//
//  RegistViewController.swift
//  KitchenProfiMaster
//
//  Created by Eugen Ganske on 17.10.22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseFirestore

class RegistViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passordRep: UITextField!
    
    @IBOutlet weak var regiButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleTextField(username)
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleTextField(passordRep)
        Utilities.styleFilledButton(regiButton)
    }
    
    
    func validateFields() -> String?{
        
        if username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passordRep.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
             {
            
            return "Bitte fülle alle felder aus."
        }
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let cleanedPasswordRep = passordRep.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Bitte stellen Sie sicher, dass Ihr Passwort muss mindestens 8 Zeichen lang ist, ein Sonderzeichen und eine Zahl enthält."
        }
        if cleanedPassword != cleanedPasswordRep{
            return "Passwörter stimmen nicht überein"
        }
        
        return nil
    }
    
    
    @IBAction func logInBtn(_ sender: Any) {
        //performSegue(withIdentifier: "addIngredients", sender: self)
        //NotificationCenter.default.post(name: NSNotification.Name.init("Login"), object: username)
        
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else{
            
            let username = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil{
                    self.showError("E-Mail Adresse existiert bereits")
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username":username,  "uid": result!.user.uid]) { (error) in
                        
                        if error != nil{
                            self.showError("Error saving user data")
                        
                    }
                        
                    }
                    
                    self.transitionToHome()
                    
                }
                
            }
            
        }
    }
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        //let AddIngredients = storyboard?.instantiateInitialViewController(identifier: Constants.Storyboard.AddIngredientsCVC) as?
        //AddIngredientsCVC
        
       let ingriedentsCV = storyboard?.instantiateViewController(identifier: Constants.Storyboard.AddIngredientsCVC) as?
        AddIngredientsCVC
        
        view.window?.rootViewController = ingriedentsCV
        view.window?.makeKeyAndVisible()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


