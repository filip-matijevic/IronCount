//
//  ViewController.swift
//  IronCount
//
//  Created by Filip Matijevic on 09.10.2023..
//

import UIKit
import FirebaseDatabase

class HomeScreen: UIViewController {

    @IBAction func showMessageBox(){
        
        UIView.animate(withDuration: 2.0, animations: { [self] in
            randomView.frame = CGRect(x: Int.random(in: 1...50), y: Int.random(in: 1...50), width: 50, height: 50)
        })
        
        /*
        let roundedBoxVC = WeightInputMessageView()
        roundedBoxVC.modalPresentationStyle = .overCurrentContext
        roundedBoxVC.modalTransitionStyle = .crossDissolve
        self.present(roundedBoxVC, animated: true, completion: nil)
         */
    }
    private let userScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.001)
        return scrollView
    }()
    
   
    private let userBarView = UserBarView()
    private let muscleDistributionView = MuscleGroupDistributionWidgetView()
    
    private let contentView = UIView()
    
    private let randomView : UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 500, width: 300, height: 100))
        button.setTitle("Show rounded box", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(showMessageBox), for: .touchUpInside)
        
        //contentView.backgroundColor = .red
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        print(view.bounds)
        userScrollView.frame = view.bounds
        view.addSubview(userScrollView)
        
        userScrollView.addSubview(contentView)
        
        contentView.addSubview(button)
        contentView.addSubview(muscleDistributionView)
        //contentView.addSubview(randomView)
        
        
        view.addSubview(userBarView)
        addConstraints()
        initScrollView()
        addBodyWidgetConstraints()
        
        print(userScrollView.contentSize.width)
        print(userScrollView.frame)
        
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(userBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(userBarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10))
        constraints.append(userBarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10))
        constraints.append(userBarView.heightAnchor.constraint(equalToConstant: 50))
        NSLayoutConstraint.activate(constraints)
    }
    private func addBodyWidgetConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(muscleDistributionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60))
        constraints.append(muscleDistributionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10))
        constraints.append(muscleDistributionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10))
        constraints.append(muscleDistributionView.heightAnchor.constraint(equalToConstant: 200))
        NSLayoutConstraint.activate(constraints)
        
        userScrollView.layoutSubviews()
    }
    
    private func initScrollView(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(userScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(userScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(userScrollView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(userScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        constraints.append(contentView.leadingAnchor.constraint(equalTo: userScrollView.leadingAnchor))
        constraints.append(contentView.trailingAnchor.constraint(equalTo: userScrollView.trailingAnchor))
        constraints.append(contentView.topAnchor.constraint(equalTo: userScrollView.topAnchor))
        constraints.append(contentView.bottomAnchor.constraint(equalTo: userScrollView.bottomAnchor))
        constraints.append(contentView.widthAnchor.constraint(equalTo: userScrollView.widthAnchor))
        
        constraints.append(contentView.heightAnchor.constraint(equalTo: userScrollView.heightAnchor, multiplier: 2))
        NSLayoutConstraint.activate(constraints)
    }

}

