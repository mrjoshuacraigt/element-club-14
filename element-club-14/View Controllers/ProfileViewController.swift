//
//  ProfileViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/23/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private let stackInternalStacking: CGFloat = 8
    
    private let profileImageView = UIImageView();
    
    
    private let containerStack = UIStackView();
    
    
    private let nameStackView = UIStackView();
    private let nameLabel = UILabel();
    private let nameTextField = UITextField();
    
    private let emailStackView = UIStackView();
    private let emailLabel = UILabel();
    private let emailTextField = UITextField();
    
    private let ageStackView = UIStackView();
    private let ageLabel = UILabel();
    private let ageTextField = UITextField();
    
    private let weightStackView = UIStackView();
    private let weightLabel = UILabel();
    private let weightTextField = UITextField();
    
    private let unitStackView = UIStackView();
    private let unitLabel = UILabel();
    private let unitTextField = UITextField();
    
    private let logoutButton = UIButton();
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        style()
        layout()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

    
    @objc func didTapButton() {
        
        print("getting tapped")
        //Create and present tab bar control
    do {
        try Auth.auth().signOut()
        UserDefaults().set(nil, forKey: "uid")
        let loginVc = LoginViewController()
        loginVc.modalPresentationStyle = .fullScreen
        present(loginVc, animated: false)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
        
        
    }
    

}

extension ProfileViewController {
    
    func style() {
        
        //Profile Imageview
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.contentMode = .scaleAspectFill
        
        //Main Container Stack
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.spacing = 8
        containerStack.axis = .vertical
        
        //name
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.spacing = stackInternalStacking
        nameStackView.axis = .vertical
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: nameTextField.frame.height))
        nameTextField.leftViewMode = .always
        nameTextField.placeholder = "Enter Name"
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.cornerRadius = 8
        nameTextField.delegate = self
        
        //email
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.spacing = stackInternalStacking
        emailStackView.axis = .vertical
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.placeholder = "Enter Email"
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.delegate = self
        
        
        //age
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.spacing = stackInternalStacking
        ageStackView.axis = .vertical
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "Age"
        
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: ageTextField.frame.height))
        ageTextField.leftViewMode = .always
        ageTextField.placeholder = "Enter Age"
        ageTextField.layer.borderWidth = 1
        ageTextField.layer.cornerRadius = 8
        ageTextField.layer.borderColor = UIColor.lightGray.cgColor
        ageTextField.delegate = self
        
        
        //weight
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.spacing = stackInternalStacking
        weightStackView.axis = .vertical
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "Weight"
        
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: weightTextField.frame.height))
        weightTextField.leftViewMode = .always
        weightTextField.placeholder = "Enter Weight"
        weightTextField.layer.borderWidth = 1
        weightTextField.layer.cornerRadius = 8
        weightTextField.layer.borderColor = UIColor.lightGray.cgColor
        weightTextField.delegate = self
        
        
        //unit
        unitStackView.translatesAutoresizingMaskIntoConstraints = false
        unitStackView.spacing = stackInternalStacking
        unitStackView.axis = .vertical
        
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "Unit"
        
        unitTextField.translatesAutoresizingMaskIntoConstraints = false
        unitTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: unitTextField.frame.height))
        unitTextField.leftViewMode = .always
        unitTextField.placeholder = "Enter Metric/Imperial"
        unitTextField.layer.borderWidth = 1
        unitTextField.layer.cornerRadius = 8
        unitTextField.layer.borderColor = UIColor.lightGray.cgColor
        unitTextField.delegate = self
        
        // button
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        logoutButton.backgroundColor = .systemPink
        logoutButton.layer.cornerRadius = 8
        
        
    }
    
    func layout() {
        
        //add profile pic to page
        view.addSubview(profileImageView)
        
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        
        ageStackView.addArrangedSubview(ageLabel)
        ageStackView.addArrangedSubview(ageTextField)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightTextField)
        
        unitStackView.addArrangedSubview(unitLabel)
        unitStackView.addArrangedSubview(unitTextField)
        
        containerStack.addArrangedSubview(nameStackView)
        containerStack.addArrangedSubview(emailStackView)
        containerStack.addArrangedSubview(ageStackView)
        containerStack.addArrangedSubview(weightStackView)
        containerStack.addArrangedSubview(unitStackView)
        
        view.addSubview(containerStack)
        
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant:  200),
            profileImageView.heightAnchor.constraint(equalToConstant:  200),
            profileImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            
            containerStack.topAnchor.constraint(equalToSystemSpacingBelow: profileImageView.bottomAnchor, multiplier: 1),
            containerStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: containerStack.trailingAnchor, multiplier: 2),
            
            
            logoutButton.topAnchor.constraint(equalToSystemSpacingBelow: containerStack.bottomAnchor, multiplier: 4),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            unitTextField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        
    }
    
    
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}
