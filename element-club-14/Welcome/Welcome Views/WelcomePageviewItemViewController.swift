//
//  GenericPageviewViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/8/23.
//

import UIKit

class WelcomePageviewItemViewController: UIViewController {
    
    private let image: UIImage?
    private var imageView: UIImageView?
    private let titleLabel:  UILabel
    private let subTitleLabel: UILabel
    
    
    private let containerStack = UIStackView.elementStackView(spacing: 2.0, axis: .vertical)
    
    init(image: UIImage?, titleText: String, subTitleText: String) {
        self.image = image
        self.titleLabel = UILabel.elementLabel(title: titleText, labelType: .title)
        self.subTitleLabel = UILabel.elementLabel(title: subTitleText, labelType: .subtitle)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        layout()
    }
    
    func setup() {
        
        if (image != nil) {
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            imageView?.image = image
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            imageView?.contentMode = .scaleAspectFill
            containerStack.addArrangedSubview(imageView!)
            
            NSLayoutConstraint.activate([
                imageView!.widthAnchor.constraint(equalToConstant: 200),
                imageView!.heightAnchor.constraint(equalToConstant: 200)
            ])
            
        }
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerStack.addArrangedSubview(titleLabel)
        containerStack.addArrangedSubview(subTitleLabel)
        containerStack.spacing = 20
        containerStack.alignment = .center
        
        view.addSubview(containerStack)
        
        
    }
    
    func layout() {
        
        NSLayoutConstraint.activate([
            
            containerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: containerStack.trailingAnchor, multiplier: 2)
        ])
        
        
        
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
