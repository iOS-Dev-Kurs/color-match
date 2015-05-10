//
//  AppDelegate.swift
//  viewhierarchy
//
//  Created by Nils Fischer on 08.05.15.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var scoreLabel: UILabel!
    var colorButtons = [ColorButton]()

    var timer: NSTimer?

    var score = 0 {
        didSet {
            self.updateScore()
        }
    }
    
    var rounds = 0
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        self.window = window
        
        let scoreLabel = UILabel()
        scoreLabel.backgroundColor = UIColor.clearColor()
        scoreLabel.frame = CGRect(x: 10, y: 10, width: window.frame.size.width - 20, height: 50)
        window.addSubview(scoreLabel)
        self.scoreLabel = scoreLabel
        
        addColorButton()
        addColorButton()

        self.updateScore()
        
        self.prepareNextRound()
        
        return true
    }
    
    func addColorButton() {
        let button = ColorButton()
        button.colorWord = ColorWord()
        button.addTarget(self, action: "colorButtonPressed:", forControlEvents: .TouchUpInside)
        button.frame = CGRect(x: window!.frame.size.width / 2 - 40, y: 20 + 64 * CGFloat(colorButtons.count), width: 80, height: 44)
        self.window?.addSubview(button)
        self.colorButtons.append(button)
    }
    
    func timerFired(timer: NSTimer) {
        for button in self.colorButtons {
            if button.colorWord.isCorrect {
                self.score -= 5
            }
        }
        prepareNextRound()
    }
    
    func prepareNextRound() {
        self.rounds++
        if self.rounds > self.colorButtons.count * 2 {
            addColorButton()
        }
        for button in self.colorButtons {
            button.colorWord = ColorWord()
        }
        if let timer = self.timer {
            timer.invalidate()
        }
        self.timer = NSTimer.scheduledTimerWithTimeInterval(max(2, 5 - 0.1 * Double(self.rounds)), target: self, selector: "timerFired:", userInfo: nil, repeats: false)
    }

    func colorButtonPressed(sender: ColorButton) {
        if sender.colorWord.isCorrect {
            score += 1
        } else {
            score -= 5
        }
        prepareNextRound()
    }

    func updateScore() {
        self.scoreLabel.text = "Score: \(score)"
    }

}

