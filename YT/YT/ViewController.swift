//
//  ViewController.swift
//  YT
//
//  Created by SinZih Liou on 2020/5/9.
//  Copyright © 2020 nickliu. All rights reserved.
//

import UIKit

class HomeComtroller: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        self.collectionView.backgroundColor = UIColor.white
        collectionView.register(ViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }



}

class ViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    let thumbnaiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
               imageView.backgroundColor = UIColor.green
               return imageView
    }()
    
    let separatorView: UIView = {
        let view =  UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    let titleLable: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    func setupViews() {
        addSubview(thumbnaiImageView)
        addSubview(separatorView)
        addSubview( userProfileImageView)
        addSubview(titleLable)
        addSubview(subtitleTextView)
        
         addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnaiImageView)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        //垂直
      addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnaiImageView,userProfileImageView,separatorView)
      addConstraintWithFormat(format: "H:|[v0]|", views: separatorView)
       
        //上 constrain
        addConstraint(NSLayoutConstraint.init(item: titleLable, attribute: .top, relatedBy: .equal, toItem: thumbnaiImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //左 constrain
        addConstraint(NSLayoutConstraint.init(item: titleLable, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //右 constrain
          addConstraint(NSLayoutConstraint.init(item: titleLable, attribute: .right, relatedBy: .equal, toItem: thumbnaiImageView, attribute: .right, multiplier: 1, constant: 0))
        //高 constrain
        addConstraint(NSLayoutConstraint.init(item: titleLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        //上 constrain
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1, constant: 8))
        //左 constrain
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //右 constrain
          addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnaiImageView, attribute: .right, multiplier: 1, constant: 0))
        //高 constrain
        addConstraint(NSLayoutConstraint.init(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
            }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}
extension  UIView {
    func addConstraintWithFormat(format: String , views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            view.translatesAutoresizingMaskIntoConstraints  = false
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}
