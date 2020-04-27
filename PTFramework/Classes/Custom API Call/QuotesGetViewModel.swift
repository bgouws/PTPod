//
//  QuotesViewGetModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public class QuotesGetViewModel: QuotesGetViewModelType {
    public var list: [Quotes] = []
    public weak var view: QuotesGetViewType?
    public var repo: QuotesGetRepoType?
    
    required public init() { }
    public func getAllQuotes() {
        repo?.getListOfQuotes(completion: { result in
            switch result {
            case .failure(let error):
                self.view?.displayError(error: error)
            case .success(let listOfQuotes):
                self.view?.dataReady(listOfQuotes: listOfQuotes)
            }
        })
    }
}
