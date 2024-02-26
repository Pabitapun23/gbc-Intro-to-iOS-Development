//
//  ContentView.swift
//  JobsWebServiceDemo
//
//  Created by Pabita Pun on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jobViewModel = JobViewModel()
    
    let industries = ["dev", "hr", "business", "data-science"]
    @State private var selectedIndustry = "dev"
    
    var body: some View {
        VStack {
            Picker ("Job Industry", selection: self.$selectedIndustry) {
                ForEach(industries, id: \.self) { industry in
                    Text(industry).tag(industry)
                } // ForEach
            } // Picker
            .onChange(of: self.selectedIndustry, perform: { _ in
                // fetch the list of updated selectedIndustry
                self.jobViewModel.fetchJobs(industry: self.selectedIndustry)
            })
            
            List(self.jobViewModel.jobs){ job in
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.headline)
                    
                    HStack {
                        if let imageURL = job.companyLogo {
//                            AsyncImage(url: job.companyLogo) { image in
                            AsyncImage(url: imageURL) { phase in
//                                image
//                                    .image?.resizable()
//                                    .frame(width: 50, height: 50)
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    
                                @unknown default:
                                    Image(systemName: "building.2.crop.circle")
                                }
                            }
                        }
                        
                        
                        Text(job.company)
                            .font(.subheadline)
                    } // HStack
                } // VStack
            } // List
        } // VStack
        .padding()
        
        // it will appear on the screen on the screen loading (at the beginning)
        .onAppear() {
            self.jobViewModel.fetchJobs(industry: self.selectedIndustry)
        } // onAppear
        
    } // body
}

#Preview {
    ContentView()
}
