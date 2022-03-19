//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 19/03/22.
//

import UIKit

public protocol AlertPresenter where Self: UIViewController {
    func presentAlert(title: String, message: String, firstActionText: String, secondActionText: String?, completion: ((UIAlertAction) -> Void)?)
}

public extension AlertPresenter {
    func presentAlert(title: String, message: String, firstActionText: String, secondActionText: String? = nil, completion: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstActionText, style: .default, handler: completion)
        alertController.addAction(firstAction)
        if let secondActionText = secondActionText {
            let secondAction = UIAlertAction(title: secondActionText, style: .default, handler: completion)
            alertController.addAction(secondAction)
        }
        present(alertController, animated: true, completion: nil)
    }
}
