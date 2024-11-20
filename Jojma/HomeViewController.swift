//
//  HomeViewController.swift
//  Jojma
//
//  Created by Hector Cruz on 04/11/24.
//

import UIKit
import FirebaseAuth

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {

    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var closesesionbutton: UIButton!
    
    private let email: String
    private let provider: ProviderType

    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
     }

     required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home";
        
        providerLabel.text = provider.rawValue
        emailLabel.text = email
    }

    @IBAction func closesessionButton(_ sender: Any) {
        
        switch provider {
          case .basic:
              do {
                  try Auth.auth().signOut()
                  navigationController?.popViewController(animated: true)
              } catch {
                  // Se ha producido un error
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

}

