//
//  Dog.swift
//  DogAPIOne
//
//  Created by Kein Li on 2/25/24.
//

import Foundation



// MARK: - Dog
struct Dog: Codable, Hashable {
    let data: [Fact]
}

// MARK: - Datum
struct Fact: Codable, Hashable{
    let id : String
    let type: String
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable, Hashable {
    let body: String
}
//
//{
//  "data": [
//    {
//      "id": "c4e46f7c-d3e0-44e7-872e-773bd03c19a6",
//      "type": "fact",
//      "attributes": {
//        "body": "The average dog lives 10 to 14 years."
//      }
//    }
//  ]
//}
