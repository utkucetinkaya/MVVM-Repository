//
//  NSObject+Ext.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation

// MARK: - NSObject

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
