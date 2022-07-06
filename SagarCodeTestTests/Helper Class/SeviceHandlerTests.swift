//
//  SeviceHandlerTests.swift
//  SagarCodeTestTests
//
//  Created by Sagar Dabhi on 04/07/2022.
//

import Foundation

enum ResponseType {
    case error
    case success
}

class MockServiceHandlerManager: WebServiceHandlerProtocol {
    var responseType: ResponseType = .success
    func getWebService(wsMethod: URL, complete: @escaping (Result<Data, APIError>) -> Void) {
        switch responseType {
        case .error:
            complete(.failure(.noData))
        case .success:
            let jsonData = dataFromJSON(withName: "Project")!
            complete(.success(jsonData))
        }
    }
}
