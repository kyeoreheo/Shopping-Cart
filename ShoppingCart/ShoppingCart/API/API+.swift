//
//  API+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/13/21.
//
import Alamofire

extension API {
    func registerUesr(name: String, email: String, mobile: String,
                      password: String, completion: @escaping(String?) -> Void) {
        let body: [String : Any] = [
            "name": name,
            "email": email,
            "mobile": mobile,
            "password": password,
        ]
        Alamofire.request(baseURL + register, method: .get, parameters: body)
        .responseString { response in
            switch response.result {
            case .success:
                completion(response.result.description)
            case .failure(_):
                completion(nil)
            }
            
        }
    }
    
    func logIn(mobile: String, password: String, completion: @escaping(String?) -> Void) {
        let body: [String : Any] = [
            "mobile": mobile,
            "password": password,
        ]
        Alamofire.request(baseURL + logIn, method: .get, parameters: body)
        .responseString { response in
            switch response.result {
            case .success:
                completion(response.result.description)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
