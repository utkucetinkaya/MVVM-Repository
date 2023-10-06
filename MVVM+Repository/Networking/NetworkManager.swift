//
//  NetworkManager.swift
//  MVVM+Repository
//
//  Created by Utku Çetinkaya on 6.10.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    // MARK: - Properties
    private let session = Session()
    
    // MARK: - Request
    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> Void) {
        session.request(router).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let data = try JSONSerialization.data(withJSONObject: value, options: [])
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
