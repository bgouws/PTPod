//
//  QuotesGetViewModelType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public protocol QuotesGetViewModelType {
    var list: [Quotes] { get set }
    var view: QuotesGetViewType? { get set }
    var repo: QuotesGetRepoType? { get set }
    init()
    func getAllQuotes()
}
