//
//  String+AddText.swift
//  MyLocations
//
//  Created by Tom Ceulemans on 06/03/16.
//  Copyright © 2016 Tom Ceulemans. All rights reserved.
//

import Foundation

extension String {
    mutating func addText(text: String?, withSeparator separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}