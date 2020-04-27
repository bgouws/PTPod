//
//  QuotesRepoType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public protocol QuotesGetRepoType {
    init?()
    func getListOfQuotes(completion: @escaping(Result<[Quotes], QuotesError>) -> Void)
}
public enum QuotesError: Error {
    case noData
}
