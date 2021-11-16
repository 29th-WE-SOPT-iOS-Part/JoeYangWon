//
//  SignUpResponseDataModel.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/15.
//

import Foundation


struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData?
}

// MARK: - LoginResponseData
struct SignUpResultData: Codable {
    let id: Int
    let name, email: String
}
