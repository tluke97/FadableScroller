//
//  TimerView.swift
//  PewPew
//
//  Created by Tanner Luke on 2/27/22.
//

import UIKit

class TimerView: UIView {
    var title = UILabel()
    var dayValue = UILabel()
    var hourValue = UILabel()
    var minuteValue = UILabel()
    var secondValue = UILabel()
    var dayLabel = UILabel()
    var hourLabel = UILabel()
    var minuteLabel = UILabel()
    var secondLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutViews(labels: [title, dayValue, dayLabel, hourValue, hourLabel, minuteValue, minuteLabel, secondValue, secondLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutViews(labels: [UILabel]) {
        //setup background image
        let backgroundImage = UIImageView(frame: self.frame)
        self.backgroundColor = .black
        backgroundImage.image = UIImage(named: "Final-Logo-Black")
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.alpha = 0.2
        self.addSubview(backgroundImage)
        
        for label in labels {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            label.font = .boldSystemFont(ofSize: 40)
            self.addSubview(label)
        }
        
        //set up label text
        secondLabel.text = "Seconds"
        minuteLabel.text = "Minutes"
        hourLabel.text = "Hours"
        dayLabel.text = "Days"
        dayValue.textAlignment = .center
        hourValue.textAlignment = .center
        minuteValue.textAlignment = .center
        secondValue.textAlignment = .center
        title.text = "Conquer.\nThe.\nLeaderboard."
        title.font = .boldSystemFont(ofSize: 50)
        title.numberOfLines = 0
        
        [
            hourValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            hourValue.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5),
            hourValue.heightAnchor.constraint(equalToConstant: 50),
            hourValue.widthAnchor.constraint(equalToConstant: 55),
            hourLabel.bottomAnchor.constraint(equalTo: self.hourValue.bottomAnchor),
            hourLabel.heightAnchor.constraint(equalTo: self.hourValue.heightAnchor),
            hourLabel.leadingAnchor.constraint(equalTo: hourValue.trailingAnchor, constant: 20),
            hourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            dayValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dayValue.bottomAnchor.constraint(equalTo: self.hourLabel.topAnchor, constant: -10),
            dayValue.heightAnchor.constraint(equalToConstant: 50),
            dayValue.widthAnchor.constraint(equalToConstant: 55),
            dayLabel.bottomAnchor.constraint(equalTo: self.dayValue.bottomAnchor),
            dayLabel.heightAnchor.constraint(equalTo: self.dayValue.heightAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: dayValue.trailingAnchor, constant: 20),
            dayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            minuteValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            minuteValue.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
            minuteValue.heightAnchor.constraint(equalToConstant: 50),
            minuteValue.widthAnchor.constraint(equalToConstant: 55),
            minuteLabel.bottomAnchor.constraint(equalTo: self.minuteValue.bottomAnchor),
            minuteLabel.heightAnchor.constraint(equalTo: self.minuteValue.heightAnchor),
            minuteLabel.leadingAnchor.constraint(equalTo: minuteValue.trailingAnchor, constant: 20),
            minuteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            secondValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondValue.topAnchor.constraint(equalTo: self.minuteValue.bottomAnchor, constant: 10),
            secondValue.heightAnchor.constraint(equalToConstant: 50),
            secondValue.widthAnchor.constraint(equalToConstant: 55),
            secondLabel.bottomAnchor.constraint(equalTo: self.secondValue.bottomAnchor),
            secondLabel.heightAnchor.constraint(equalTo: self.secondValue.heightAnchor),
            secondLabel.leadingAnchor.constraint(equalTo: secondValue.trailingAnchor, constant: 20),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.heightAnchor.constraint(equalToConstant: 180),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ].forEach { $0.isActive = true }
        
        self.runCountdown()
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
        guard let days = countdown.day else { return }
        guard let hours = countdown.hour else { return }
        guard let minutes = countdown.minute else { return }
        guard let seconds = countdown.second else { return }
        
        self.dayValue.text = "\(days)"
        self.hourValue.text = "\(hours)"
        self.minuteValue.text = "\(minutes)"
        self.secondValue.text = "\(seconds)"
    }

    func runCountdown() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    

}
