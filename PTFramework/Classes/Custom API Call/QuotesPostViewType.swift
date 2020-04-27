//
//  QuotesPostViewType.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public protocol QuotesPostViewType: class {
    func displayError(error: Error)
    func displaySuccess(isSuccessful: Bool) 
}
