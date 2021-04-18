//
//  NetworkManager.swift
//  FollowersViewCode
//
//  Created by Bruna Drago on 18/04/21.
//

import Foundation
import Alamofire

class NetworkManager {
    //** fazer a chamada usando alamofire**
    //Singleton
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion:@escaping ([Follower]?,String?) -> Void) {
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=100&\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil,"erro na url")
            return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(nil,"erro na task")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil,"invalid response from the server")
                return
            }
            
            guard let data = data else {
                completion(nil,"the data was invalid")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers,nil)
            } catch {
                completion(nil,"The data was invalid")
            }
        }
        task.resume()
    }
}
