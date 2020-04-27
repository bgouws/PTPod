//
//  QuotesPostViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public class QuotesPostViewModel {
    public weak var view: QuotesPostViewType?
    public var repo: QuotesPostRepoType?
    
    required public init() { }
    public func postNewQuote() {
        repo?.addQuote(completion: { result in
            switch result {
            case .failure(let error):
                self.view?.displayError(error: error)
            case .success(let isSuccessful):
                self.view?.displaySuccess(isSuccessful: isSuccessful)
            }
        })
    }
}
