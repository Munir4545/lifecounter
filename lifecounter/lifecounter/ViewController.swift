//
//  ViewController.swift
//  lifecounter
//
//  Created by Munir Emam on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Player1Life: UILabel!
    @IBOutlet weak var Player2Life: UILabel!
    @IBOutlet weak var loserLabel: UILabel!
    
    var Player1 : Int = 20
    var Player2 : Int = 20
    
    @IBAction func player1AddOne(_ sender: Any) {
        self.Player1 += 1
        Player1Life.text = String(self.Player1)
        checkLoserStatus()
    }
    
    @IBAction func player1AddFive(_ sender: Any) {
        self.Player1 += 5
        Player1Life.text = String(self.Player1)
        checkLoserStatus()
    }
    
    @IBAction func player1RemoveOne(_ sender: Any) {
        self.Player1 -= 1
        Player1Life.text = String(self.Player1)
        checkLoserStatus()
    }
    
    @IBAction func player1RemoveFive(_ sender: Any) {
        self.Player1 -= 5
        Player1Life.text = String(self.Player1)
        checkLoserStatus()
    }
    
    @IBAction func player2AddOne(_ sender: Any) {
        self.Player2 += 1
        Player2Life.text = String(self.Player2)
        checkLoserStatus()
    }
    
    @IBAction func player2AddFive(_ sender: Any) {
        self.Player2 += 5
        Player2Life.text = String(self.Player2)
        checkLoserStatus()
    }
    
    @IBAction func player2RemoveOne(_ sender: Any) {
        self.Player2 -= 1
        Player2Life.text = String(self.Player2)
        checkLoserStatus()
    }
    
    @IBAction func player2RemoveFive(_ sender: Any) {
        self.Player2 -= 5
        Player2Life.text = String(self.Player2)
        checkLoserStatus()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkLoserStatus()
    }
    
    func checkLoserStatus() {
        if Player1 < 1 {
            loserLabel.text = "Player 1 Loses"
            loserLabel.isHidden = false
        } else if Player2 < 0 {
            loserLabel.text = "Player 2 Loses"
            loserLabel.isHidden = false
        }
    }


}

