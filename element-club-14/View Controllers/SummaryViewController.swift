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
    
    private let contentView = UIView()
    
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
        
        view.backgroundColor = .systemBackground
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Add Data", style: .plain, target: self, action: #selector(addData))
        
        dateRangeSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        dateRangeSegmentedController.selectedSegmentIndex = 1
        
        
        fakeChartImageView.image = UIImage(systemName: "chart.xyaxis.line")
        fakeChartImageView.translatesAutoresizingMaskIntoConstraints = false
        fakeChartImageView.contentMode = .scaleAspectFit
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.text = "Overview"
        
        summaryTextview.translatesAutoresizingMaskIntoConstraints = false
        summaryTextview.isEditable = false
        summaryTextview.isSelectable = false
        summaryTextview.text = "cvsdfgsfdgsdfgsdfgsdfsdfsdfsdfbsdfgnfjh,klhkjhgfjuyh"
        summaryTextview.backgroundColor = UIColor.systemPurple
        summaryTextview.textColor = UIColor.green
        summaryTextview.layer.cornerRadius = 10
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.systemOrange
        
        
        
    }
    
    func layout() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        
        contentView.addSubview(dateRangeSegmentedController)
        contentView.addSubview(fakeChartImageView)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(summaryTextview)
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),


            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 0),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 0),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor),

            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dateRangeSegmentedController.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            dateRangeSegmentedController.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: dateRangeSegmentedController.trailingAnchor, multiplier: 2),
            dateRangeSegmentedController.heightAnchor.constraint(equalToConstant: 30),


            fakeChartImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateRangeSegmentedController.bottomAnchor, multiplier: 2),

            fakeChartImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fakeChartImageView.widthAnchor.constraint(equalToConstant: 550),
            fakeChartImageView.heightAnchor.constraint(equalToConstant: 300),

            summaryLabel.topAnchor.constraint(equalToSystemSpacingBelow: fakeChartImageView.bottomAnchor, multiplier: 2),
            summaryLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            summaryLabel.heightAnchor.constraint(equalToConstant: 45),

            summaryTextview.topAnchor.constraint(equalToSystemSpacingBelow: summaryLabel.bottomAnchor, multiplier: 2),

            summaryTextview.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: summaryTextview.trailingAnchor, multiplier: 2),
            //Need to figure out how to make it a certain size
            summaryTextview.heightAnchor.constraint(equalToConstant: 50),
        
        
        ])
        
        
    }

}
