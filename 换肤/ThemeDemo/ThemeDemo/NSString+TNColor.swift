//
//  NSString+TNColor.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/17.
//  Copyright © 2019 Tonio. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var stringToUIColor: UIColor? {
        var trimeString = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimeString.hasPrefix("#") {
            trimeString = trimeString.tn_SubString(from: 1)
        } else if trimeString.hasPrefix("0x") {
            trimeString = trimeString.tn_SubString(from: 2)
        }
        let scanner = Scanner(string: trimeString)
        var value: UInt64 = 0;
        guard scanner.scanHexInt64(&value) else {
            return nil
        }
        
        let color = UIColor(red: 34/255, green: 232/255, blue: 23/255, alpha: 1.0)
        return color
    }
    
    func tn_SubString(from index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
}
