//
//  Job.swift
//  JobsWebServiceDemo
//
//  Created by J Patel on 2024-02-08.
//

import Foundation

struct Job : Identifiable{
    let id : String
    let title : String
    let company : String
    let companyLogo : URL?
    let type : String?
    let description : String
}


/*
 
 Task - Modify the List to open the detail view (screen) to show the details of the job such as description, job type, country
 
 - Add two more pickers to allow the user to select the country (USA, Canada) and TextField number of jobs to fetch (5 to 20)
 Modify the API URL accordingly to fetch the jobs
 */
