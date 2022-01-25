//
//  APICall.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import Foundation

// MARK :- APICall Requests
final class APICall {
    
    // MARK:-  APICall Request's  --Codable--
    class public func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                if let data = responseData {
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        _=completionHandler(result)
                    }
                    catch let error{
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
                
            }

        }.resume()
    }
    
} //extension
