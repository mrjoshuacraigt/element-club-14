//
//  UserDataLoader.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/24/23.
//

import Foundation


class DataLoader {
    
    func getRequest(_ endpoint: Endpoint,
                 then handler: @escaping (DataHandlerResult) -> Void) {

        guard !endpoint.children.isEmpty else {
            handler(.failure(.invalidChildren))
            return
        }
        
        guard (endpoint.databaseReference != nil) else {
            handler(.failure(.invalidDbReference))
            return
        }

        endpoint.databaseReference!.observeSingleEvent(of: .value, with: { snapshot in
            
            guard let dictionary = snapshot.value as? NSDictionary else {
                handler(.failure(.noData))
                return
            }
            handler(.success(dictionary))
        }) { error in
            handler(.failure(.data(reason: error.localizedDescription)))
        }
    }
}
