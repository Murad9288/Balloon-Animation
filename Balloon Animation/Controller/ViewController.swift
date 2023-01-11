//
//  ViewController.swift
//  Balloon Animation
//
//  Created by Md Murad Hossain on 7/1/23.
//

import UIKit

class ViewController: UIViewController {

    let balloons = ["red balloon","yellow balloon","green balloon","blue balloon","black balloon","pink balloon","gold balloon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       MARK: Private method call
        createBalloon()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapBalloon)))
    }
    //grepper create balloon animation
    func createBalloon() {
        var i = 0
        balloons.forEach { (balloonName) in
            let balloonImage = UIImage(named: balloonName)
            let balloonImageView = UIImageView(image: balloonImage)
            balloonImageView.frame = CGRect(x: 5+i, y: Int(view.frame.height), width: 50, height: 75)
            balloonImageView.contentMode = .scaleAspectFit
            view.addSubview(balloonImageView)
            i += 55
            balloonAnimate(balloonImageView: balloonImageView)
        }
    }
    func balloonAnimate(balloonImageView: UIImageView){
        let delay = Int.random(in: 0..<7)
        UIView.animate(withDuration: 20, delay: Double(delay), animations: {
            balloonImageView.center.y = -50
        })
    }
    //end grepper

    @objc func handleTapBalloon(gestureRegconzer: UITapGestureRecognizer) {
        let location = gestureRegconzer.location(in: self.view)
        for v in view.subviews {
            guard let balloonlocation = v.layer.presentation()?.frame else {return}
            if balloonlocation.contains(location) {
                let balloonImageView = v as! UIImageView
                balloonPop(balloonImageView: balloonImageView)
            }
        }
    }
    
    func balloonPop(balloonImageView: UIImageView) {
        balloonImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3.0, options: .allowUserInteraction, animations: {
            balloonImageView.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
        }) { (_) in
            balloonImageView.alpha = 0
        }
    }
}

