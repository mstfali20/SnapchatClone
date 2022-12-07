//
//  SignUpVC.swift
//  SnapchatClone
//
//  Created by Mustafa Ali KILCI on 7.12.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailtext: UITextField!
    
    @IBOutlet weak var usernametext: UITextField!
    
    @IBOutlet weak var passwordtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func geribtn(_ sender: Any) {
        
        
        
        
        self.performSegue(withIdentifier: "oneVC", sender: nil)
        
        
    }
    
    @IBAction func siginuptext(_ sender: Any) {
        
        
        if (usernametext.text != "" || emailtext.text != "" ){
            if passwordtext.text != "" {
                
                Auth.auth().createUser(withEmail: emailtext.text!, password: passwordtext.text!) { autdata, error in
                    if error != nil {
                        self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error ")
                        
                    }else{
                        let firistore = Firestore.firestore()
                        let userDictionary = ["email" : self.emailtext.text!, "username" : self.usernametext.text! ] as [String : Any]
                        firistore.collection("UserInfo").addDocument(data: userDictionary){(error) in
                            
                            if error != nil {
                                self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error")
                            }
                        }
                        
                        
                        
                        self.performSegue(withIdentifier: "oneVC", sender: nil)
                        
                      
                        
                    }
                }
                
                
          
                
                
            }else {
               
                makealert(titleInput: "Error", MesageInput: "Password ?")
            }
            
            
        }
        else
        {
            makealert(titleInput: "Error", MesageInput: "Username / Email ?")
            
        }
        
        
        
        
        
        
        
   
    }
    func makealert (titleInput:String , MesageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: MesageInput, preferredStyle: UIAlertController.Style.alert)
        let okbuton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,handler: nil)
        alert.addAction(okbuton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
