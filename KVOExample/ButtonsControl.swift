//
//  ButtonsControll.swift
//  KVOExample
//
//  Created by Ricardo V Del Frari on 23/04/2018.
//  Copyright © 2018 Ricardo V Del Frari. All rights reserved.
//

import UIKit

@IBDesignable class ButtonsControl: UIStackView {
    
    //MARK: Properties
    private var buttons = [UIButton]()
    
    override func prepareForInterfaceBuilder() {
        setupButtons()
    }
    
    @objc dynamic var buttonSelected = 1 {
        didSet {
            updateButtonSelecitonStates()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func buttonTapped(button: UIButton){
        
        guard let index = buttons.index(of: button) else {
            fatalError()
        }
        
        // Get the position of the selected button
        let selectedBell = index + 1
        
        if selectedBell == buttonSelected {
            buttonSelected = 1
        }else {
            buttonSelected = selectedBell
        }
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        for button in buttons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        buttons.removeAll()
        
        let bundle = Bundle(for:(type(of: self)))
        let filledBell = UIImage(named: "buttonSelected", in: bundle, compatibleWith: self.traitCollection)
        let emptyBell = UIImage(named:"buttonBack25", in: bundle, compatibleWith: self.traitCollection)

        //Create 5 Buttons
        for _ in 0..<5 {
            
            let button = UIButton()
            button.setBackgroundImage(emptyBell, for: .normal)
            button.setBackgroundImage(filledBell, for: .selected)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.translatesAutoresizingMaskIntoConstraints = true
            
            button.addTarget(self, action: #selector(ButtonsControl.buttonTapped(button:)), for: .touchUpInside)

            addArrangedSubview(button)
            
            buttons.append(button)
        }
        
        updateButtonSelecitonStates()
    }
    
    private func updateButtonSelecitonStates() {
        for (index, button) in buttons.enumerated() {
            button.isSelected = index < buttonSelected
        }
    }
}

