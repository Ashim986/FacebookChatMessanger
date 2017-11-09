//
//  ViewController.swift
//  FacebookChatMessanger
//
//  Created by ashim Dahal on 11/8/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellID = "cellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Recent"
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellID)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FriendCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class FriendCell: BaseCell {
    
    let profileImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        imageView.image = #imageLiteral(resourceName: "zuckprofile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Mark Zuckerberg"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let messageLabel : UILabel = {
        let label = UILabel()
        label.text = "Your Friend Name and something Else and much more "
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "12:05 pm"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saparatorView : UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let hasSeenProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.image = #imageLiteral(resourceName: "zuckprofile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override func setupViews() {
//         backgroundColor = .blue
        addSubview(profileImageView)
        addSubview(containerView)
        addSubview(nameLabel)
        addSubview(messageLabel)
        addSubview(timeLabel)
        addSubview(saparatorView)
        addSubview(hasSeenProfileImage)
        addConstraintForViews()
    }
    func addConstraintForViews() {
        // constraint for ProfileImageView
        NSLayoutConstraint.activate([profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor), profileImageView.leftAnchor.constraint(equalTo: leftAnchor , constant : 12), profileImageView.widthAnchor.constraint(equalToConstant: 68),profileImageView.heightAnchor.constraint(equalToConstant: 68)])
        // constraing for separator line
        NSLayoutConstraint.activate([saparatorView.bottomAnchor.constraint(equalTo: bottomAnchor), saparatorView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant :  8),saparatorView.rightAnchor.constraint(equalTo: rightAnchor),saparatorView.heightAnchor.constraint(equalToConstant: 1)])
        // constraint for container view
        NSLayoutConstraint.activate([containerView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor , constant : 8), containerView.centerYAnchor.constraint(equalTo: centerYAnchor), containerView.rightAnchor.constraint(equalTo: rightAnchor, constant : -8), containerView.heightAnchor.constraint(equalToConstant: 50)])
        // constraint for nameLabel
        NSLayoutConstraint.activate([nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor , constant : 0), nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor), nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor), nameLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor)])
        // constraint for messageLabel
        NSLayoutConstraint.activate([messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor , constant : 0), messageLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor), messageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor), messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)])
        // constraint for TimeLabel
        NSLayoutConstraint.activate([timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor , constant : 0), timeLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor), timeLabel.widthAnchor.constraint(equalToConstant: 80), timeLabel.heightAnchor.constraint(equalToConstant: 20)])
        // constraint for hasSeenProfileImage
        NSLayoutConstraint.activate([hasSeenProfileImage.rightAnchor.constraint(equalTo: containerView.rightAnchor),hasSeenProfileImage.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -8),hasSeenProfileImage.widthAnchor.constraint(equalToConstant: 16), hasSeenProfileImage.heightAnchor.constraint(equalToConstant: 16)])
    }
        
}

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        
    }
    
}
extension UIColor {
    convenience init(r : CGFloat , g : CGFloat, b : CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

