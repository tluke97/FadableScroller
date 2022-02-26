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
        runCountdown()
        let view1 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view1.backgroundColor = .black
        let view2 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view2.backgroundColor = .black
        let view3 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view3.backgroundColor = .black
        let view4 = PewPewSubview(frame: self.view.frame, title: "Test Title", subMessage: "This is a test message. The purpose of this message is to display some text over the background and let users know some more information.", image: UIImage())
        view4.backgroundColor = .black
        
        let views = [countdownView(), view2, view3, view4]
        
        let scroll = PewPewLaserView(frame: self.view.frame, views: views)
        self.view.addSubview(scroll)
        // Do any additional setup after loading the view.
        
        

    }
    
    func countdownView() -> UIView {
        let cv = UIView(frame: self.view.frame)
        let backgroundImage = UIImageView(frame: self.view.frame)
        self.countdownLabel = UILabel(frame: CGRect(x: 15, y: 40, width: self.view.frame.size.width - 30, height: 250))
        self.countdownLabel.numberOfLines = 0
        self.countdownLabel.textColor = .white
        self.countdownLabel.font = .boldSystemFont(ofSize: 42)
        
        cv.backgroundColor = .black
        backgroundImage.image = UIImage(named: "Final-Logo-Black")
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.alpha = 0.2
        cv.addSubview(backgroundImage)
        
        cv.addSubview(countdownLabel)
        return cv
    }
    
    let futureDate: Date = {
        var future = DateComponents(
            year: 2022,
            month: 4,
            day: 1,
            hour: 0,
            minute: 0,
            second: 0
        )
        return Calendar.current.date(from: future)!
    }()

    var countdown: DateComponents {
        return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
    }
    
    @objc func updateTime() {
        let countdown = self.countdown //only compute once per call
        var days = countdown.day!
        var hours = countdown.hour!
        var minutes = countdown.minute!
        var seconds = countdown.second!
        
        self.countdownLabel.text = String(format: "%-12d Days\n%-12d Hours\n%-12d Minutes\n%-12d Seconds", days, hours, minutes, seconds)
//        if days > 0 {
//            self.countdownLabel.text = String(format: "%d Days", days)
//        } else if hours > 0 {
//            self.countdownLabel.text = String(format: "%d Hours", hours)
//        } else if minutes > 0 {
//            self.countdownLabel.text = String(format: "%d Minutes", minutes)
//        } else if seconds > 0 {
//            self.countdownLabel.text = String(format: "%d Seconds", seconds)
//        } else {
//            self.countdownLabel.text = "Update Conquer."
//        }
        
        
    }

    func runCountdown() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    


}

