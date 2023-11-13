//
//  NetworkError.swift
//  TodoAppWidget
//
//  Created by Jordan Isac on 19/10/2023.
//

import Foundation

enum NetworkError:Error{
    case parsingError
    case dataNotFound
    case invalidURL
}
extension NetworkError: LocalizedError{
    
    var errorDescription :String?{
        switch self{
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .parsingError:
            return NSLocalizedString("parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Data Not found", comment: "dataNotFound")

        }
    }
}

