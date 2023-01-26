//
//  LoginViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/24/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Login In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton() {
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
