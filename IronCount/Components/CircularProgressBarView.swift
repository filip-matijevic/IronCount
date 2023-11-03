//
//  CircularProgressBarView.swift
//  IronCount
//
//  Created by Filip Matijevic on 02.11.2023..
//

import UIKit

class CircularProgressBarView: UIView {

    var progress : CGFloat = 0.5
    var startAngle = -CGFloat.pi / 2
    var color : UIColor = .clear
    
    private var progressLayer = CAShapeLayer()
    
    init(startAngle : CGFloat, progress : CGFloat, color : UIColor){
        self.progress = progress
        self.startAngle = startAngle
        self.color = color
        super.init(frame: CGRect())
        
        Init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Init()
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let radius = min(rect.size.width, rect.size.height) / 2 - 10 // Adjust the radius as needed
        let endAngle = startAngle + CGFloat(2 * .pi * progress)

        let path = UIBezierPath()
        path.lineWidth = 5
        path.lineCapStyle = .round
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setStroke()
        path.stroke()
        
    }
    
    private func Init(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        SetConstraints()
    }
    
    private func SetConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.widthAnchor.constraint(equalTo: self.heightAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func animateProgress(newStart : CGFloat, newProgress : CGFloat, duration : Double){
        
        print(duration)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear){
            self.startAngle = newStart
            self.progress = newProgress
            
            self.setNeedsDisplay()
        }
        animator.startAnimation()
        self.setNeedsDisplay()
    }
    
    func animateProgressLayer(duration : TimeInterval, progress : CGFloat){
        let circularProgressAnimation = CABasicAnimation(keyPath: "progress")
        
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = progress
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }

}
