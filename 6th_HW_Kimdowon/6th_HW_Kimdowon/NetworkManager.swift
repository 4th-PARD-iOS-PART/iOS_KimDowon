//
//  NetworkManager.swift
//  6th_HW_Kimdowon
//
//  Created by 김도원 on 10/30/24.

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct NetworkRequest {
    let url: URL
    let method: HTTPMethod
    let body: Encodable? // Optional Encodable for request body
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                print("JSON 인코딩 에러: \(error)")
            }
        }
        
        return request
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest(_ request: NetworkRequest, completion: @escaping (Bool) -> Void) {
        let urlRequest = request.urlRequest
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("에러 발생: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                completion(true) // 성공
            } else {
                completion(false) // 실패
            }
        }
        task.resume()
    }
}
