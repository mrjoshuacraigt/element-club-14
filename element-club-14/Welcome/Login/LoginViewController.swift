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
    
    private let appleLoginButton = ASAuthorizationAppleIDButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.style()
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
    
    func style() {
        club14ImageView.translatesAutoresizingMaskIntoConstraints = false
        club14ImageView.image = UIImage(named: "test")
        club14ImageView.contentMode = .scaleAspectFill
        
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        view.addSubview(club14ImageView)
        view.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            club14ImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            club14ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleLoginButton.topAnchor.constraint(equalToSystemSpacingBelow: club14ImageView.bottomAnchor, multiplier: 8),
            appleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleLoginButton.widthAnchor.constraint(equalToConstant: 200),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    
    
    
    
}
