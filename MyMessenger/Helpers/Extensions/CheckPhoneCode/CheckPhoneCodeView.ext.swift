//
//  CheckPhoneCodeView.ext.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

extension CheckPhoneCodeView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 6
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 6 {
            sendButton.alpha = 1
            sendButton.isEnabled = true
        }
    }
}
