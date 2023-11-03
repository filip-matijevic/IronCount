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
        CircularProgressBarView(angleNormalized: 0/5.0, progressNormalized: 0.1, color: .black),
        CircularProgressBarView(angleNormalized: 1/5.0, progressNormalized: 0.1, color: .black),
        CircularProgressBarView(angleNormalized: 2/5.0, progressNormalized: 0.1, color: .black),
        CircularProgressBarView(angleNormalized: 3/5.0, progressNormalized: 0.1, color: .black),
        CircularProgressBarView(angleNormalized: 4/5.0, progressNormalized: 0.1, color: .black)
    ]
        
    
    private let randomButton : UIButton = {
        let button = UIButton()
        button.layer.shadowRadius = 5
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "shuffle.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        return button
    }()
    
    private let humanImage :UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "human")?.withRenderingMode(.alwaysTemplate))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    private func Init(){
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let exeCount = 20.0
        var prevNormalizeStart = 0.0
        
        for i in 0...4{
            let currentBarProgress = Double(dummyExerciseCount[i]) / exeCount
            print(prevNormalizeStart)
            print(currentBarProgress)
            circularBars[i].angleNormalized = prevNormalizeStart
            circularBars[i].progressNormalized = currentBarProgress - 0.015
            
            prevNormalizeStart = prevNormalizeStart + currentBarProgress
            addSubview(circularBars[i])
        }
         
        
        addSubview(humanImage)
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
        
        
        let imagePadding = 30.0
        constraints.append(humanImage.topAnchor.constraint(equalTo: self.topAnchor, constant: imagePadding))
        constraints.append(humanImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: imagePadding))
        constraints.append(humanImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -imagePadding))
        constraints.append(humanImage.heightAnchor.constraint(equalTo: humanImage.widthAnchor))
        NSLayoutConstraint.activate(constraints)
    }

}
