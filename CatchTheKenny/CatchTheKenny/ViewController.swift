//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Betül Gülcen on 10.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet weak var timerlabel: UILabel!
    
    
    @IBOutlet weak var scorelabel: UILabel!
    
    @IBOutlet weak var highscorelabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    
    @IBOutlet weak var kenny2: UIImageView!
    
    @IBOutlet weak var kenny3: UIImageView!
    
    @IBOutlet weak var kenny4: UIImageView!
    
    @IBOutlet weak var kenny5: UIImageView!
    
    @IBOutlet weak var kenny6: UIImageView!
    
    @IBOutlet weak var kenny7: UIImageView!
    
    @IBOutlet weak var kenny8: UIImageView!
    
    @IBOutlet weak var kenny9: UIImageView!
    
    var timer = Timer()
    var counter = 0
    var kennyarray = [UIImageView]()
    var hidetimer = Timer()
    var highscore = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scorelabel.text = "Score: \(score)"
        
        let storedhighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedhighscore == nil {
            highscore = 0
            highscorelabel.text = "highscore: \(highscore)"
        }
        
        //kennys
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increasescore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyarray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        
        counter = 30
        timerlabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidekenny), userInfo: nil, repeats: true)
        
        
        hidekenny()
        
    }
    
    @objc func hidekenny() {
        
        for i in kennyarray {
            i.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyarray.count - 1)))
        kennyarray[random].isHidden = false
        
    }
    
    @objc func increasescore() {
        score += 1
        scorelabel.text = "Score: \(score)"
    }
    
    @objc func timerFunction() {
        
        timerlabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            hidetimer.invalidate()
            
            
            if self.score > self.highscore {
                
                self.highscore = self.score
                highscorelabel.text = "Highscore: \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
            }
            
            
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                
                //replay
                self.score = 0
                self.scorelabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timerlabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
                self.hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidekenny), userInfo: nil, repeats: true)
                
        }
        
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    }
}
