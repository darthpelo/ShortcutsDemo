//
//  Extensions.swift
//  ShortcutsDemo
//
//  Created by Alessio Roberto on 06/06/2018.
//  Copyright © 2018 Alessio Roberto. All rights reserved.
//

import Foundation

extension UserDefaults {
    var actionState: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
