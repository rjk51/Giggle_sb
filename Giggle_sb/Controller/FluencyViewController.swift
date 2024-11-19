//
//  FluencyViewController.swift
//  Giggle_sb
//
//  Created by rjk on 19/11/24.
//

import UIKit
import AVFoundation

class FluencyViewController: UIViewController {

    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var transcriptTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    var audioRecorder: AVAudioRecorder?
    var recordingTimer: Timer?
    var scrollingTimer: Timer?
    var remainingTime: Int = 30
    let recordingImage = UIImage(named: "Restart")
    let defaultImage = UIImage(named: "mic3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micButton.layer.cornerRadius = micButton.frame.size.width / 2
        micButton.clipsToBounds = true
        micButton.setImage(defaultImage, for: .normal)
        
        transcriptTextView.isEditable = false
        nextButton.isEnabled = false

        // Do any additional setup after loading the view.
        setupAudioRecorder()
        setupTranscript()
    }
    func setupAudioRecorder() {
        let fileName = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
            audioRecorder?.prepareToRecord()
        } catch {
            print("Failed to set up audio recorder: \(error)")
        }
    }
    
    func setupTranscript() {
        transcriptTextView.text = transcript.text
    }

    @IBAction func recordButtonTapped(_ sender: UIButton) {
        // Check and request microphone permission
        AVAudioSession.sharedInstance().requestRecordPermission{ [weak self] granted in
            DispatchQueue.main.async {
                if granted {
                    // Permission granted
                    self?.startRecording()
                } else {
                    // Permission denied, show an alert
                    self?.showPermissionAlert()
                }
            }
        }
    }

    func startRecording() {
        setupAudioRecorder()
        audioRecorder?.record()
        micButton.setImage(defaultImage, for: .normal)
        remainingTime = 30
        updateTimerLabel()
        recordingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startScrolling()
        nextButton.isEnabled = false
    }

    func stopRecording() {
        audioRecorder?.stop()
        recordingTimer?.invalidate()
        scrollingTimer?.invalidate()
        timerLabel.text = "00:00"
        micButton.setImage(recordingImage, for: .normal)
        nextButton.isEnabled = true
    }

    @objc func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            updateTimerLabel()
        } else {
            stopRecording()
        }
    }

    func updateTimerLabel() {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    func startScrolling() {
        let totalScrollDuration: TimeInterval = TimeInterval(remainingTime)
        let totalContentHeight = transcriptTextView.contentSize.height - transcriptTextView.bounds.height
        
        scrollingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            let currentOffset = self.transcriptTextView.contentOffset.y
            let increment = totalContentHeight / CGFloat(totalScrollDuration * 20) // Smooth scrolling
            let newOffset = min(currentOffset + increment, totalContentHeight)
            
            if newOffset >= totalContentHeight {
                timer.invalidate()
            } else {
                self.transcriptTextView.setContentOffset(CGPoint(x: 0, y: newOffset), animated: false)
            }
        }
    }
    
    func showPermissionAlert() {
        let alert = UIAlertController(
            title: "Microphone Access Required",
            message: "This app needs access to your microphone to record audio. Please enable microphone access in Settings.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettingsURL)
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLiteracy", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
