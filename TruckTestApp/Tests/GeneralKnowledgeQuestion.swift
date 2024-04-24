//
//  GeneralKnowledgeQuestion.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 18.04.2024.
//



import UIKit

class GeneralKnowledgeQuestion: UIViewController {
    
    var dataStore = DataStore.shared
    var questions: [DataStore.Question] = []
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressQuestion: UIProgressView!
    @IBOutlet weak var numberQuestion: UILabel!
    
    @IBOutlet weak var nextAnswer: UIButton!
    
   
    
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerOne: UIButton!
    
    var ticketID: String = ""
    
    var index = 0
    var index1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        displayQuestion(at: index)
        loadQuestionsForTicket(ticketID)
        resetButtons()
        
        
        answerOne.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerTwo.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerThree.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerFour.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        
        nextAnswer.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
    }
    
    
    func loadQuestionsForTicket(_ ticketID: String? ) {
        let ticketID = ticketID
        print("OK ID")
        if ticketID == "Ticket 1" {
            DataStore.shared.questionsAll[index1] = dataStore.questions1
            print("вопросы1")
        } else if ticketID == "Ticket 2" {
            DataStore.shared.questionsAll[index1] = dataStore.questions2
            print("вопросы2")
        } else {
            return
            print("Unexpected ticket ID: \(ticketID ?? nil)")
        }
    }
    
    var correctAnswerCount = 0
    var incorrectAnswerCount = 0
    
    
    
    @objc func checkAnswer(_ sender: UIButton) {
        let correctAnswer = dataStore.questionsAll[index1][index].correctAnswer
        let allButtons = [answerOne, answerTwo, answerThree, answerFour]
        
        
        if let correctButton = allButtons.first(where: { $0?.currentTitle == correctAnswer }) {
            if sender.currentTitle == correctAnswer {
                correctAnswerCount += 1
                print("правильно \(correctAnswerCount)")
            } else {
                sender.layer.borderWidth = 9
                    sender.layer.borderColor = UIColor.systemRed.cgColor
                incorrectAnswerCount += 1
                print("не правильно \(incorrectAnswerCount)")
            }
            
          
            correctButton?.layer.borderWidth = 9
            correctButton?.layer.borderColor = UIColor.systemGreen.cgColor
        }
       
        allButtons.forEach {
            $0?.isEnabled = false
            nextAnswer.isEnabled = true

        }
    }
    
    @objc func nextQuestion() {
        resetButtons()
        if index + 1 < dataStore.questionsAll[index1].count {
            index += 1
            displayQuestion(at: index)
        } else {
            let alert = UIAlertController(title: "Test completed", message: "You answered \(correctAnswerCount) out of \(dataStore.questionsAll[index1].count) correctly", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
        func resetButtons() {
            let allButtons = [answerOne, answerTwo, answerThree, answerFour]
            allButtons.forEach { button in
                button?.isEnabled = true
                button?.layer.borderWidth = 0
                button?.layer.borderColor = UIColor.clear.cgColor
            }
        }
        func displayQuestion(at index: Int) {
            resetButtons()
            nextAnswer.isEnabled = false
            numberQuestion.text = "\(index+1)/\(dataStore.questionsAll[index1].count)"
            
            progressQuestion.progress = Float(index + 1) / Float(dataStore.questionsAll[index1].count)
            
            questionLabel.text = dataStore.questionsAll[index1][index].text
            answerOne.setTitle(dataStore.questionsAll[index1][index].answers[0], for: .normal)
            answerTwo.setTitle(dataStore.questionsAll[index1][index].answers[1], for: .normal)
            answerThree.setTitle(dataStore.questionsAll[index1][index].answers[2], for: .normal)
            answerFour.setTitle(dataStore.questionsAll[index1][index].answers[3], for: .normal)
        }
    
    }
