//
//  NumeracyViewController.swift
//  Giggle_sb
//
//  Created by rjk on 17/11/24.
//

import UIKit

class NumeracyViewController: UIViewController {

    // Outlets
    @IBOutlet weak var questionProgressLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    
    private var currentQuestionIndex: Int = 0
    private var remainingTime: Int = 300 // 5 minutes in seconds
    private var timer: Timer?
    private var userAnswers: [String] = [] // Stores user answers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        updateUI()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc private func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            timerLabel.text = formatTime(remainingTime)
        } else {
            timer?.invalidate()
            timerLabel.text = "00:00"
            // Show result when time runs out
            calculateAndShowResult()
        }
    }

    private func updateUI() {
        let currentQuestion = questions[currentQuestionIndex]
        questionProgressLabel.text = "\(currentQuestionIndex + 1)/\(questions.count)"
        questionLabel.text = currentQuestion.question

        for (index, button) in optionButtons.enumerated() {
            button.setTitle(currentQuestion.options[index], for: .normal)
            button.backgroundColor = .clear // Reset button color
        }
    }

    @IBAction func optionTapped(_ sender: UIButton) {
        // Handle option selection
        print("Option tapped: \(sender.currentTitle ?? "")")
        for button in optionButtons {
            UIView.animate(withDuration: 0.2) {
                button.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
                button.setTitleColor(.white, for: .normal)
            }
        }

        UIView.animate(withDuration: 0.2) {
            sender.tintColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            updateUI()
        } else {
            // End of test
            print("Test completed")
            calculateAndShowResult()
//            performSegue(withIdentifier: "showResults", sender: nil)
        }
    }

    private func calculateAndShowResult() {
        // Calculate percentage
        var correctAnswers = 0
        for (index, question) in questions.enumerated() {
            if index < userAnswers.count && userAnswers[index] == question.correctAnswer {
                correctAnswers += 1
            }
        }
        let percentage = Double(correctAnswers) / Double(questions.count) * 100

        // Show result in an alert
        let alert = UIAlertController(title: "Test Completed", message: "Your score: \(Int(percentage))%", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            // Optionally navigate to another screen
        }))
        present(alert, animated: true, completion: nil)
    }

    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

