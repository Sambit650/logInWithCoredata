//
//  ProfileViewController.swift
//  DiatozAssignment
//
//  Created by Sambit Das on 18/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import CoreData



 let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
class ProfileViewController: UIViewController {
    
   

    var name2 : String!
    var email2 : String!
    var number2 : String!
    

    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        
              userName.text = "Name : \(name2!)"
              userEmail.text = "Email : \(email2!)"
              userNumber.text = "Number : \(number2!)"
       navigationItem.backBarButtonItem?.isEnabled = true
        
    }
    
   
       
    @IBAction func ShowEmployeeDetails(_ sender: Any) {
    
        self.performSegue(withIdentifier: "p2T", sender: nil)
        
    }
    
    @IBAction func onClickSignout(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
    
    }
    

}
