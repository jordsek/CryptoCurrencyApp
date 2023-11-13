//
//  Fetchable.swift
//  TodoAppWidget
//
//  Created by Jordan Isac on 19/10/2023.
//

import Foundation

protocol Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data
}
