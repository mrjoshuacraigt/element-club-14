//
//  UserLogicController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/24/23.
//

import Foundation

class UserLogicController {

    let dataLoader = DataLoader()

    func getUser(userId: String, then handler: @escaping (UserResult) -> Void) {

        dataLoader.getRequest(.user(userId)) { [weak self] result in

            switch result {
            case .success(let data):
                guard let userData = self?.parseUserData(userData: data) else {
                    return handler(.failure(.parsing))
                }
                handler(.success(userData))
            case .failure(let error):
                handler(.failure(error))
            }

        }
    }

    private func parseUserData(userData: NSDictionary) -> UserModel? {
        
        return UserModel(dictionary: userData)
        
    }

}

