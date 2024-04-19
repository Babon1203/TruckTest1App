//
//  QuestionAndAnswer.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 19.04.2024.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    
    
    struct Question {
        let text: String
        let answers: [String]
        let correctAnswer: String
        
    }
    var questions: [Question] = []
    init(){
        
        let question1 = Question(text: "Какое число является простым?", answers: ["7", "12", "25", "15"], correctAnswer: "7")
        let question2 = Question(text: "Что такое Swift?", answers: ["Фрукт", "Программирование", "Автомобиль", "Язык программирования"], correctAnswer: "Язык программирования")
        let question3 = Question(text: "Сколько планет в Солнечной системе?", answers: ["7", "8", "9", "10"], correctAnswer: "8")
        let question4 = Question(text: "Какой цвет у неба днем?", answers: ["Зеленый", "Синий", "Красный", "Желтый"], correctAnswer: "Синий")
        
        questions += [question1, question2, question3, question4]
    }
    
}
    
