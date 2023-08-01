//
//  CheckBox.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 02/03/2023.
//

import UIKit

class CheckBox: UIView {
    
    var isChecked = false
    
    let imageView = { () -> <#Result#> in 
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = false
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "checkmark.square")
        return imageView
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func toggle() {
        self.isChecked = !isChecked
        
        imageView.isHidden = !isChecked
    }
}
