//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 15.02.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromSrver() // сообщение об успешной загрузке
    func didFailToLoadData(with error: Error) // сообщение об ошибке
}
