//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by xianmolu on 15/12/21.
//  Copyright (c) 2015年 panyq. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bubble1: UIImageView!
    @IBOutlet weak var bubble2: UIImageView!
    @IBOutlet weak var bubble3: UIImageView!
    @IBOutlet weak var bubble4: UIImageView!
    @IBOutlet weak var bubble5: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    // Custom
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
    var loginPosition = CGPoint.zeroPoint
    let waringMessage = UIImageView(image: UIImage(named: "Warning"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bubble1.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble2.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble3.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble4.transform = CGAffineTransformMakeScale(0, 0)
        self.bubble5.transform = CGAffineTransformMakeScale(0, 0)
        
        self.logo.center.x -= self.view.bounds.width
        self.dot.center.x -= self.view.bounds.width/2
        
        //adjust place holder
        let userPaddingView = UIView(frame: CGRectMake(0, 0, 44, self.username.frame.height))
        self.username.leftView = userPaddingView
        self.username.leftViewMode = .Always
        
        let passPaddingView = UIView(frame: CGRectMake(0, 0, 44, self.password.frame.height))
        self.password.leftView = passPaddingView
        self.password.leftViewMode = .Always
        
        var userImageView = UIImageView(image: UIImage(named: "user"))
        userImageView.frame.origin = CGPoint(x: 13, y: 10)
        self.username.addSubview(userImageView)
        
        var passImageView = UIImageView(image: UIImage(named: "key"))
        passImageView.frame.origin = CGPoint(x: 12, y: 9)
        self.password.addSubview(passImageView)
        
        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        
        self.loginPosition = self.login.center
        self.login.center.x -= self.view.bounds.width
        
        self.view.addSubview(self.waringMessage)
        self.waringMessage.hidden = true
        self.waringMessage.frame.size.width = self.login.bounds.width
        self.waringMessage.center = self.loginPosition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble1.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble2.transform = CGAffineTransformMakeScale(1, 1)
            
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: nil, animations: {
            self.bubble3.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble4.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble5.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.logo.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animateWithDuration(5, delay: 0.3, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: nil, animations: {
            self.dot.center.x += self.view.bounds.width/2
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.4, options: .CurveEaseOut, animations: {
            self.username.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.5, options: .CurveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.6, options: .CurveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
            }, completion: nil)
    }

    @IBAction func loginTapped(sender: AnyObject) {
        self.login.addSubview(self.spinner)
        self.spinner.frame.origin = CGPointMake(18, 15)
        self.spinner.startAnimating()
        
        UIView.animateWithDuration(0.3, animations: {
            self.login.center = self.loginPosition
        })
        
        UIView.transitionWithView(self.waringMessage, duration: 0.3, options: .TransitionFlipFromTop | .CurveEaseOut, animations: {
            self.waringMessage.hidden = true
        }, completion: nil)
        
        self.login.center.x -= 30
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: nil, animations: {
            self.login.center.x += 30
            }, completion: { _ in
                
                UIView.animateWithDuration(0.3, animations: {
                    self.login.center.y += 80
                    self.spinner.removeFromSuperview()
                    }, completion: { _ in
                        UIView.transitionWithView(self.waringMessage, duration: 0.3, options: .TransitionFlipFromTop | .CurveEaseOut,
                            animations: {
                                self.waringMessage.hidden = false
                            }, completion: nil)
                })
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
