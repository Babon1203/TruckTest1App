//
//  GeneralKnowledgeQuestion.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 18.04.2024.
//

import UIKit

final class GeneralKnowledgeQuestion: UIViewController {
    let dataStore = DataStore()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressQuestion: UIProgressView!
    @IBOutlet weak var numberQuestion: UILabel!
    
    @IBOutlet weak var backAnswer: UIButton!
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
        backAnswer.addTarget(self, action: #selector(backQuestion), for: .touchUpInside)
    }
   
    
    func displayQuestion(at index: Int) {
        numberQuestion.text = "\(index+1)/\(dataStore.questions.count)"
        
        progressQuestion.progress = Float((dataStore.questions.count))
       
        
        questionLabel.text = dataStore.questions[index].text
        answerOne.setTitle(dataStore.questions[index].answers[0], for: .normal)
        answerTwo.setTitle(dataStore.questions[index].answers[1], for: .normal)
        answerThree.setTitle(dataStore.questions[index].answers[2], for: .normal)
        answerFour.setTitle(dataStore.questions[index].answers[3], for: .normal)
    }
    @objc func checkAnswer(_ sender: UIButton) {
        //    var index = 0
        
        let correctAnswer = dataStore.questions[index].correctAnswer
        if sender.currentTitle == correctAnswer {
            correctAnswerLabel.text = "Correct! 🎉"
            sender.tintColor = .green
            
        } else {
            correctAnswerLabel.text = "CORRECT ANSWER: \(correctAnswer)"
            sender.tintColor = .red
        }
    }
    @objc func nextQuestion() {

        if index+1 < dataStore.questions.count {
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
    @objc func backQuestion() {
        if index > 0 {
            index -= 1
            displayQuestion(at: index)
            correctAnswerLabel.text = ""
            answerOne.tintColor = .systemBlue
            answerTwo.tintColor = .systemBlue
            answerThree.tintColor = .systemBlue
            answerFour.tintColor = .systemBlue
        } else {
            backAnswer.isEnabled = true
        }
        }
    
}



