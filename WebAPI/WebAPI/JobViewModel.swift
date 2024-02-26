//
//  JobViewModel.swift
//  WebAPI
//
//  Created by EmJhey PB on 2/8/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class JobViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    
    func fetchJobs(industry: String, country: String, count: String) {
        var apiURL = "https://jobicy.com/api/v2/remote-jobs?count=\(Int(count) ?? 20)&industry=\(industry)&geo=\(country)"
        AF.request(apiURL).responseJSON{response in
            switch response.result {
            case .success(let responseData):
                let json = JSON(responseData)
                //jobType is array's first value
                self.jobs = json["jobs"].arrayValue.map{ jobJSON in
                    return Job(id: jobJSON["id"].stringValue,
                               title: jobJSON["jobTitle"].stringValue,
                               companyName: jobJSON["companyName"].stringValue,
                               companyLogo: jobJSON["companyLogo"].url,
                               type: jobJSON["jobType"].arrayValue.first!.stringValue,
                               description: jobJSON["jobExcerpt"].stringValue,
                               country: jobJSON["jobGeo"].stringValue)
                }
                print(#function, "jobs - \(self.jobs)")
            case .failure(let error):
                print(#function, "Unsuccessful response from server : \(error)")
            }
        }
    }
}
