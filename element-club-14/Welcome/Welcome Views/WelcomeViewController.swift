//
//  WelcomeNavigationController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/5/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let viewControllerContainer = UIView()
    
    let welcomePageViewController: GenericPageViewController = {
        
        let page1 = WelcomePageviewItemViewController(image: nil, titleText: "Welcome To", subTitleText: "Element")
        let page2 = WelcomePageviewItemViewController(image: UIImage(systemName: "square.and.pencil"), titleText: "Simple Tracking", subTitleText: "Quickly log an exercise with minimal inputs.")
        let page3 = WelcomePageviewItemViewController(image: UIImage(systemName: "cloud"), titleText: "Access from anywhere", subTitleText: "Keep everything at your fingertips on all your favorite devices.")
        let page4 = WelcomePageviewItemViewController(image: UIImage(systemName: "person.text.rectangle"), titleText: "Become The Best You", subTitleText: "Our program is designed to get you fit and keep you that way")
        
        return GenericPageViewController(pages: [page1, page2, page3, page4])

    }()
    
    let buttonContainerView = UIView()
    
    let buttonStack = UIStackView()
    
    let loginButton = UIButton.elementButton(title: "Login", color: UIColor.systemBlue, buttonType: .filled)
    let signupButon = UIButton.elementButton(title: "Sign Up", color: UIColor.systemBlue, buttonType: .border)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Welcome"
        setup()
        layout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc
    func loginClicked() {
        print("login nav clicked")
        let loginVc = LoginViewController()
        self.navigationController?.pushViewController(loginVc, animated: true)
        
    }
    
    @objc
    func signupClicked() {
        print("singup nav clicked")
        let onBoardingVc = OnBoardingViewController()
        self.navigationController?.pushViewController(onBoardingVc, animated: true)
        
    }
    
    func setup() {
        
        viewControllerContainer.translatesAutoresizingMaskIntoConstraints = false
        viewControllerContainer.backgroundColor = .systemBlue
        
        welcomePageViewController.view.frame = CGRect(x: 0, y: 0, width: viewControllerContainer.frame.width, height: viewControllerContainer.frame.height)
        
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.backgroundColor = .systemOrange
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        
        signupButon.translatesAutoresizingMaskIntoConstraints = false
        signupButon.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .vertical
        buttonStack.spacing = 4
        
        
    }
    
    func layout() {
        
        viewControllerContainer.addSubview(welcomePageViewController.view)
        
        view.addSubview(viewControllerContainer)
        view.addSubview(buttonContainerView)
        
        buttonStack.addArrangedSubview(loginButton)
        buttonStack.addArrangedSubview(signupButon)
        
        buttonContainerView.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            viewControllerContainer.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            viewControllerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewControllerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewControllerContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            buttonContainerView.topAnchor.constraint(equalToSystemSpacingBelow: viewControllerContainer.bottomAnchor, multiplier: 0),
            buttonContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            buttonStack.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor),
            
//            signupButon.topAnchor.constraint(equalToSystemSpacingBelow: buttonContainerView.topAnchor, multiplier: 4),
//            signupButon.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
            signupButon.widthAnchor.constraint(equalToConstant: UIButton.BUTTON_WIDTH),
            signupButon.heightAnchor.constraint(equalToConstant: UIButton.BUTTON_HEIGHT),

//            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: signupButon.bottomAnchor, multiplier: 2),
//            loginButton.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: UIButton.BUTTON_WIDTH),
            loginButton.heightAnchor.constraint(equalToConstant: UIButton.BUTTON_HEIGHT)
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
