//
//  ViewController.swift
//  Catch The Beer
//
//  Created by Alper Cuhadaroglu on 22.07.2018.
//  Copyright © 2018 Alper Cuhadaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var beer1: UIImageView!
    @IBOutlet weak var beer2: UIImageView!
    @IBOutlet weak var beer3: UIImageView!
    @IBOutlet weak var beer4: UIImageView!
    @IBOutlet weak var beer5: UIImageView!
    @IBOutlet weak var beer6: UIImageView!
    @IBOutlet weak var beer7: UIImageView!
    @IBOutlet weak var beer8: UIImageView!
    @IBOutlet weak var beer9: UIImageView!
    var score = 0
    var timer = Timer()
    var counter = 10
    var beerArray = [UIImageView]()
    var hideTimer = Timer()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        timeLabel.text = "\(counter)"
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore == nil {
            highScoreLabel.text = "0"
        }
        if let newScore = highScore as? Int {
            highScoreLabel.text = String(newScore)
        }
        
        beer1.isUserInteractionEnabled = true
        beer2.isUserInteractionEnabled = true
        beer3.isUserInteractionEnabled = true
        beer4.isUserInteractionEnabled = true
        beer5.isUserInteractionEnabled = true
        beer6.isUserInteractionEnabled = true
        beer7.isUserInteractionEnabled = true
        beer8.isUserInteractionEnabled = true
        beer9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        
        beer1.addGestureRecognizer(recognizer1)
        beer2.addGestureRecognizer(recognizer2)
        beer3.addGestureRecognizer(recognizer3)
        beer4.addGestureRecognizer(recognizer4)
        beer5.addGestureRecognizer(recognizer5)
        beer6.addGestureRecognizer(recognizer6)
        beer7.addGestureRecognizer(recognizer7)
        beer8.addGestureRecognizer(recognizer8)
        beer9.addGestureRecognizer(recognizer9)
        
        beerArray.append(beer1)
        beerArray.append(beer2)
        beerArray.append(beer3)
        beerArray.append(beer4)
        beerArray.append(beer5)
        beerArray.append(beer6)
        beerArray.append(beer7)
        beerArray.append(beer8)
        beerArray.append(beer9)
        
        hideBeer()
        

        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideBeer), userInfo: nil, repeats: true)
        
        
        



        
        
    }

    @objc func increaseScore() {
        score = score + 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func countDown() {
        counter = counter - 1
        timeLabel.text = "\(counter)"
        if counter == -1 {
            timer.invalidate()
            hideTimer.invalidate()
            if score > Int(highScoreLabel.text!)! {
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highScoreLabel.text = String(self.score)
                
            }
            timeLabel.text = "0"
            let alert = UIAlertController(title: "Time", message: "Time is Up", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            let replayButton = UIAlertAction(title: "Yeniden Oyna", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideBeer), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func hideBeer() {
        for beer in beerArray {
            beer.isHidden = true
        let random = Int(arc4random_uniform(UInt32(beerArray.count)))
        beerArray[random].isHidden = false
        }
    }
    
    


}

