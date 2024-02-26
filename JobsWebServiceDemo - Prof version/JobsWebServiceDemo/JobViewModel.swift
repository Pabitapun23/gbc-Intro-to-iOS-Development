//
//  JobViewModel.swift
//  JobsWebServiceDemo
//
//  Created by J Patel on 2024-02-08.
//

import Foundation
import Alamofire
import SwiftyJSON

class JobViewModel : ObservableObject{
    @Published var jobs : [Job] = []
    
    func fetchJobs(industry : String){
        let apiURL = "https://jobicy.com/api/v2/remote-jobs?count=20&industry=\(industry)"
        
        AF.request(apiURL).responseJSON{ response in
            switch response.result {
            case .success(let responseData):
                let json = JSON(responseData)
                
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
            }
            
        }
    }
}
