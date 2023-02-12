//
//  APIManager.swift
//  SchoolAPI
//
//  Created by Adel Al-Aali on 2/11/23.
//

import Foundation
import Combine


enum Endpoint: String {
    case school
    case details
}

class APIManager {
    
    static let shared = APIManager()
    
    private var cancellables = Set<AnyCancellable>()
    private var baseURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    
    private init() {}
    
    func getData<T: Decodable>(endpoint: Endpoint, id: Int? = nil, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseURL.appending(endpoint.rawValue).appending(id == nil ? "" : "/\(id ?? 0)")) else {
                return promise(.failure(NetworkError.invalidURL))
            }
        }
        
        
    }
}


enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}

