//
//  GeneralKnowledgeQuestion.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 23.04.2024.
//

import UIKit

class GeneralKnowledgeQuestionPractice: UIViewController {
    let dataStore = DataStore()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressQuestion: UIProgressView!
    @IBOutlet weak var numberQuestion: UILabel!
    
    @IBOutlet weak var nextAnswer: UIButton!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerOne: UIButton!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion(at: index)
        
        answerOne.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerTwo.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerThree.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerFour.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        
        nextAnswer.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
    }
   
    var correctAnswerCount = 0
    var incorrectAnswerCount = 0
    
    func displayQuestion(at index: Int) {
        numberQuestion.text = "\(index+1)/\(dataStore.questions1.count)"
        
        progressQuestion.progress = Float(index + 1) / Float(dataStore.questions1.count)

        
        questionLabel.text = dataStore.questions1[index].text
        answerOne.setTitle(dataStore.questions1[index].answers[0], for: .normal)
        answerTwo.setTitle(dataStore.questions1[index].answers[1], for: .normal)
        answerThree.setTitle(dataStore.questions1[index].answers[2], for: .normal)
        answerFour.setTitle(dataStore.questions1[index].answers[3], for: .normal)
    }
    
    @objc func checkAnswer(_ sender: UIButton) {
        
        let correctAnswer = dataStore.questions1[index].correctAnswer
        if sender.currentTitle == correctAnswer {
            correctAnswerCount += 1
//            correctAnswerLabel.text = "Correct! 🎉"
            sender.tintColor = .systemGreen
            print(" правильно \(correctAnswerCount)")
        } else {
            incorrectAnswerCount += 1
            correctAnswerLabel.text = "CORRECT ANSWER: \(correctAnswer)"
            sender.tintColor = .systemRed
            
            print (" не правильно \(incorrectAnswerCount)")
        }
    }
    
    @objc func nextQuestion() {
        
        if index+1 < dataStore.questions1.count {
            index += 1
            displayQuestion(at: index)
            correctAnswerLabel.text = ""
            answerOne.tintColor = .systemBlue
            answerTwo.tintColor = .systemBlue
            answerThree.tintColor = .systemBlue
            answerFour.tintColor = .systemBlue
        } else {
            
        }
    }
}

