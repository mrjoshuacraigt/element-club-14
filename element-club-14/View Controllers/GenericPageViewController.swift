//
//  WelcomePageViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/2/23.
//

import UIKit

class GenericPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var initialPage = 0
    
    init(pages: [UIViewController] = [UIViewController](), initialPage: Int = 0) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.pages = pages
        self.initialPage = initialPage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.
        pageControl.addTarget(self, action: #selector(pageControlerTapped(_:)), for: .valueChanged)
        navigationController?.navigationBar.isTranslucent = true
        setup()
        style()
        layout()

    }
    
    @objc func pageControlerTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }

}

extension GenericPageViewController {
    

    
    func setup() {
        
        dataSource = self
        delegate = self
              
        
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
            
        ])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! WelcomePageviewItemViewController) else {return nil}
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
    
    
    
    
}
