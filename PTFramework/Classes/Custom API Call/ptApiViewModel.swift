//
//  ptApiViewModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/05.
//

import Foundation

public class PTAPIViewModel {
    var allQuotes = [Quote]()
    
    public init() {
    }
    
    public func getAllQuotes(completion: @escaping([Quote]) -> Void) {
        let quotes = QuoteRequest.init()
        quotes.getQuotes { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let allQuotes):
                self?.allQuotes = allQuotes
                completion(allQuotes)
                print("$$$$")
                print("\(allQuotes[0].quote)")
                print("$$$$")
            }
        }
    }
}
