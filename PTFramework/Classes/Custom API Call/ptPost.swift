//
//  ptPost.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/06.
//

import Foundation

public class ptPost {
    public init(id: String, trackTitle: String, trackArtist: String) {
        let resourceString = URL(string: "http://localhost:8080/favourites/")
        guard let requestURL = resourceString else { fatalError() }
        var postRequest = URLRequest(url: requestURL)
        postRequest.httpMethod = "POST"
        let parameters: [String: Any] = [
            "id": "\(id)",
            "trackTitle": "\(trackTitle)",
            "trackArtist": "\(trackArtist)"
        ]
        postRequest.httpBody = parameters.percentEncoded()
        let task = URLSession.shared.dataTask(with: postRequest) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                print("error", error ?? "Unknown error")
                return
            }
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString ?? "")")
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
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
