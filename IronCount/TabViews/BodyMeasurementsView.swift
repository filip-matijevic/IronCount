//
//  BodyMeasurementsView.swift
//  IronCount
//
//  Created by Filip Matijevic on 12.10.2023..
//

import UIKit

class BodyMeasurementsView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let baseView = UIView(frame: CGRect(x: 10, y: 10, width: view.bounds.width-20, height: view.bounds.height - 20))
        baseView.backgroundColor = .brown
        
        let view1 = UIView(frame: CGRect(x: view.frame.minX, y: view.frame.minY, width: view.bounds.width, height: view.bounds.height))
        view1.backgroundColor = .red
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view2 = UIView()
        view2.backgroundColor = .green
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        let view3 = UIView()
        view3.backgroundColor = .blue
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        
        view.addSubview(baseView)
        baseView.addSubview(view1)
        baseView.addSubview(view2)
        baseView.addSubview(view3)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
