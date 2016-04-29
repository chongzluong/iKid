//
//  PunViewController.swift
//  iKid
//
//  Created by Timothy Luong on 4/28/16.
//  Copyright © 2016 Timothy Luong. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    
    private var jokeViewController : PunJokeViewController!
    private var plViewController : PunPunchLineViewController!
    
    private func firstBuilder() {
        if jokeViewController == nil {
            jokeViewController = storyboard?.instantiateViewControllerWithIdentifier("FirstPun")
                as! PunJokeViewController
        }
    }
    
    private func secondBuilder() {
        if plViewController == nil {
            plViewController = storyboard?.instantiateViewControllerWithIdentifier("SecondPun")
                as! PunPunchLineViewController
        }
    }
    
    @IBAction func Flip(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if jokeViewController != nil &&
            jokeViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            plViewController.view.frame = view.frame
            switchViewController(jokeViewController, to: plViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            jokeViewController.view.frame = view.frame
            switchViewController(plViewController, to: jokeViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        firstBuilder()
        switchViewController(nil, to: jokeViewController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
