//
//  UserDetailViewController.swift
//  Pets
//
//  Created by Erick Martins on 15/11/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    let user: User
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUser()
        setupImageView()
    }
    
    func setupUser(){
        nameLabel.text = user.name
        imageView.image = user.image
    }
    
    func setupImageView(){
        
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = #colorLiteral(red: 0.5724719167, green: 0.1509509087, blue: 0.1439149976, alpha: 1)
    }
    
    @IBAction func logout(_ sender: Any) {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainMenuVC = mainStoryBoard.instantiateInitialViewController()
        UIApplication.shared.windows.first?.rootViewController = mainMenuVC
    }
    
}
