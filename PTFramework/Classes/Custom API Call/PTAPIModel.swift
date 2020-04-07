//
//  ptAPIModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/05.
//

import Foundation

public struct AllQuotes: Decodable {
    var quotes: [Quote]
}
public struct Quote: Decodable {
    public var firstName: String
    public var id: Int
    public var lastName: String
    public var quote: String
}
public enum PTError: Error {
    case noData
    case cannotProcessData
}
public struct QuoteRequest {
    let resourceURL: URL
    public init() {
        let resourceString = "http://localhost:8080/quotes"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    public func getQuotes(completion: @escaping(Result<[Quote], PTError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let allQuotesResponse = try decoder.decode(AllQuotes.self, from: jsonData)
                let all = allQuotesResponse.quotes
                completion(.success(all))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
