//
//  SignUpViewController.swift
//  TechcareerFinalProject
//
//  Created by İbrahim on 22.09.2022.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordConfirm: UITextField!
    @IBOutlet weak var activityIndicatior: UIActivityIndicatorView!
    
    var presenter: ViewToPresenterSignUpScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatior.isHidden = true
        SignUpScreenRouter.createModule(ref: self)

    }
    

    @IBAction func createAccount(_ sender: Any) {
        
        
        if let email = textFieldEmail.text, let password = textFieldPassword.text, let confirmPassword = textFieldPasswordConfirm.text {
            
            if password == confirmPassword {
                
                toggleActivityIndicator(hide: false)
                presenter?.signUp(email: email, password: password, completition: { [weak self] error in
                    
                    self?.toggleActivityIndicator(hide: true)
                    if !error {
                        self?.dismiss(animated: true)
                    }
                })
            }
        }
    }
    
    
    func toggleActivityIndicator(hide: Bool) {
        if hide {
            activityIndicatior.stopAnimating()
            activityIndicatior.isHidden = hide
        
        } else {
            activityIndicatior.startAnimating()
            activityIndicatior.isHidden = hide
        }
    }

}
