//
//  PageCollectionViewCell.swift
//  AutoLayoutPractice
//
//  Created by Dai Tran on 11/13/17.
//  Copyright © 2017 Dai Tran. All rights reserved.
//

import UIKit

class PageCollectionViewCell : UICollectionViewCell {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributeText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]))
        
        textView.attributedText = attributeText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainPink, for: .normal)
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor.mainPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            
            bearImageView.image = UIImage(named: page.imageName)
            let attributeText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            attributeText.append(NSMutableAttributedString(string: "\n\n\n\(page.description)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]))
            
            descriptionTextView.attributedText = attributeText
            descriptionTextView.textAlignment = .center
        }
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(bearImageView)
        
        addSubview(descriptionTextView)
        
        if #available(iOS 11, *) {
            NSLayoutConstraint.activate([
                topImageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                topImageContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                topImageContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                topImageContainerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.centerXAnchor),
                bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.centerYAnchor),
                bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.bottomAnchor),
                descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
                descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
                descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                topImageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
                bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
                bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                descriptionTextView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
                descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
                descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
                descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
