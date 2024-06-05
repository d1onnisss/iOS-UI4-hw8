//
//  ValidateProtocol.swift
//  iOS-UI4-hw8
//
//  Created by Alexey Lim on 5/6/24.
//

import UIKit

protocol ValidateProtocol {
    func cardTFValidate(cardNumber: UITextField, amountTF: UITextField, validateBtn: UIButton)
}

extension ValidateProtocol {
    func cardTFValidate(cardNumber: UITextField, amountTF: UITextField, validateBtn: UIButton) {
        let isCardNumberValid = cardNumber.text?.count == 16
        let isAmountValid = !(amountTF.text?.isEmpty ?? true)
        
        if isCardNumberValid && isAmountValid {
            validateBtn.isEnabled = true
            validateBtn.backgroundColor = .systemRed
        } else {
            validateBtn.isEnabled = false
        }
    }
}
