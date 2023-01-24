//
//  ViewController.swift
//  testeViewCode2
//
//  Created by John Pontes on 03/12/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
    
    
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        print("chegou na vc")
        guard let email = registerScreen?.emailTextField.text else { return }
        guard let password = registerScreen?.passwordTextField.text else { return }
        
        
        viewModel.registerUser(email: email, password: password)
    }
}

extension RegisterVC: RegisterViewModelProtocol {
    func successRegister() {
        let alert: Alert = Alert(controller: self)
        alert.showAlertInformation(title: "Parabéns", message: "Usuário cadastrado com sucesso!") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func errorRegister(error: String) {
        let alert: Alert = Alert(controller: self)
        alert.showAlertInformation(title: "Ops, erro ao cadastrar", message: error)
        print(error)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = registerScreen?.emailTextField.text ?? ""
        let password: String = registerScreen?.passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.backgroundColor = .lightGray
        } else {
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .blue
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


