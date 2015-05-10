//
//  ColorWord.swift
//  viewhierarchy
//
//  Created by Nils Fischer on 10.05.15.
//
//

import Foundation
import UIKit

struct ColorWord {
    static let allColors = [ "Red" : UIColor.redColor(), "Yellow" : UIColor.yellowColor(), "Green" : UIColor.greenColor(), "Blue" : UIColor.blueColor() ]
    let color: UIColor
    let word: String
    init() {
        self.word = ColorWord.allColors.keys.array.randomElement()
        self.color = ColorWord.allColors.values.array.randomElement()
    }
    var isCorrect: Bool {
        if let correctColor = ColorWord.allColors[self.word] {
            return self.color == correctColor
        } else {
            return false
        }
    }
}

extension Array {
    func randomElement() -> T {
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
}
