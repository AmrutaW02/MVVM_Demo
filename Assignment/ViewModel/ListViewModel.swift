//
//  ListViewModel.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import Foundation

struct ApiBaseUrl
{
    static let BaseUrl = "https://itunes.apple.com/"
}


struct ApiEndpoints
{
    static let search = ApiBaseUrl.BaseUrl + "search?term=Alex&media=music&entity=album"
}

struct ListViewModel {
    var listModel: Observable<[ListModel]?> = Observable(value: nil)
    
    // MARK:- functions
    func getPosts() {
        guard let loginUrl = URL(string: ApiEndpoints.search) else { return }
        APICall.getApiData(requestUrl:  loginUrl, resultType: CategoryModel.self) { response in
            //log(response)
            self.listModel.value = response?.results
        }
    }
    
    func getDataAtIndex(_ index : Int) -> ListModel?{
        if let data = listModel.value?[index] {
            return data
        }
        return nil
    }
}
