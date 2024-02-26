//
//  Job.swift
//  WebAPI
//
//  Created by EmJhey PB on 2/8/24.
//

import Foundation

struct Job: Identifiable {
    let id: String
    let title: String
    let companyName: String
    let companyLogo: URL?
    let type: String?
    let description: String
    let country: String
}
