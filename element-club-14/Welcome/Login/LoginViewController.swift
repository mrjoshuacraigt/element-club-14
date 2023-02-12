//
//  LoginViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/24/23.
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseDatabase

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    
    fileprivate var currentNonce: String?
    private let club14ImageView = UIImageView()
    private let mainStackView = UIStackView.elementStackView(spacing: 12, axis: .vertical)

    private let userNameTextField = UITextField.elementTextField(placerholder: "Username")
    
    private let passwordTextField = UITextField.elementTextField(placerholder: "Password", isSecureText: true)
    
    private let appleLoginButton = ASAuthorizationAppleIDButton()
    
    private let loginButton = UIButton.elementButton(title: "Login", color: UIColor.systemBlue, buttonType: .filled)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.setup()
        self.layout()
        // Do any additional setup after loading the view.
        appleLoginButton.addTarget(self, action: #selector(startSignInWithAppleFlow), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    

    @available(iOS 13, *)
    @objc func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
        
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
        guard let nonce = currentNonce else {
          fatalError("Invalid state: A login callback was received, but no login request was sent.")
        }
        guard let appleIDToken = appleIDCredential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }
        // Initialize a Firebase credential.
        let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                  idToken: idTokenString,
                                                  rawNonce: nonce)
        // Sign in with Firebase.
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if (error != nil) {
            // Error. If error.code == .MissingOrInvalidNonce, make sure
            // you're sending the SHA256-hashed nonce as a hex string with
            // your request to Apple.
                print(error?.localizedDescription as Any)
            return
          }
            
            if let authResult = authResult, let email = authResult.user.email {
                if (authResult.additionalUserInfo?.isNewUser) != nil && authResult.additionalUserInfo?.isNewUser == true {
                        UserDbHelper.addNewUser(uid: authResult.user.uid, email: email, displayName: authResult.user.displayName ?? "")
                }
            }
            // 1. Name of the Notification
            let notificationName = Notification.Name("DismissWelcomeScreen")

            // 2. Broadcast the Notification with name, not passing any data
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: nil)
        }
      }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error.
            print("Sign in with Apple errored: \(error)")
    }

    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }


}

extension LoginViewController {
    
    func setup() {
        club14ImageView.translatesAutoresizingMaskIntoConstraints = false
        club14ImageView.image = UIImage(named: "test")
        club14ImageView.contentMode = .scaleAspectFill
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        appleLoginButton.layer.cornerRadius = 8
        
    }
    
    func layout() {
        
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(club14ImageView)
        mainStackView.addArrangedSubview(userNameTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.addArrangedSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            club14ImageView.widthAnchor.constraint(equalToConstant: 200),
            club14ImageView.heightAnchor.constraint(equalToConstant: 200),
             
            //username
            userNameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: userNameTextField.trailingAnchor, multiplier: 2),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40),
             
            //password
            passwordTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.trailingAnchor, multiplier: 2),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            appleLoginButton.widthAnchor.constraint(equalToConstant: 200),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
}
