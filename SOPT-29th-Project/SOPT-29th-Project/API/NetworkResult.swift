//
//  NetworkResult.swift
//  SOPT-29th-Project
//
//  Created by 조양원 on 2021/11/15.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr(T)
    case serverErr
    case networkFail
}
