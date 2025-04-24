//
//  PlayerView.swift
//  lifecounter
//
//  Created by Munir Emam on 4/23/25.
//

import UIKit

class PlayerView: UIView {
    @IBOutlet weak var PlayerLabel: UILabel!
    @IBOutlet weak var LifeCountLabel: UILabel!
    
    @IBOutlet weak var textInput: UITextField!
    
    weak var viewController: ViewController?
    
    var playerNumber : Int = 0
    var lifeCount: Int = 20 {
        didSet {
            playerLabel()
            
            if lifeCount != oldValue {
                viewController?.historyProcess(player: playerNumber, amount: lifeCount-oldValue)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
    }
    
    private func loadView() {
        guard let view = Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first as? UIView else {
                    return
                }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        playerLabel()
    }
    
    func playerLabel() {
        PlayerLabel.text = "Player \(playerNumber)"
        LifeCountLabel.text = "\(lifeCount)"
    }
        
    @IBAction func plusOneButton(_ sender: Any) {
        lifeCount += 1
    }
    @IBAction func minusOneButton(_ sender: Any) {
        lifeCount -= 1
    }
    
    @IBAction func textInputMinus(_ sender: Any) {
        if Int(textInput.text!) != nil {
            lifeCount -= Int(textInput.text!)!
        }
    }
    @IBAction func textInputPlus(_ sender: Any) {
        if Int(textInput.text!) != nil {
            lifeCount += Int(textInput.text!)!
        }
    }
}
