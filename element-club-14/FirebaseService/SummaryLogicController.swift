//
//  DataLogicController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/25/23.
//

import Foundation

class SummaryLogicController {

    let dataLoader = DataLoader()

    func getSummary(userId: String, then handler: @escaping (SummaryResult) -> Void) {

        dataLoader.getRequest(.summary(userId)) { [weak self] result in

            switch result {
            case .success(let data):
                guard let summaryData = self?.parseSummaryData(summaryData: data) else {
                    return handler(.failure(.parsing))
                }
                handler(.success(summaryData))
            case .failure(let error):
                handler(.failure(error))
            }

        }
    }

    private func parseSummaryData(summaryData: NSDictionary) -> [SummaryModel] {
        
        
        var result = [SummaryModel]()
        
        return result
        
    }

}
