//
//  PewPewSubview.swift
//  PewPew
//
//  Created by Tanner Luke on 2/11/22.
//

import UIKit

class PewPewSubview: UIView {

    var title = UILabel()
    var subMessage = UILabel()
    var imageview = UIImageView()
    
    init(frame: CGRect, title: String, subMessage: String, image: UIImage) {
        super.init(frame: frame)
        self.title.text = title
        self.title.font = .boldSystemFont(ofSize: 40)
        self.title.textAlignment = .center
        self.title.textColor = .white
        
        self.imageview.image = UIImage(systemName: "ipod")
        self.imageview.contentMode = .scaleAspectFit
        
        self.subMessage.text = subMessage
        self.subMessage.font = .systemFont(ofSize: 16)
        self.subMessage.textAlignment = .center
        self.subMessage.numberOfLines = 0
        self.subMessage.textColor = .white
        
        self.addSubview(self.title)
        self.addSubview(self.imageview)
        self.addSubview(self.subMessage)
        
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConstraints() {
        imageview.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subMessage.translatesAutoresizingMaskIntoConstraints = false
        [
            imageview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageview.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageview.heightAnchor.constraint(equalToConstant: (self.frame.size.width/3) * 2),
            imageview.widthAnchor.constraint(equalTo: imageview.heightAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            title.heightAnchor.constraint(equalToConstant: 80),
            title.bottomAnchor.constraint(equalTo: imageview.topAnchor, constant: -60),
            subMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            subMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            subMessage.heightAnchor.constraint(equalToConstant: 80),
            subMessage.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 60)
        ].forEach { $0.isActive = true }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
