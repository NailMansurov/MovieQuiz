//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 11.03.2025.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
    
    func changeStateButtons(isEnabled: Bool)
}
