//
//  NetworkManager.swift
//  FinalProject
//
//  Created by Admin on 05/04/2022.
//

import Foundation
import UIKit
protocol NetworkManagerType {
    func getHeroes(completionHandler:@escaping ([HeroData])-> Void)
}

class NetworkManager: NetworkManagerType {
    
    func getHeroes(completionHandler:@escaping ([HeroData])-> Void) {
        let session = URLSession.shared
        let urlString = "https://api.opendota.com/api/heroStats"
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = session.dataTask(with: url) {data, response, error in
            guard let data = data else {
                return
            }
            let decoded = JSONDecoder()
            do {
                let decodedResponse = try decoded.decode([HeroData].self, from: data)
                 completionHandler(decodedResponse)
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
