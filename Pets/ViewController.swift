//
//  ViewController.swift
//  Pets
//
//  Created by Erick Martins on 30/10/21.
//

//windows + Shift + o = pesquisa por arquivo

import UIKit

var users: [User] = []

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty else{
            
            presentMessage(message: "O campo de email deve ser preenchido")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            
            presentMessage(message: "O campo de senha deve ser preenchido")
            return
        }
        
        for user in users{
            
            if user.email == email, user.password == password{
                goToPetsList(user: user)
                return
            }
        }
        
        presentMessage(message: "Email ou senha inválidos")
    }
    
    func goToPetsList(user: User){
        
        let petListVC = ListPetViewController(user: user)
        let navController = UINavigationController(rootViewController: petListVC)
        navController.navigationBar.tintColor = .white
        navController.navigationBar.barTintColor = #colorLiteral(red: 0.08400253206, green: 0.2153456509, blue: 0.4575619698, alpha: 1)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navController.tabBarItem.title = "Lista de pets"
        navController.tabBarItem.image = #imageLiteral(resourceName: "paw")
        
        let userDetailVC = UserDetailViewController(user: user)
        userDetailVC.tabBarItem.title = "Perfil"
        userDetailVC.tabBarItem.image = #imageLiteral(resourceName: "2354573-2")
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.barTintColor = #colorLiteral(red: 0.5724719167, green: 0.1509509087, blue: 0.1439149976, alpha: 1)
        tabBarController.viewControllers = [navController, userDetailVC]
        
        UIApplication.shared.windows.first?.rootViewController = tabBarController
    }
    
    @IBAction func goToSignup(_ sender: Any) {
        
        let signupVC = SignupViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
}

//Rembr: out of scope
//all the viewcontrollers have access to this method
extension UIViewController{
    
    //Pop-up Message
    func presentMessage(message: String){
        
        let alert = UIAlertController(title: "Pets", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

