//
//  File.swift
//  
//
//  Created by Sergey Teryokhin on 12/29/20.
//

import Foundation

public enum css: String, CustomStringConvertible {
    case siteName = "site-name"
}

public extension css {
    var description: String {
        return self.rawValue
    }
}
