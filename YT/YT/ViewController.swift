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
    let thumbnaiImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let separatorView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
   
    func setupViews() {
        addSubview(thumbnaiImageView)
        addSubview(separatorView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : thumbnaiImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : thumbnaiImageView,"v1" : separatorView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : separatorView]))
//                 addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : separatorView]))
        
        thumbnaiImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}
extension  UIView {
    func addConstraintWithFormat(format: String , views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary)
    }
}
