//
//  CircularProgressBarView.swift
//  IronCount
//
//  Created by Filip Matijevic on 02.11.2023..
//

import UIKit

class CircularProgressBarView: UIView {

    var progressNormalized : CGFloat = 0.5
    var angleNormalized : CGFloat = 0.0
    var color : UIColor = .clear
    
    private var progressLayer = CAShapeLayer()
    
    init(angleNormalized : CGFloat, progressNormalized : CGFloat, color : UIColor){
        self.progressNormalized = progressNormalized
        self.angleNormalized = angleNormalized
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
        let startAngle = CGFloat(2 * .pi * angleNormalized)
        let endAngle = startAngle + CGFloat(2 * .pi * progressNormalized)

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
}
