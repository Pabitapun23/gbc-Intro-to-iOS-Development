//
//  ContentView.swift
//  JobsWebServiceDemo
//
//  Created by J Patel on 2024-02-08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jobViewModel = JobViewModel()
    
    let industries = ["dev", "hr", "business", "data-science"]
    @State private var selectedIndustry = "dev"
    
    var body: some View {
        VStack {
            
            Picker("Job Industry", selection: self.$selectedIndustry){
                ForEach(industries, id: \.self){ industry in
                    Text(industry).tag(industry)
                }
            }
            .onChange(of: self.selectedIndustry, perform: { _ in
                //fetch the list of updated selectedIndustry
                self.jobViewModel.fetchJobs(industry: self.selectedIndustry)
            })
            
            List(self.jobViewModel.jobs){ job in
                VStack(alignment: .leading){
                    Text(job.title)
                        .font(.headline)
                    
                    HStack{
                        if let imageURL = job.companyLogo {
                            AsyncImage(url: imageURL){ phase in
                                
                                switch phase{
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                
                                @unknown default:
//                                    print(#function, "unable to fetch the image")
                                    Image(systemName: "building.2.crop.circle")
                                }
                            }
                        }
                        
                        Text(job.company)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        
        .onAppear(){
            self.jobViewModel.fetchJobs(industry: self.selectedIndustry)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
