//
//  ViewController.swift
//  counter1
//
//  Created by Ксения on 4/3/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!

    // MARK: - Variables
    var counter = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.isEditable = false
        logEvent("История изменений:")
    }

    // MARK: - Actions
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        counter += 1
        updateUI()
        logEvent("Значение изменено на +1")
    }

    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            logEvent("Значение изменено на -1")
        } else {
            logEvent("Попытка уменьшить значение счётчика ниже 0")
        }
        updateUI()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        counter = 0
        updateUI()
        logEvent("Значение сброшено")
    }

    // MARK: - Helper Methods
    private func updateUI() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }

    private func logEvent(_ event: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        let logEntry = "[\(timestamp)]: \(event)\n"
        historyTextView.text += logEntry
        scrollToBottom()
    }

    private func scrollToBottom() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(range)
    }
}
