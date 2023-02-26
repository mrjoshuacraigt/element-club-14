//
//  SummaryViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/23/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class SummaryTableViewController: UITableViewController {


    
    let cellId = "cellid"
    
    private let summaryLogic = SummaryLogicController()
    
    var summary: [SummaryModel]? {
        didSet {
            guard let summary = summary else {return}
            self.tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Summary"
        // Do any additional setup after lo
        setup()
        layout()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        summaryLogic.getSummary(userId: currentUser.uid, then: { [weak self] result in
            DispatchQueue.main.async {
                self?.render(result: result)
            }
        })
        
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
        NSLayoutConstraint.activate([

            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        
        ])
        tableView.reloadData()
    }
    
    func render(result: SummaryResult) {

        switch result{
        case .success(let summaryModel):
             handleSuccess(summaryModel: summaryModel)
        case .failure(let error):
            handleError(userModelError: error)
        }
    }
    
    func handleSuccess(summaryModel: [SummaryModel]) {
        self.summary = summaryModel
    }
    
    func handleError(userModelError: Error) {
        print(userModelError.localizedDescription)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summary?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SummaryTableViewCell
        
        guard let summary = summary?[indexPath.row] else {
            return cell
        }
        
        cell.summary = summary
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let summaryVC = SummaryViewController()
        navigationController?.pushViewController(summaryVC, animated: true)
        
    }

}
