//
//  LoginViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 24/12/22.
//

import UIKit
import Firebase

protocol LoginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin(error: String)
}

class LoginViewModel {
    
    private weak var delegate: LoginViewModelProtocol?
    
    public func delegate(delegate: LoginViewModelProtocol) {
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucesso login")
                self.delegate?.successLogin()
            } else {
                print("error login, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(error: error?.localizedDescription ?? "")
            }
        }
    }
}

