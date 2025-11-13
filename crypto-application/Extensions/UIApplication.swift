//
//  UIApplication.swift
//  crypto-application
//
//  Created by Aman on 13/11/25.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
