//
//  StringExtension.swift
//  Tools
//
//  Created by Rishat Yakushev on 01.01.2018.
//  Copyright © 2018 Flatstack. All rights reserved.
//

import Foundation

public extension String {

    // MARK: - Instance Methods

    public func localized(tableName: String? = nil, comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: comment)
    }

    // MARK: -

    public func prefix(count: Int) -> String {
        return ((self.count > count) ? String(self[..<self.index(self.startIndex, offsetBy: count)]) : self)
    }

    public func suffix(from index: Int) -> String {
        return ((self.count > index) ? String(self[self.index(self.startIndex, offsetBy: index)...]) : "")
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
    
    public func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
    }
}
