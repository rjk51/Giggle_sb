//
//  Button-red.swift
//  Giggle_sb
//
//  Created by user@91 on 02/11/24.
//
import UIKit

@IBDesignable
class CustomButton: UIButton {

    // Allow customization through Interface Builder
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            setupButton()
        }
    }

    @IBInspectable var bgColor: UIColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0) { // Red color
        didSet {
            setupButton()
        }
    }
    
    @IBInspectable var titleColor: UIColor = .white {
        didSet {
            setupButton()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        // Apply styling
        backgroundColor = bgColor
        layer.cornerRadius = cornerRadius
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Optionally add a shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
