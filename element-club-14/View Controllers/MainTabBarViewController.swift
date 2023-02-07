//
//  MainTabBarViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/5/23.
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseDatabase

class MainTabBarViewController: UITabBarController {
    
   
    
    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        //Are we logined in?
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                // User is signed in. Show home screen
                self.showWelcomeScreen()
            }
        }
        // Do any additional setup after loading the view.
    }
    

    
    @objc
    func showWelcomeScreen() {
        let welcomeNavVc = UINavigationController(rootViewController: WelcomeViewController())
        welcomeNavVc.modalPresentationStyle = .fullScreen
        self.present(welcomeNavVc, animated: true)
        self.selectedIndex = 0
    }
    
    @objc
    func dismissWelcomeScreen() {
        
        self.dismiss(animated: true)
    }


}
    

extension MainTabBarViewController {
    
    func setup() {
        
        let showWelcomeScreen =  Notification.Name(rawValue: "ShowWelcomeScreen")
        notificationCenter.addObserver(self, selector: #selector(self.showWelcomeScreen), name: showWelcomeScreen, object: nil)
        
        let dismissWelcomeScreen = Notification.Name(rawValue: "DismissWelcomeScreen")
        notificationCenter.addObserver(self, selector: #selector(self.dismissWelcomeScreen), name: dismissWelcomeScreen, object: nil)

        let profileVc = ProfileViewController()
        profileVc.title = "Profile"
        let summaryVc = SummaryTableViewController()
        summaryVc.title = "Summary"
        let summaryNc = UINavigationController(rootViewController: summaryVc)
        
        self.setViewControllers([summaryNc, profileVc], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["chart.xyaxis.line", "person.crop.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
    }
    
    func layout() {
        
        
        
    }
}
