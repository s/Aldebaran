//
//  NetworkResponse.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation

public struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var result: Wrapped
}
