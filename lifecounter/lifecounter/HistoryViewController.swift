//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Munir Emam on 4/23/25.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var HistoryView: UITextView!
    var history : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(history)
        HistoryView.text = history.joined(separator: "\n")
    }
}
