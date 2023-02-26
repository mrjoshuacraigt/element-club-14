//
//  ServiceEnums.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/23/23.
//

import Foundation


enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

enum ViewState<Model, Error: Swift.Error> {
    case loading
    case presenting(Model)
    case failed(Error)
}


//Results typealias
typealias SummaryResult = Result<[SummaryModel], FirebaseServiceError>

typealias DataHandlerResult = Result<NSDictionary, FirebaseServiceError>

typealias UserResult = Result<UserModel, FirebaseServiceError>

typealias ExerciseDataResult = Result<SummaryModel, FirebaseServiceError>
typealias ExerciseDataViewStateResult = Result<SummaryModel, FirebaseServiceError>


enum FirebaseServiceError: Error {
    case parsing
    case network(statusCode: Int)
    case general(reason: String)
    case data(reason: String)
    case invalidChildren
    case invalidDbReference
    case noData
}
