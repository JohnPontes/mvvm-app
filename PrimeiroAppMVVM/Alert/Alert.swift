//
//  Alert.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 26/12/22.
//

import UIKit

class Alert {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            completion?()
        }
        alertController.addAction(ok)
        
        controller.present(alertController, animated: true)
        
    }
}
