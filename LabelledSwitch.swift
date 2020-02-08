//
//  LabelledSwitch.swift
//  Modules
//
//  Created by Sepandat Pourtaymour on 08/02/2020.
//  Copyright © 2020 Sepandat Pourtaymour. All rights reserved.
//

import UIKit

class LabelledSwitch: UIView {
    fileprivate let label = UILabel()
    fileprivate let toggle = UISwitch()
    
    var title: String? {
        get {
            return label.text
        }
        
        set {
            label.text = newValue
        }
    }
    
    override var tintColor: UIColor! {
        set {
            label.tintColor = newValue
            toggle.tintColor = newValue
        }
        get {
            return label.tintColor
        }
    }

    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setupSubviews()
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        if !subviews.contains(label){
            addSubview(label)
        }
        if !subviews.contains(toggle){
            addSubview(toggle)
        }
        toggle.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        [toggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
         toggle.centerYAnchor.constraint(equalTo: centerYAnchor),
         label.centerYAnchor.constraint(equalTo: toggle.centerYAnchor),
         label.trailingAnchor.constraint(equalTo: toggle.leadingAnchor, constant: -10),
         label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)].forEach { $0.isActive = true }
        
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        toggle.addTarget(target, action: action, for: controlEvents)
    }
    
    
}
