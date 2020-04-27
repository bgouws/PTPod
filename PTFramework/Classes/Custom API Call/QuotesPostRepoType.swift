//
//  QuotesPostRepoType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public protocol QuotesPostRepoType {
    init?(id: String, firstName: String, lastName: String, quote: String)
    func addQuote(completion: @escaping(Result<Bool, Error>) -> Void)
}
