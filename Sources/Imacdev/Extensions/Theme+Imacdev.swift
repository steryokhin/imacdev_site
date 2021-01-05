//
//  Theme+Imacdev.swift
//  
//
//  Created by Sergey Teryokhin on 12/28/20.
//

import Foundation
import Publish

extension Theme {
    static var imacdevTheme: Theme {
        Theme(htmlFactory: ImacdevHtmlFactory(),
              resourcePaths: ["Resources/imacdevTheme/styles.css"])
    }

    static var sundellTheme: Theme {
        Theme(htmlFactory: ImacdevHtmlFactory(),
              resourcePaths: ["Resources/sundellSiteTheme/styles.css"])
    }
}
