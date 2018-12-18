//
//  ViewController.swift
//  实验十
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 baoxinbei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView1: UIView!
    @IBOutlet weak var myView2: UIView!
    
    var timer1: Timer?
    var timer2: Timer?
    
    var animator: UIDynamicAnimator!
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer1 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak weakSelf=self] (mytimer) in weakSelf?.myView1.center.x += 20
        })
         dynamicAnimation()
    }

    @IBAction func btnClicked1(_ sender: Any) {
        timer1?.invalidate()
        UIView.animate(withDuration: 4, delay: 1, options: [.curveLinear,.autoreverse], animations: {
            self.myView1.alpha = 0
            self.myView1.center.x = self.view.bounds.width
            self.myView1.backgroundColor = UIColor.purple
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
            self.myView1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.myView1.transform = CGAffineTransform.identity
        }) { (finished) in
            if finished{
                self.myView1.removeFromSuperview()
            }
        }
    }
    
    @IBAction func btnClicked2(_ sender: Any) {
        UIView.transition(with: myView2, duration: 1, options: [.transitionFlipFromLeft,.autoreverse], animations: {
            self.myView2.backgroundColor = UIColor.gray
        }, completion: nil)
    }
    @IBAction func btnClicked3(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 35, y: 29, width: 150, height: 150))
        imageView.image = UIImage(named: "1")
        UIView.transition(from: myView2, to: imageView, duration: 2, options: [.transitionFlipFromRight,.autoreverse], completion: nil)
    }
    
    func dynamicAnimation() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
            let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
            let view = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            view.backgroundColor = UIColor.darkGray
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            self.view.addSubview(view)
            
            self.gravity.addItem(view)
            self.collision.addItem(view)
        }
    }
    
}

