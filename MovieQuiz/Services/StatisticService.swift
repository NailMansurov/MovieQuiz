//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Наиль Мансуров on 18.02.2025.
//

import Foundation

final class StatisticService: StatisticServiceProtocol {
    // MARK: - Private properties
    
    // Перечисление для работы с UserDefaults
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
        case questionsCount
        case correctAnswers
        case total
        case date
    }
    
    // Свойство для обращения к UserDefaults.standart
    private let storage: UserDefaults = .standard
    
    // Свойство общего количества заданных вопросов
    private var questionsCount: Int {
        get { return storage.integer(forKey: Keys.questionsCount.rawValue) }
        set { storage.set(newValue, forKey: Keys.questionsCount.rawValue) }
    }
    
    // Свойство общего количества правильных ответов
    private var correctAnswers: Int {
        get { return storage.integer(forKey: Keys.correctAnswers.rawValue) }
        set { storage.set(newValue, forKey: Keys.correctAnswers.rawValue) }
    }
    
    // MARK: - Public properties
    
    // Свойство общего количества игр
    var gamesCount: Int {
        get { return storage.integer(forKey: Keys.gamesCount.rawValue) }
        set { storage.set(newValue, forKey: Keys.gamesCount.rawValue) }
    }
    
    // Свойство для лучшей игры
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.correct.rawValue)
            let total = storage.integer(forKey: Keys.total.rawValue)
            let date = storage.object(forKey: Keys.date.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.date.rawValue)
        }
    }
    
    // Свойство расчета средней точности
    var totalAccuracy: Double {
        if (gamesCount == 0) { return 0 } else {
            return (Double(correctAnswers) / ( 10 * Double(gamesCount))) * 100
        }
    }
    
    // MARK: - Public methods
    
    // Метод сохранения результатов
    func store(correct count: Int, total amount: Int) {
        
        let current = bestGame
        let newValue: GameResult = GameResult(
            correct: count,
            total: amount,
            date: Date()
        )
        
        questionsCount += amount
        correctAnswers += count
        gamesCount += 1
        
        if newValue.isBetterThan(current) {
            storage.set(newValue.correct, forKey: Keys.correct.rawValue)
            storage.set(newValue.total, forKey: Keys.total.rawValue)
            storage.set(newValue.date, forKey: Keys.date.rawValue)
        }
        
    }
    
}
