//
//  ViewController.swift
//  PewPew
//
//  Created by Tanner Luke on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var v : PewPewSubview!
    var countdownLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        v = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        let view1 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view1.backgroundColor = .black
        let view2 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view2.backgroundColor = .black
        let view3 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view3.backgroundColor = .black
        let view4 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view4.backgroundColor = .black
        
        let views = [TimerView(frame: self.view.frame), view2, view3, view4]
        
        let scroll = PewPewLaserView(frame: self.view.frame, views: views)
        self.view.addSubview(scroll)
        // Do any additional setup after loading the view.
        
        

    }
    
   

}

