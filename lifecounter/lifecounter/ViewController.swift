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
        playerView.lifeCount = 20
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        checkLoserStatus()
        for _ in 1...4 {
            addPlayer()
        }
    }


}

