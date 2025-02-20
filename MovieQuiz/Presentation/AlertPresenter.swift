//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 15.02.2025.
//

import UIKit

class AlertPresenter {
    func showAlert(model: AlertModel, viewController: UIViewController) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            model.completion()
        }
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
