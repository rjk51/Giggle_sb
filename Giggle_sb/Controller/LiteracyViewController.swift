//
//  LiteracyViewController.swift
//  Giggle_sb
//
//  Created by rjk on 17/11/24.
//

import UIKit

class LiteracyViewController: UIViewController {

    // Outlets
    @IBOutlet weak var questionProgressLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var optionButtons: [UIButton]!
    
    private var literacyScore: LiteracyScore?
    private var currentQuestionIndex: Int = 0
    private var remainingTime: Int = 300 // 5 minutes in seconds
    private var timer: Timer?
    private var userAnswers: [String] = [] // Stores user answers
    private var selectedAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
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
            calculateResult()
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
        nextButton.isEnabled = false
        selectedAnswer = nil
    }

    @IBAction func optionTapped(_ sender: UIButton) {
        // Handle option selection
        selectedAnswer = sender.currentTitle
        print("Option tapped: \(sender.currentTitle ?? "")")
        for button in optionButtons {
            UIView.animate(withDuration: 0.2) {
                button.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
                button.setTitleColor(.white, for: .normal)
            }
        }

        UIView.animate(withDuration: 0.2) {
            sender.tintColor = UIColor(red: 0.29, green: 0.306, blue: 0.412, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
        }
        nextButton.isEnabled = true
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        if let answer = selectedAnswer {
            userAnswers.append(answer) // Store the selected answer
        } else {
            userAnswers.append("") // Add an empty answer if none was selected
        }
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            updateUI()
        } else {
            // End of test
            print("Test completed")
            calculateResult()
        }
    }

    private func calculateResult() {
        // Calculate percentage
        var correctAnswers = 0
        for (index, question) in questions.enumerated() {
            if index < userAnswers.count && userAnswers[index] == question.correctAnswer {
                correctAnswers += 1
            }
        }
        let percentage = Double(correctAnswers) / Double(questions.count) * 100
        literacyScore = LiteracyScore(score:percentage)
        UserDefaults.standard.set(percentage, forKey: "litercyScore")
        print(percentage)
        self.performSegue(withIdentifier: "goToNumeracy", sender: self)
    }

    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

