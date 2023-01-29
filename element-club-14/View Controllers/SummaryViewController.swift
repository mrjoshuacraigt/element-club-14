//
//  SummaryViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/23/23.
//

import UIKit

class SummaryViewController: UIViewController {
    
    private let loginImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "test"))
        imageView.frame.size.width = 450
        imageView.frame.size.width = 450
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Summary"
        view.backgroundColor = .orange
        // Do any additional setup after lo
        view.addSubview(loginImage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginImage.center = view.center
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
