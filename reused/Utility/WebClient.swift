//
//  WebClient.swift
//  reused
//
//  Created by Alex L. Deweert on 2020-11-16.
//

import Alamofire

final class WebClient {
    
    private static var sharedWebClient = WebClient(baseURL: URL.init(string: "https://emerald.used.ca:8080")!)
    private var _baseURL: URL
    
    func loginRequest(email: String, password: String) {
        
        print("Tried to login with \(email) and \(password)")
        let credentials = "\(email):\(password)".data(using: String.Encoding.utf8)
        let base64 = credentials?.base64EncodedString()
        let headers : HTTPHeaders = ["Authorization" : "Basic \(String(describing: base64))"]
        AF.request(self._baseURL, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).responseJSON { response in
            print(response)
        }
    }
    
    private init(baseURL: URL) {
        self._baseURL = baseURL
    }
    
//    class func shared() -> WebClient{
//        return self.sharedWebClient
//    }
    
    static var shared: WebClient{
        return self.sharedWebClient
    }
    
}
