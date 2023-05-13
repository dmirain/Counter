//
//  ViewController.swift
//  Counter
//
//  Created by Dmitry Prokofyev on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter = CounterModel()
    
    @IBOutlet weak var historyText: UITextView!
    @IBOutlet weak var stateLable: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetDidTouch() {
        counter.reset()
        updateStateAndHistory()
    }
    @IBAction func increaseDidTouch() {
        counter.increase()
        updateStateAndHistory()
    }
    @IBAction func decreaseDidTouch() {
        counter.decrease()
        updateStateAndHistory()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        historyText.isEditable = false
        increaseButton.layer.cornerRadius = increaseButton.bounds.size.height / 2
        increaseButton.layer.masksToBounds = true
        decreaseButton.layer.cornerRadius = decreaseButton.bounds.size.height / 2
        decreaseButton.layer.masksToBounds = true
    }
    
    private func updateStateAndHistory() {
        stateLable.text = String(counter.state)
        historyText.text = counter.historyAsText()
        historyText.setContentOffset(.zero, animated: true)
    }
}

