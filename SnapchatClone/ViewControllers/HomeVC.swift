//
//  HomeVC.swift
//  SnapchatClone
//
//  Created by Mustafa Ali KILCI on 7.12.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomeVC: UIViewController {
    let firibasefirestore = Firestore.firestore()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getdata (){
        firibasefirestore.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser?.email).getDocuments { snapshat, error in
            if error != nil {
                self.makealert(titleInput: "Error", MesageInput: error?.localizedDescription ?? "error")
            }else
            {
                //// burda kaldım 
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

    
    func makealert (titleInput:String , MesageInput:String){
        
        let alert = UIAlertController(title: titleInput, message: MesageInput, preferredStyle: UIAlertController.Style.alert)
        let okbuton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,handler: nil)
        alert.addAction(okbuton)
        self.present(alert, animated: true, completion: nil)
    }
}
