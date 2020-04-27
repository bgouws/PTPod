//
//  QuotesPostRepo.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/27.
//

import Foundation

public class QuotesPostRepo: QuotesPostRepoType {
    var postRequest: URLRequest
    required public init?(id: String, firstName: String, lastName: String, quote: String) {
        let link = "https://playtimeapi.herokuapp.com/saveQuote"
        guard let requestURL = URL(string: link) else { return nil }
        var postRequest = URLRequest(url: requestURL)
        postRequest.httpMethod = "POST"
        let parameters: [String: Any] = [
            "id": "\(id)",
            "firstName": "\(firstName)",
            "lastName": "\(lastName)",
            "quote": "\(quote)"
        ]
        postRequest.httpBody = parameters.percentEncoded()
        self.postRequest = postRequest
    }
    public func addQuote(completion: @escaping(Result<Bool, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: postRequest) { data, response, error in
            guard let _ = data,
            error == nil else {
                completion(.failure(error!))
            return
        }
            completion(.success(true))
        }
        task.resume()
    }
}
extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
