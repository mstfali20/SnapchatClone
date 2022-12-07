//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Mustafa Ali KILCI on 5.12.2022.
//

import UIKit

import FirebaseAuth

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailtext: UITextField!
    
 
    
    @IBOutlet weak var passwordtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sigininbtn(_ sender: Any) {
        if (passwordtext.text != "" || emailtext.text != "" ){
          
            
                
                Auth.auth().signIn(withEmail:emailtext.text!, password: passwordtext.text!) { authdata, error in
                    if error != nil {
                        self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "Error ")
                        
                    }else{
                        self.performSegue(withIdentifier: "tapBarVC", sender: nil)
                    }
                }
              

            
            
        }
        else
        {
            makealert(titleInput: "Error", MesageInput: "Username / Email ?")
            
        }
       
    }
    
    
    @IBAction func siginupbtn(_ sender: Any) {
        
        self.performSegue(withIdentifier: "siginupVC", sender: nil)
        
    }
    
    func makealert (titleInput:String , MesageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: MesageInput, preferredStyle: UIAlertController.Style.alert)
        let okbuton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,handler: nil)
        alert.addAction(okbuton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

