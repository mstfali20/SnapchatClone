//
//  profilVC.swift
//  SnapchatClone
//
//  Created by Mustafa Ali KILCI on 7.12.2022.
//

import UIKit
import FirebaseAuth

class profilVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logaoutbtn(_ sender: Any) {
        do{
             try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logautVs", sender: nil)
        
        }catch{print("Errorsssssssss" )}
        
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
