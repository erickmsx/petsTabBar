//
//  SignupViewController.swift
//  Pets
//
//  Created by Erick Martins on 13/11/21.
//

import UIKit

class SignupViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        navigationItem.title = "Cadastro"

    }
    
    func setupImageView(){
        
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = #colorLiteral(red: 0.5724719167, green: 0.1509509087, blue: 0.1439149976, alpha: 1)
    }
    
    

    @IBAction func selectImage(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func signup(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else{
            presentMessage(message: "O campo nome deve ser preenchido")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else{
            presentMessage(message: "O campo de email deve ser preenchido")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            presentMessage(message: "O campo de senha deve ser preenchido")
            return
        }
        
        guard let passwordConf = passwordConfTextField.text, !passwordConf.isEmpty else{
            presentMessage(message: "O campo de confirmação de senha deve ser preenchido")
            return
        }
        
        guard passwordConf == password else{
            presentMessage(message: "Campos de senha devem ser iguais")
            return
        }
        
        guard let image = imageView.image else{
            presentMessage(message: "Você precisa selecionar uma imagem para continuar")
            return
        }
        
        let user = User(name: name, email: email, password: password, image: image)
        users.append(user)
        presentMessage(message: "Usuário \(name) cadastrado com sucesso")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}
