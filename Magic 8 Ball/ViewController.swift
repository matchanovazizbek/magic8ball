//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Азизбек Матчанов on 02/02/2018.
//  Copyright © 2018 Azizbek Matchanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prediction: UILabel!
    @IBOutlet weak var magic8BallImage: UIImageView!
    @IBOutlet weak var blackDotImage: UIImageView!
    
    let magic8Ball = Magic8Ball()
    
    let answerOptions = ["It is certain", "As I see it, yes", "Reply hazy, try again", "Don’t count on it",
                         "It is decidedly so", "Most likely", "Ask again later", "My reply is no",
                         "Without a doubt", "Outlook good", "Better not tell you now", "My sources say no",
                         "Yes — definitely", "Signs point to yes", "Cannot predict now", "Outlook not so good",
                         "You may rely on it", "Yes", "Concentrate and ask again", "Very doubtful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prediction.alpha = 0.0
        blackDotImage.fadeOut()
        prediction.fadeIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        touchShake()
    }
    
    @IBAction func touchShake() {
        prediction.fadeOut()
        blackDotImage.fadeIn()
        prediction.text = answerOptions[magic8Ball.shakeBall()]
        blackDotImage.fadeOut()
        prediction.fadeIn()
    }
    
}

extension UIView {
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    func shake(duration: CFTimeInterval) {
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        translation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0]
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0].map {
            (degrees: Double) -> Double in
            let radians: Double = (Double.pi * degrees) / 180.0
            return radians
        }
        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = duration
        self.layer.add(shakeGroup, forKey: "shakeIt")
    }
}

