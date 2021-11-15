//
//  UserSignService.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/15.
//

import Foundation
import Alamofire

import Foundation
import Alamofire

struct UserSignService {
    static let shared = UserSignService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.loginURL
        let hearder: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [ "email": email,
                                 "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: hearder)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case  .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err): print(err)
                completion(.networkFail)
            }
        }
    }
    
    
    
    
    
    func signUp(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.signUpURL
        let hearder: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [ "email": email,
                                 "name": name,
                                 "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: hearder)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case  .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignUpStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err): print(err)
                completion(.networkFail)
            }
        }
    }
    
    
    

    
    
    
    
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else { return .pathErr(data) }
        
        switch statusCode{
        case 200:
            return .success(decodedData)
        case 400:
            return .pathErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
        else { return .pathErr(data) }
        
        switch statusCode {
        case 200:
            return .success(decodedData)
        case 400:
            return .pathErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
}
