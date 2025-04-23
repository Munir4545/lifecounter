//
//  ViewController.swift
//  lifecounter
//
//  Created by Munir Emam on 4/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loserLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    var playerViews : [PlayerView] = []
            
    @IBAction func addPlayerButton(_ sender: Any) {
        addPlayer()
    }
    
    func addPlayer() {
        let playerView = PlayerView(frame: .zero)
        playerView.playerNumber = playerViews.count+1
        playerView.lifeCount = 20
        
        playerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(playerView)

        playerViews.append(playerView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        checkLoserStatus()
        for _ in 1...4 {
            addPlayer()
        }
    }
    
//    func checkLoserStatus() {
//        if Player1 < 1 {
//            loserLabel.text = "Player 1 Loses"
//            loserLabel.isHidden = false
//        } else if Player2 < 0 {
//            loserLabel.text = "Player 2 Loses"
//            loserLabel.isHidden = false
//        }
//    }


}

