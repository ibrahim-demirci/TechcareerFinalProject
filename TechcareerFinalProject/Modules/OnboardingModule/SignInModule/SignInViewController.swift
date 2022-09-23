//
//  SingInViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 21.09.2022.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: ViewToPresenterSignInScreenProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.isHidden = true
        SignInScreenRouter.createModule(ref: self)

    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        
        if let email = textFieldEmail.text, let password = textFieldPassword.text {
            toggleActivityIndicator(hide: false)
            
            presenter?.signIn(email: email, password: password, completition: { [weak self] isError in
                self?.toggleActivityIndicator(hide: true)
            })
                    
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: SegueID.showSignUpPageScreen.id, sender: nil)
    }
    
    func toggleActivityIndicator(hide: Bool) {
        if hide {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = hide
        
        } else {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = hide
        }
    }

}
