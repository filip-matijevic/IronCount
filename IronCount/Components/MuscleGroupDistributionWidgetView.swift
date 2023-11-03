//
//  MuscleGroupDistributionWidget.swift
//  IronCount
//
//  Created by Filip Matijevic on 02.11.2023..
//

import UIKit

class MuscleGroupDistributionWidgetView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        Init()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        Init()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    var dummyExerciseCount = [3, 4, 3, 5, 5]
    var circularBars = [
        CircularProgressBarView(startAngle: (CGFloat.pi * 2 * 1.0 / 5.0), progress: 0.1, color: .darkGray),
        CircularProgressBarView(startAngle: (CGFloat.pi * 2 * 2.0 / 5.0), progress: 0.1, color: .blue),
        CircularProgressBarView(startAngle: (CGFloat.pi * 2 * 3.0 / 5.0), progress: 0.1, color: .black),
        CircularProgressBarView(startAngle: (CGFloat.pi * 2 * 4.0 / 5.0), progress: 0.1, color: .red),
        CircularProgressBarView(startAngle: (CGFloat.pi * 2 * 5.0 / 5.0), progress: 0.1, color: .purple)
    ]
        
    let circulatBar = CircularProgressBarView(startAngle: 0, progress: 0.9, color: .darkGray)
    
    private let randomButton : UIButton = {
        let button = UIButton()
        button.layer.shadowRadius = 5
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "shuffle.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        return button
    }()
    private func Init(){
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let exeCount = 20.0
        var prevNormalizeStart = 0.0
        for i in 0...4{
            let normalizeStart = CGFloat.pi * 2 * CGFloat(dummyExerciseCount[i]) / exeCount + prevNormalizeStart
            let normalizeProgress = CGFloat(dummyExerciseCount[i]) / exeCount
            print(normalizeStart)
            print(normalizeProgress)
            circularBars[i].startAngle = normalizeStart
            circularBars[i].progress = normalizeProgress - 0.1
            prevNormalizeStart = normalizeStart
            addSubview(circularBars[i])
        }
        
        
        addSubview(randomButton)
        randomButton.addTarget(self, action: #selector(ClickButton), for: .touchUpInside)
        
        SetConstraints()
    }
    
    @objc private func ClickButton(){

    }
    
    private func SetConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        
        for circle in circularBars{
            constraints.append(circle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10))
            constraints.append(circle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
            constraints.append(circle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10))
        }
        
        constraints.append(randomButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10))
        constraints.append(randomButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10))
        constraints.append(randomButton.widthAnchor.constraint(equalToConstant: 40))
        constraints.append(randomButton.heightAnchor.constraint(equalToConstant: 40))
        NSLayoutConstraint.activate(constraints)
    }

}
