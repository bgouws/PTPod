//
//  QuotesRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public class QuotesGetRepo: QuotesGetRepoType {
    let resourceURL: URL
    required public init?() {
        let link = "https://playtimeapi.herokuapp.com/allQuotes"
        guard let resourceURL = URL(string: link) else { return nil }
        self.resourceURL = resourceURL
    }
    public func getListOfQuotes(completion: @escaping(Result<[Quotes], QuotesError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let quotesResponse = try decoder.decode(listOfQuotes.self, from: jsonData)
                let actualData = quotesResponse.allQuotes
                completion(.success(actualData))
            } catch {
                completion(.failure(.noData))
            }
        }
        dataTask.resume()
    }
}
