//
//  JobViewModel.swift
//  JobsWebServiceDemo
//
//  Created by Pabita Pun on 2024-02-08.
//

import Foundation
import Alamofire
import SwiftyJSON

class JobViewModel: ObservableObject {
    @Published var jobs : [Job] = []
    
    func fetchJobs(industry : String) {
        let apiURL = "https://jobicy.com/api/v2/remote-jobs?count=20&industry=\(industry)"
        
        // AF - managing all the files in the background
        AF.request(apiURL).responseJSON{ response in
            
            switch response.result {
            case .success(let responseData):
                let json = JSON(responseData)
                
                
                
                //jobType is array's first value,
                // In array, if you want more than one data, you need to try to loop and get all the datas
                self.jobs = json["jobs"].arrayValue.map{ jobJSON in
                    return Job(id: jobJSON["id"].stringValue,
                               title: jobJSON["jobTitle"].stringValue,
                               company: jobJSON["companyName"].stringValue,
                               companyLogo: jobJSON["companyLogo"].url,
                               type: jobJSON["jobType"].arrayValue.first!.stringValue,
                               description: jobJSON["jobExcerpt"].stringValue)
                }
                
                print(#function, "jobs - \(self.jobs)")
                
            case .failure(let error):
                print(#function, "Unsuccessful response from server : \(error)")
            } // switch
        }
    } // func fetchJobs
}
