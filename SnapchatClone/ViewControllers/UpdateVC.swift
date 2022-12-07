//
//  UpdateVC.swift
//  SnapchatClone
//
//  Created by Mustafa Ali KILCI on 7.12.2022.
//

import UIKit


class UpdateVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageview.isUserInteractionEnabled = true
        let gesturRecocgnizer = UITapGestureRecognizer(target: self, action: #selector(choseImages))
        imageview.addGestureRecognizer(gesturRecocgnizer)
        
    }
    
    
    @objc func choseImages(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        // pickerController.sourceType = .camera
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageview.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true , completion: nil)
    }

 

    @IBAction func savebtn(_ sender: Any) {
        
    }
}
