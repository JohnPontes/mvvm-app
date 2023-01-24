//
//  LoginViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 24/12/22.
//

import UIKit
import Firebase

protocol RegisterViewModelProtocol: AnyObject {
    func successRegister()
    func errorRegister(error: String)
}

class RegisterViewModel {
    
    private weak var delegate: RegisterViewModelProtocol?
    
    public func delegate(delegate: RegisterViewModelProtocol) {
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucesso cadastro")
                self.delegate?.successRegister()
            } else {
                print("error cadastro, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorRegister(error: error?.localizedDescription ?? "")
            }
        }
    }
}
