//
//  UserBarView.swift
//  IronCount
//
//  Created by Filip Matijevic on 01.11.2023..
//

import UIKit

class UserBarView: UIView {
    
    private let blurredBackgroundView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.layer.cornerRadius = 15
        blurEffectView.clipsToBounds = true
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.frame = CGRect(x: 40, y: 40, width: 30, height: 30)
        return imageView
    }()
    
    private let profileName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
        profileImageView.layer.cornerRadius = min(profileImageView.bounds.width, profileImageView.bounds.height) / 2
    }
    
    func Init(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurredBackgroundView)
        addSubview(profileImageView)
        addSubview(profileName)
        profileName.text = "This is someone"
        
        InitImageConstraints()
        InitNameConstraints()
        InitBlurConstraints()
    }
    
    func InitImageConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10))
        constraints.append(profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10))
        constraints.append(profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10))
        constraints.append(profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func InitNameConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(profileName.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10))
        constraints.append(profileName.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func InitBlurConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(blurredBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor))
        constraints.append(blurredBackgroundView.topAnchor.constraint(equalTo: self.topAnchor))
        constraints.append(blurredBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor))
        constraints.append(blurredBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    

}
