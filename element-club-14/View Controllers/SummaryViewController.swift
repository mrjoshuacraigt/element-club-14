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
}

var data = [
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm"),
    SummaryModel(title: "Title1", value: "134", unit: "pds", date: "4:21 pm")
]



class SummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    
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
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 0),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 0),
        
        ])
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SummaryTableViewCell
        
        cell.backgroundColor = .gray
        
        let summary = data[indexPath.row]
        cell.summary = summary
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
