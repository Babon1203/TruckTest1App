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
    
    var ticketID: String?
    
    
    var index = 0
    var index1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        guard let ticketID = ticketID else { return }
        
        switch ticketID.lowercased() {
            
        case "ticket 1":
            dataStore.questionsAll[index1] = DataStore.shared.questions1
            
        case "ticket 2":
            index1 += 1
            dataStore.questionsAll[index1] = DataStore.shared.questions2
        default:
            break
            
        }
        
        
    }
    
    
    var correctAnswerCount = 0
    var incorrectAnswerCount = 0
    
    func displayQuestion(at index: Int) {
        numberQuestion.text = "\(index+1)/\(dataStore.questionsAll[index1].count)"
        
        progressQuestion.progress = Float(index + 1) / Float(dataStore.questionsAll[index1].count)
        
        questionLabel.text = dataStore.questionsAll[index1][index].text
        answerOne.setTitle(dataStore.questionsAll[index1][index].answers[0], for: .normal)
        answerTwo.setTitle(dataStore.questionsAll[index1][index].answers[1], for: .normal)
        answerThree.setTitle(dataStore.questionsAll[index1][index].answers[2], for: .normal)
        answerFour.setTitle(dataStore.questionsAll[index1][index].answers[3], for: .normal)
    }
    
    @objc func checkAnswer(_ sender: UIButton) {
        
        let correctAnswer = dataStore.questionsAll[index1][index].correctAnswer
        if sender.currentTitle == correctAnswer {
            correctAnswerCount += 1
            correctAnswerLabel.text = "Correct! 🎉"
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
        if index + 1 < dataStore.questionsAll[index1].count {
            index += 1
            displayQuestion(at: index)
            resetAnswerButtons()
        } else {
            let alert = UIAlertController(title: "Test completed", message: "You answered \(correctAnswerCount) out of \(dataStore.questionsAll[index1].count) correctly", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        func resetAnswerButtons() {
            correctAnswerLabel.text = ""
            answerOne.tintColor = .systemBlue
            answerTwo.tintColor = .systemBlue
            answerThree.tintColor = .systemBlue
            answerFour.tintColor = .systemBlue
        }
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("Подготовка к переходу с ticketID в качестве отправителя: \(String(describing: sender))")
//        if segue.identifier == "showTest",
//           let destinationVC = segue.destination as? GeneralKnowledgeQuestion,
//           let ticketID = sender as? String {
//            destinationVC.ticketID = ticketID
//            print("Передаем ticketID: \(ticketID)")
//        } else {
//            print("Идентификатор перехода не совпадает или неправильный тип назначения")
//        }
//    }









}
