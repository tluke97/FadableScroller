//
//  PewPewLaserView.swift
//  PewPew
//
//  Created by Tanner Luke on 2/10/22.
//

import UIKit

class PewPewLaserView: UIScrollView, UIScrollViewDelegate {

    private var step: CGFloat = 0
    private var currentIndex = 0
    private var lastContentOffset: CGFloat = 0
    private var beginningContentOffset: CGFloat = 0
    enum Direction { case up, down, no }
    private var currentDirection: Direction = .no
    
    var pagingViews: [UIView] = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBehavior()
    }
    
    
    init(frame: CGRect, views: [UIView]) {
        super.init(frame: frame)
        self.pagingViews = views
        self.setupBehavior()
        self.setupViews()
        self.initialFadeIn()
    }
    
    
    private func setupBehavior() {
        self.isPagingEnabled = true
        self.backgroundColor = .black
        self.delegate = self
    }
    
    
    func setupViews() {
        self.step = self.frame.size.height
        self.contentSize = CGSize(width: self.frame.size.width, height: self.frame.size.height * CGFloat(pagingViews.count))
        var i = 0
        for v in pagingViews {
            v.frame = CGRect(x: 0, y: self.frame.size.height * CGFloat(i), width: self.frame.size.width, height: self.frame.size.height)
            v.alpha = 0
            //v.alpha = 0
            self.addSubview(v)
            i += 1
        }
        self.contentInsetAdjustmentBehavior = .never
        for v in pagingViews {
            print(v.alpha)
        }
    }
    
    
    func initialFadeIn() {
        if pagingViews.count > 0 {
            UIView.animate(withDuration: 2) {
                self.pagingViews[0].alpha = 1
            } completion: { _ in
                self.isScrollEnabled = true
            }
        }
    }
    
    
    private func getCurrentIndex() -> Int {
        return Int(round(CGFloat(self.contentOffset.y) / CGFloat(step)))
    }
    
    
    //returns the previous and upcoming indexes
    //can be null in the case of being at the top
    func getTransitioningViews(offset: CGPoint) -> (Int?, Int?) {
        var state: (Int?, Int?) = (nil, nil)
        if (self.lastContentOffset > offset.y) {
            self.currentDirection = .down
            if currentIndex == 0 {
                state = (nil, 0)
            } else {
                if offset.y < (self.contentSize.height - step) {
                    state = (currentIndex, currentIndex - 1)
                }
            }
        }
        else if (self.lastContentOffset < offset.y) {
            self.currentDirection = .up
            if currentIndex == (pagingViews.count - 1) {
                state = (pagingViews.count - 1, nil)
            } else {
                if offset.y > 0 {
                    state = (currentIndex, currentIndex + 1)
                }
            }
        }
        self.lastContentOffset = offset.y
        return state
    }
    
    private func transition(views: (Int?, Int?), offset: CGPoint) {
        guard let transitionFrom = views.0 else { return }
        guard let transitionTo = views.1 else { return }
        
        let offset = self.beginningContentOffset + offset.y
        let val = CGFloat(offset)/self.frame.size.height
        let percent = Double(val).truncatingRemainder(dividingBy: 1)
        if self.currentDirection == .up {
            if percent != 0 {
                pagingViews[transitionTo].alpha = percent
            }
            pagingViews[transitionFrom].alpha = 1 - percent
        } else {
            if percent != 0 {
                pagingViews[transitionTo].alpha = 1 - percent
            }
            pagingViews[transitionFrom].alpha = percent
        }
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.beginningContentOffset = 0
        self.currentIndex = getCurrentIndex()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let v = pagingViews[getCurrentIndex()]
        if v.alpha != 1 {
            UIView.animate(withDuration: 0.7) {
                v.alpha = 1
                self.maskOtherViews()
            }
        }
    }
    
    private func maskOtherViews() {
        let cv = getCurrentIndex()
        for v in pagingViews {
            if v != subviews[cv] {
                v.alpha = 0
            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //transition(views: getTransitioningViews(offset: scrollView.contentOffset), offset: scrollView.contentOffset)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
