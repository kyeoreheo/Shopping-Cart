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
    
    func logIn(mobile: String, password: String, completion: @escaping([LogInResponse]?) -> Void) {
        let stringURL: String = baseURL + logIn + "mobile=\(mobile)&password=\(password)"
        Alamofire.request(stringURL, method: .get)
            .responseData { response in
                let decoder = JSONDecoder()
                switch response.result {
                case .success(let data):
                    do {
                        let result = try decoder.decode([LogInResponse].self, from: data)
                        completion(result)
                    } catch {
                        completion(nil)
                    }
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
    
    func getCategories(completion: @escaping(CategoryResponse?) -> Void) {
        let stringURL: String = baseURL2 + category + "api_key=\(User.shared.model.appapikey)&user_id=\(User.shared.model.id)"

        Alamofire.request(stringURL, method: .get)
        .responseData { response in
            let decoder = JSONDecoder()
            switch response.result {
            case .success(let data):
                do {
                    let result = try decoder.decode(CategoryResponse.self, from: data)
                    completion(result)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    func getSubCategory(withID id: String, completion: @escaping(SubCategryResponse?) -> Void) {
        let stringURL: String = baseURL2 + subCategory + "Id=\(id)&api_key=\(User.shared.model.appapikey)&user_id=\(User.shared.model.id)"

        Alamofire.request(stringURL, method: .get)
        .responseData { response in
            let decoder = JSONDecoder()
            switch response.result {
            case .success(let data):
                do {
                    let result = try decoder.decode(SubCategryResponse.self, from: data)
                    completion(result)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    //http://rjtmobile.com/ansari/shopingcart/ios-ssl/product_details.php?cid=107&scid=205&api_key=fd942dc6ce641dbbe9db92639475bfdc&user_id=2075
    func getProducts(cID: String, scID: String, completion: @escaping(ProductsResponse?) -> Void) {
        let stringURL: String = baseURL2 + product + "cid=\(cID)&scid=\(scID)&api_key=\(User.shared.model.appapikey)&user_id=\(User.shared.model.id)"

        Alamofire.request(stringURL, method: .get)
        .responseData { response in
            let decoder = JSONDecoder()
            switch response.result {
            case .success(let data):
                do {
                    let result = try decoder.decode(ProductsResponse.self, from: data)
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
