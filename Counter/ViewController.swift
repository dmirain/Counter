//
//  ViewController.swift
//  Counter
//
//  Created by Dmitry Prokofyev on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter = CounterModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        increaseButton.layer.cornerRadius = increaseButton.bounds.size.height / 2
        increaseButton.layer.masksToBounds = true
        decreaseButton.layer.cornerRadius = decreaseButton.bounds.size.height / 2
        decreaseButton.layer.masksToBounds = true
    }

    private func updateStateAndHistory() {
        stateLable.text = String(counter.state)
        historyText.text = counter.historyAsText()
        historyText.setContentOffset(.zero, animated: false)
    }

    @IBOutlet weak private var historyText: UITextView!
    @IBOutlet weak private var stateLable: UILabel!
    @IBOutlet weak private var increaseButton: UIButton!
    @IBOutlet weak private var decreaseButton: UIButton!

    @IBAction private func resetDidTouch() {
        counter.reset()
        updateStateAndHistory()
    }
    
    @IBAction private func increaseDidTouch() {
        counter.increase()
        updateStateAndHistory()
    }
    
    @IBAction private func decreaseDidTouch() {
        counter.decrease()
        updateStateAndHistory()
    }
}

