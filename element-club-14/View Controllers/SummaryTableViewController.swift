//
//  SummaryViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/23/23.
//

import UIKit

struct SummaryModel {
    let title: String
    let value: String
    let unit: String
    let date: String
    let action: Action
}

var data = [
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .agility),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .agility),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .coordination),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .coordination),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .stablility),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .stablility),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .balance),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .flexiblity),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .strength),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .strength),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .acceleration),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .acceleration),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .power),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .power),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .power),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .pull),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .pull),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .pull),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .push),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .push),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .push),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .speed),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .stamina),
    SummaryModel(title: "Title1", value: "134", unit: "lbs", date: "4:21 pm", action: .endurance)
]



class SummaryTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    
    let cellId = "cellid"
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Summary"
        // Do any additional setup after lo
        setup()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setup() {
        navigationItem.title = "Summary"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SummaryTableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 0),
//            view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SummaryTableViewCell
                
        let summary = data[indexPath.row]
        cell.summary = summary
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let summaryVC = SummaryViewController()
        self.navigationController?.pushViewController(summaryVC, animated: true)
        
    }

}
