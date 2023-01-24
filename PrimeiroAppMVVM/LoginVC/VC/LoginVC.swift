//
//  ViewController.swift
//  testeViewCode2
//
//  Created by John Pontes on 03/12/22.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }

    
    
}

extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        guard let email = loginScreen?.emailTextField.text else { return }
        guard let password = loginScreen?.passwordTextField.text else { return }
        
        
        viewModel.login(email: email, password: password)
    }
    
    func tappedRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: LoginViewModelProtocol {
    func successLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func errorLogin(error: String) {
        let alert: Alert = Alert(controller: self)
        alert.showAlertInformation(title: "Ops, erro ao efetuar Login", message: error)
        print(error)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            print("botao desabilitado")
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .lightGray
        } else {
            print("botao habilitado")
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .blue
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


