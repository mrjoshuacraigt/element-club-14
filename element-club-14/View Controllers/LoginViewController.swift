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
        // Do any additional setup after loading the view.
        appleLoginButton.addTarget(self, action: #selector(startSignInWithAppleFlow), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ((UserDefaults.standard.string(forKey: "uid")) != nil) {
            didAuthenticate()
        } else {
            style()
            layout()
        }
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
    
    func didAuthenticate() {
        
        print("getting tapped")
        //Create and present tab bar control
        let tabBarVc = UITabBarController()
    
        
        let profileVc = ProfileViewController()
        profileVc.title = "Profile"
        let summaryVc = SummaryViewController()
        summaryVc.title = "Summary"
        let summaryNc = UINavigationController(rootViewController: summaryVc)
        
        tabBarVc.setViewControllers([summaryNc, profileVc], animated: false)
        
        guard let items = tabBarVc.tabBar.items else {
            return
        }
        
        let images = ["chart.xyaxis.line", "person.crop.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }

        tabBarVc.modalPresentationStyle = .fullScreen
        present(tabBarVc, animated: false)
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
          // User is signed in to Firebase with Apple.
          // ...
        
            
            guard authResult != nil, authResult?.user.uid != nil, authResult?.user.email != nil  else {
                return
            }
    
            UserDbHelper.addNewUser(uid: (authResult?.user.uid)!, email: authResult!.user.email!, displayName: authResult?.user.displayName)
        
            UserDefaults.standard.set("\(authResult!.user.uid)",forKey: "uid")
            
            self.didAuthenticate()
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
