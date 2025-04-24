//
//  ViewController.swift
//  lifecounter
//
//  Created by Munir Emam on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var playerViews : [PlayerView] = []
    var gameStart = false
    var historyList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPlayer()
        addPlayer()
        addPlayer()
        addPlayer()
    }
            
    @IBAction func addPlayerButton(_ sender: Any) {
        addPlayer()
    }
    
    func addPlayer() {
        checkGameStart()
        if gameStart {
            alertMessage(title: "Changing", message: "Game started cannot change")
            return
        }

        if playerViews.count == 8 {
            alertMessage(title: "Maximum", message: "Can only have a maximum of 8 players")
            return
        }
        
        
        
        let playerView = PlayerView(frame: .zero)
        playerView.playerNumber = playerViews.count+1
        playerView.viewController = self
        playerView.lifeCount = 20
        
        guard stackView != nil else {
            return
        }
        
        stackView.addArrangedSubview(playerView)

        playerViews.append(playerView)
        
    }
    
    @IBAction func removePlayer(_ sender: Any) {
        checkGameStart()
        if gameStart {
            alertMessage(title: "Changing", message: "Game started cannot change")
            return
        }
                
        if playerViews.count == 2 {
            alertMessage(title: "Players", message: "cannot go below 2 players")
            return
        }
        
        let removed = playerViews.removeLast()
        stackView.removeArrangedSubview(removed)
        removed.removeFromSuperview()
    }
    
    func checkGameStart() {
        for player in playerViews {
            if player.lifeCount != 20 && gameStart == false {
                gameStart = true
            }
        }
    }
    
    func alertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    func historyProcess(player: Int, amount: Int) {
        var change = "Player \(player)"
        if amount > 0 {
            change += " gained \(amount)"
        } else {
            change += " lost \(abs(amount))"
        }
        historyList.append(change)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HistorySegue" {
            if let HistoryViewController = segue.destination as? HistoryViewController {
                HistoryViewController.history = self.historyList
            }
        }
    }

}

