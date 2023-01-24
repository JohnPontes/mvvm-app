//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Caio Fabrini on 14/09/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedRegisterButton()
    func tappedBackButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Cadastrar"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite sua senha:"
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.turn.up.left.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        delegate?.tappedRegisterButton()
    }
    
    @objc func tappedBackButton(_ sender: UIButton) {
        delegate?.tappedBackButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 0.5)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(registerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            registerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 45),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    
}
