//
//  WeightInputMessageView.swift
//  IronCount
//
//  Created by Filip Matijevic on 30.10.2023..
//

import UIKit

class WeightInputMessageView: UIViewController {
    
    private var dismissButton : UIButton = {
        let myButton = UIButton(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        myButton.backgroundColor = .systemPink
        myButton.layer.cornerRadius = 10
        myButton.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        return myButton;
    }()
    
    private var selfView : UIView = {
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        myView.layer.cornerRadius  = 20
        myView.backgroundColor = .white
        myView.layer.shadowRadius = 5
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private var textInputBox : UITextField = {
        let myTextBox = UITextField()
        myTextBox.placeholder = "Enter text here"
        myTextBox.borderStyle = .roundedRect
        myTextBox.translatesAutoresizingMaskIntoConstraints = false
        return myTextBox
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        view.addSubview(selfView)
        selfView.addSubview(dismissButton)
        selfView.addSubview(textInputBox)
        dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        
        setConstraints()
        
        print("Hello from WeightInputMessageView")
    }
    
    func setConstraints(){
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(selfView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(selfView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(selfView.widthAnchor.constraint(equalToConstant: 250))
        
        constraints.append(textInputBox.topAnchor.constraint(equalTo: selfView.topAnchor, constant: 50))
        constraints.append(textInputBox.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(textInputBox.leadingAnchor.constraint(equalTo: selfView.leadingAnchor, constant: 20))
        constraints.append(textInputBox.trailingAnchor.constraint(equalTo: selfView.trailingAnchor, constant: -20))
        
        constraints.append(selfView.bottomAnchor.constraint(equalTo: textInputBox.bottomAnchor, constant: 20))
                           
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func dismissSelf(){
        print("Dismissing self with text value : " + textInputBox.text!)
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
