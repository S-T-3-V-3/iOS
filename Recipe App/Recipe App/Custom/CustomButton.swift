//
//  CustomButton.swift
//  Recipe App
//
//  Followed this tutorial: http://youtube.com/watch?v=m_0_XQEfrGQ
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor     = .blue
        titleLabel?.font    = UIFont(name: "Helvetica", size:22)
        layer.cornerRadius  = frame.size.height / 2
        setTitleColor(.white, for: .normal)
    }
}
