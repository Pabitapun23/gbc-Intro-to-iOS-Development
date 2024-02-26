//
//  JobRow.swift
//  WebAPI
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct JobRow: View {
    var job: Job
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(job.title)
                .font(.headline)
            
            HStack {
                if let imageURL = job.companyLogo {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .success(let image) :
                            image
                                .resizable()
                                .frame(width:50, height:50)
                        @unknown default:
                            Image(systemName: "building.2.crop.circle")
                        }
                    }
                }
                Text(job.companyName)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    JobRow(job: Job(id: "97273", title: "Network Reliability Engineer", companyName: "Astreya", companyLogo: nil, type: "full-time", description: "Astreya is a leading IT solutions provider to deliver technology-enabled services and fuel digital transformation to some of the most exciting companies on the planet. We are working with the world&#8217;s most recognizable and innovative organizations through co-creating applications and services with fast-moving teams. Do you have the desire to use your technical skills to&#8230;",country: "USA"))
}
