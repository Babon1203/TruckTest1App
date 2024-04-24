//
//  TicketGeneral.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 23.04.2024.
//

import UIKit

class TicketGeneral: UIViewController {
    
    
    @IBOutlet weak var ticketPushOne: UIButton!
    @IBOutlet weak var ticketPushTwo: UIButton!
    @IBOutlet weak var ticketPushThree: UIButton!
    @IBOutlet weak var ticketPushFour: UIButton!
    @IBOutlet weak var ticketPushFive: UIButton!
    @IBOutlet weak var ticketPushSix: UIButton!
    @IBOutlet weak var ticketPushSeven: UIButton!
    @IBOutlet weak var ticketPushEight: UIButton!
    
    var ticketID: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTicketButtons()
       
    }
    
    private func setupTicketButtons() {
        
        ticketPushOne.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushTwo.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushThree.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushFour.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushFive.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushSix.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushSeven.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        ticketPushEight.addTarget(self, action: #selector(ticketPressed(_:)), for: .touchUpInside)
        
        ticketPushOne.tag = 1
        ticketPushTwo.tag = 2
        ticketPushThree.tag = 3
        ticketPushFour.tag = 4
        ticketPushFive.tag = 5
        ticketPushSix.tag = 6
        ticketPushSeven.tag = 7
        ticketPushEight.tag = 8
        
        
    }
    
    @IBAction func ticketPressed(_ sender: UIButton) {
        let ticketID = "Ticket \(sender.tag)"
        print("Передаем ticketID: \(ticketID)")
        performSegue(withIdentifier: "show", sender: ticketID)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show",
           let destinationVC = segue.destination as? GeneralKnowledgeQuestion,
           let ticketID = sender as? String {  // Убедитесь, что sender действительно строка
            destinationVC.ticketID = ticketID
            print("Ticket ID передан корректно: \(ticketID)")
        } else {
            print("Ошибка: тип назначения не соответствует GeneralKnowledgeQuestion или ticketID не является строкой")
        }
    }

}
