//
//  OnboardingViewController.swift
//  timesheetIOS
//
//  Created by İbrahim Demirci on 30.03.2022.
//

import UIKit
import FirebaseAuth

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationSeconds: 2) {
            self.showInitialView()
        }
    }
    
    private func showInitialView() {
        
        Auth.auth().addStateDidChangeListener { auth, user in
            
            if (user != nil) {
                PresenterManager.shared.show(vc: .mainFeedController)
        
            } else {
                PresenterManager.shared.show(vc: .signInViewController)
                self.performSegue(withIdentifier: SegueID.showSignInPageScreen.id, sender: nil)
            }
        }
    }
}
