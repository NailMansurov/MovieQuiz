//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 15.02.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
