//
//  PopoverViewController.swift
//  Giggle_sb
//
//  Created by rjk on 16/11/24.
//

import UIKit

protocol PopoverViewControllerDelegate: AnyObject {
    func didSelectMarkAsRead()
}

class PopoverViewController: UIViewController {
    
    weak var delegate: PopoverViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
    }

    @IBAction func markAsReadButtonTapped(_ sender: UIButton) {
        delegate?.didSelectMarkAsRead()
        dismiss(animated: true, completion: nil)
    }
}

