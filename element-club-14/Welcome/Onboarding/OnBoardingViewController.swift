//
//  OnBoardingViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/2/23.
//

import UIKit

class OnBoardingViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
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
