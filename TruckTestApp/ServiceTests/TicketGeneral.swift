//
//  TicketGeneral.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 23.04.2024.
//

import UIKit

class TicketGeneral: UIViewController {
    
    @IBOutlet var ticketButtons: [UIButton]!
    var ticketID: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTicketButtons()
    }
    
    private func setupTicketButtons() {
        for (index, button) in ticketButtons.enumerated() {
            button.tag = index + 1
            button.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc func ticketPressed(_ sender: UIButton) {
        // Используем заглавную букву для Ticket для унификации
        let ticketID = "Ticket \(sender.tag)"
        performSegue(withIdentifier: "showTest", sender: "Ticket \(sender.tag)")
        print("Ticket ID received: \(String(describing: ticketID))")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Подготовка к переходу с ticketID в качестве отправителя: \(String(describing: sender))")
        if segue.identifier == "showTest",
           let destinationVC = segue.destination as? GeneralKnowledgeQuestion,
           let ticketID = sender as? String {
            destinationVC.ticketID = ticketID
            print("Передаем ticketID: \(ticketID)")
        } else {
            print("Идентификатор перехода не совпадает или неправильный тип назначения")
        }
    }
}

