//
//  REST.swift
//  RM30950
//
//  Created by Rafael Valverde on 26/11/17.
//  Copyright © 2017 PUNKBeers. All rights reserved.
//

import Foundation

import Foundation
import UIKit
class REST {
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        // Premitindo o acesso via 3G
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Context-Type": "application/json"]
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    static func loadBeers(onComplete: @escaping ([Beer]?) -> Void) {
        
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Ocorreu um problema em dataTask da class REST")
                onComplete(nil)
            }
            else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String:Any]]
                        
                        var beers: [Beer] = []
                        for item in json {
                            
                            let id = item["id"] as! Int
                            let name = item["name"] as! String
                            let abv = item["abv"] as! Double
                            let image_url = item["image_url"] as! String
                            
                            let beer = Beer(id: id, name: name, abv: abv, image_url: image_url)
                            beers.append(beer)
                        }
                        onComplete(beers)
                    }
                    catch {
                        print("Erro em loadBeers")
                        onComplete(nil)
                    }
                }
                else {
                    print("Erro no servidor", response.statusCode)
                    onComplete(nil)
                }
            }
        }
        
        dataTask.resume()
    }

}
