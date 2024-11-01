//
//  APIService.swift
//  6th_HW_Kimdowon
//
//  Created by 김도원 on 10/30/24.
//

import Foundation

struct Member: Codable {
    let name: String
    let age: Int
    let part: String
}

class APIService {
    let baseURL = " http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"
    
    func createMember(member: Member, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/user") else {
            print("유효하지 않은 URL")
            completion(false)
            return
        }
        
        let request = NetworkRequest(url: url, method: .post, body: member)
        NetworkManager.shared.performRequest(request) { success in
            completion(success)
        }
    }
}
