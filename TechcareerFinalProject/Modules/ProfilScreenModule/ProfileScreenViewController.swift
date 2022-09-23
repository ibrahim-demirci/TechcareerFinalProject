//
//  ProfileScreenViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 22.09.2022.
//

import UIKit
import FirebaseAuth

class ProfileScreenViewController: UIViewController {
    
    @IBOutlet weak var labelUserEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelUserEmail.text = Auth.auth().currentUser?.email
    }
    

    @IBAction func signOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}
