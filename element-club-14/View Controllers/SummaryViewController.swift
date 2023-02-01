//
//  SummaryViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/31/23.
//

import UIKit

class SummaryViewController: UIViewController {
    
    private let dateRangeSegmentedController = UISegmentedControl(items: ["D", "W", "M", "6M", "Y"])
    
    private let scrollView = UIScrollView()
    
    private let fakeChartImageView = UIImageView()
    
    let summaryLabel = UILabel()
    
    let summaryTextview = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Summary"
        // Do any additional setup after loading the view.
        setup()
        layout()
    }
    
    @objc
    func addData(){
        
    }
    

    func setup() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Add Data", style: .plain, target: self, action: #selector(addData))
        
        dateRangeSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        dateRangeSegmentedController.selectedSegmentIndex = 1
        
        
        fakeChartImageView.image = UIImage(systemName: "chart.xyaxis.line")
        fakeChartImageView.translatesAutoresizingMaskIntoConstraints = false
        fakeChartImageView.contentMode = .scaleAspectFit
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.text = "Overview"
        
        summaryTextview.translatesAutoresizingMaskIntoConstraints = false
        summaryTextview.text = "Testing Testing"
        summaryTextview.isEditable = false
        summaryTextview.backgroundColor = UIColor.systemGray
        summaryTextview.layer.cornerRadius = 10
        summaryTextview.sizeToFit()
        
        
    }
    
    func layout() {
        
        view.addSubview(scrollView)
        
        
        scrollView.addSubview(dateRangeSegmentedController)
        scrollView.addSubview(fakeChartImageView)
        scrollView.addSubview(summaryLabel)
        scrollView.addSubview(summaryTextview)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dateRangeSegmentedController.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 1),
            dateRangeSegmentedController.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: dateRangeSegmentedController.trailingAnchor, multiplier: 2),
            dateRangeSegmentedController.heightAnchor.constraint(equalToConstant: 30),
            
            
            fakeChartImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateRangeSegmentedController.bottomAnchor, multiplier: 2),
            
            fakeChartImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            fakeChartImageView.widthAnchor.constraint(equalToConstant: 550),
            fakeChartImageView.heightAnchor.constraint(equalToConstant: 300),
            
            summaryLabel.topAnchor.constraint(equalToSystemSpacingBelow: fakeChartImageView.bottomAnchor, multiplier: 2),
            summaryLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 2),
            summaryLabel.heightAnchor.constraint(equalToConstant: 45),
            
            summaryTextview.topAnchor.constraint(equalToSystemSpacingBelow: summaryLabel.bottomAnchor, multiplier: 2),
            
            summaryTextview.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 2),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: summaryTextview.trailingAnchor, multiplier: 2)
            
//            dateRangeSegmentedController.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
//            dateRangeSegmentedController.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: dateRangeSegmentedController.trailingAnchor, multiplier: 2),
//            dateRangeSegmentedController.heightAnchor.constraint(equalToConstant: 30),
//
//
//            fakeChartImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateRangeSegmentedController.bottomAnchor, multiplier: 2),
//
//            fakeChartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            fakeChartImageView.widthAnchor.constraint(equalToConstant: 550),
//            fakeChartImageView.heightAnchor.constraint(equalToConstant: 300)
        
        
        
        ])
        
        
    }

}
