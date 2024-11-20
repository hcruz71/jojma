//
//  AuthViewController.swift
//  Jojma
//
//  Created by Hector Cruz on 04/11/24.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Inicio de sesión";
    }
    
    @IBAction func signinEmail(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let result = result, error == nil {
                        self.navigationController?.pushViewController(
                            HomeViewController (email: result.user.email!, provider: .basic),
                            animated: true
                        )
                    } else {
                        let alertController = UIAlertController(
                            title: "Error",
                            message: "Se ha producido un error registrando el usuario",
                            preferredStyle: .alert
                        )
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
    }
    
    @IBAction func loginEmail(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let result = result, error == nil {
                        self.navigationController?.pushViewController(
                            HomeViewController (email: result.user.email!, provider: .basic),
                            animated: true
                        )
                    } else {
                        let alertController = UIAlertController(
                            title: "Error",
                            message: "Se ha producido un error registrando el usuario",
                            preferredStyle: .alert
                        )
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
    }
    
    
}

