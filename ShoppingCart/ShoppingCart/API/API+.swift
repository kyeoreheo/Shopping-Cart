//
//  API+.swift
//  ShoppingCart
//
//  Created by Kyo on 3/13/21.
//
import Alamofire

extension API {
    func registerUesr(body: [String : Any], completion: @escaping(String?) -> Void) {
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
    
    func logIn(body: [String : Any], completion: @escaping(String?) -> Void) {
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
    
    func getTopSellers(completion: @escaping(TopSellers?) -> Void) {
        Alamofire.request(baseURL + topSeller, method: .get)
        .responseData { response in
            let decoder = JSONDecoder()
            switch response.result {
            case .success(let data):
                do {
                    let result = try decoder.decode(TopSellers.self, from: data)
                    completion(result)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    //NSString *strURL = [NSString stringWithFormat:@"%@api_key=%@&user_id=%@", kCATEGORYAPI, apiKey, userId];
    
    func getCategories(completion: @escaping(Category?) -> Void) {
        Alamofire.request(baseURL + category, method: .get)
        .responseData { response in
            let decoder = JSONDecoder()
            switch response.result {
            case .success(let data):
                do {
                    let result = try decoder.decode(Category.self, from: data)
                    completion(result)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
        
}
