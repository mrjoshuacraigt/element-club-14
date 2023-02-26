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
                guard let summaryData = self?.parseSummaryData(uid: userId, summaryData: data) else {
                    return handler(.failure(.parsing))
                }
                handler(.success(summaryData))
            case .failure(let error):
                handler(.failure(error))
            }

        }
    }

    private func parseSummaryData(uid: String, summaryData: NSDictionary) -> [SummaryModel] {
        
        var result = [SummaryModel]()
        
        
        ElementType.allCases.map {
            
            print( $0.self)
            
            
            if let exercise = summaryData[$0.rawValue] as? NSDictionary {
                result.append(SummaryModel(dictionary: exercise))
                
                
            } else {
                result.append(SummaryModel(uid: uid, exercise: $0.rawValue))
                
                
            }
        }
        
        return result
        
    }

}
