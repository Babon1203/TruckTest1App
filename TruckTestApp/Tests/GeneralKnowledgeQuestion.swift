//
//  GeneralKnowledgeQuestion.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 18.04.2024.
//



import UIKit

class GeneralKnowledgeQuestion: UIViewController {
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
    
    var ticketID: String? = ""
    
    
    var index = 0
    var index1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()

        loadQuestionsForTicket(ticketID)
        displayQuestion(at: index)
       
        
        
        answerOne.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerTwo.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerThree.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        answerFour.addTarget(self, action: #selector(checkAnswer(_:)), for: .touchUpInside)
        
        nextAnswer.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
    }
    
    
    func loadQuestionsForTicket(_ ticketID: String?) {
        print("Ticket ID received: \(String(describing: ticketID))")
        guard let ticketID = ticketID else {
            print("No ticket ID provided")
            return
        }
        
        // Словарь, сопоставляющий идентификаторы билетов с соответствующими массивами вопросов
        let questionsDictionary = [
            ticketID: dataStore.questionsAll[index1]
            
        ]
        
        if let questionsForTicket = questionsDictionary[ticketID] {
            index1 += 1
            
        } else {
            print("No questions found for \(ticketID). Please check the ticket ID and try again.")
        }
    }
    
    
    var correctAnswerCount = 0
    var incorrectAnswerCount = 0
    
    
    
    @objc func checkAnswer(_ sender: UIButton) {
        let correctAnswer = dataStore.questionsAll[index1][index].correctAnswer
        let allButtons = [answerOne, answerTwo, answerThree, answerFour]
        
        // Находим кнопку с правильным ответом
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
            
            // Выделяем кнопку с правильным ответом зелёным, если она найдена
            correctButton?.layer.borderWidth = 9
            correctButton?.layer.borderColor = UIColor.systemGreen.cgColor
        }
        // Отключаем все кнопки, чтобы считать только первое нажатие
        allButtons.forEach {
            $0?.isEnabled = false
//            $0?.layer.borderColor = nil
//            $0?.layer.borderWidth = 0
        }
    }
    
    @objc func nextQuestion() {
        resetButtons()
        if index + 1 < dataStore.questionsAll[index1].count {
            index += 1
            displayQuestion(at: index)
            
        } else {
            let alert = UIAlertController(title: "Test completed", message: "You answered \(correctAnswerCount) out of \(dataStore.questionsAll[index1].count) correctly", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
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
            numberQuestion.text = "\(index+1)/\(dataStore.questionsAll[index1].count)"
            
            progressQuestion.progress = Float(index + 1) / Float(dataStore.questionsAll[index1].count)
            
            questionLabel.text = dataStore.questionsAll[index1][index].text
            answerOne.setTitle(dataStore.questionsAll[index1][index].answers[0], for: .normal)
            answerTwo.setTitle(dataStore.questionsAll[index1][index].answers[1], for: .normal)
            answerThree.setTitle(dataStore.questionsAll[index1][index].answers[2], for: .normal)
            answerFour.setTitle(dataStore.questionsAll[index1][index].answers[3], for: .normal)
        }
    }
