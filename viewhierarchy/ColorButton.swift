//
//  ColorButton.swift
//  viewhierarchy
//
//  Created by Nils Fischer on 10.05.15.
//
//

import UIKit

class ColorButton: UIButton {
    
    var colorWord: ColorWord! {
        didSet {
            self.backgroundColor = colorWord.color
            self.setTitle(colorWord.word, forState: .Normal)
        }
    }
        
    func configureForColorWord(colorWord: ColorWord) {
        self.colorWord = colorWord
    }
    
}
