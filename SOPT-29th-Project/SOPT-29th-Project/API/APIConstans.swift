//
//  APIConstans.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/15.
//

import Foundation

struct APIConstants{
    
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user/" + ""
    static let signUpURL = baseURL + "/user/signup"
}
