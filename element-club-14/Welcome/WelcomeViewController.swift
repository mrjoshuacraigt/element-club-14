//
//  WelcomeNavigationController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/5/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let viewControllerContainer = UIView()
    
    let welcomePageViewController = WelcomePageViewController()
    
    let buttonContainerView = UIView()
    
    let loginButton = UIButton()
    let signupButon = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Welcome"
        setup()
        layout()
        // Do any additional setup after loading the view.
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
        viewControllerContainer.backgroundColor = .systemGray
        
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        buttonContainerView.backgroundColor = .systemOrange
        buttonContainerView.isUserInteractionEnabled = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        loginButton.frame.size.height = 80
        loginButton.frame.size.width = 30
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        
        signupButon.translatesAutoresizingMaskIntoConstraints = false
        signupButon.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
        signupButon.frame.size.height = 80
        signupButon.frame.size.width = 30
        signupButon.setTitle("Sign Up", for: .normal)
        signupButon.backgroundColor = .systemBlue
        
        
    }
    
    func layout() {
        
        view.addSubview(viewControllerContainer)
        view.addSubview(buttonContainerView)
        
        buttonContainerView.addSubview(signupButon)
        buttonContainerView.addSubview(loginButton)
        
        
        
        NSLayoutConstraint.activate([
            viewControllerContainer.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            viewControllerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewControllerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewControllerContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            
            buttonContainerView.topAnchor.constraint(equalToSystemSpacingBelow: viewControllerContainer.bottomAnchor, multiplier: 0),
            buttonContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            signupButon.topAnchor.constraint(equalToSystemSpacingBelow: buttonContainerView.topAnchor, multiplier: 4),
            signupButon.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor),

            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: signupButon.bottomAnchor, multiplier: 2),
            loginButton.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor)
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
