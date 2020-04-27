//
//  QuotesModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public struct ListOfQuotes: Decodable {
    var allQuotes: [Quotes]
}
public struct Quotes: Decodable {
    public var id: Int?
    public var firstName: String?
    public var lastName: String?
    public var quote: String
    public init(id: Int, firstName: String, lastName: String, quote: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.quote = quote
    }
}
