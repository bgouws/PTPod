//
//  QuotesGetViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public protocol QuotesGetViewType: class {
    func dataReady(listOfQuotes: [Quotes])
    func displayError(error: QuotesError)
}
