//
//  ContentView.swift
//  WebAPI
//
//  Created by EmJhey PB on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var jobViewModel = JobViewModel()
    
    let industries = ["dev", "hr", "business"]
    let countries = ["usa", "canada"]
    @State private var selectedIndustry = "dev"
    @State private var selectedCountry = "canada"
    @State private var selectedCount = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Picker("Industry", selection: self.$selectedIndustry) {
                        ForEach(industries.indices) { index in
                            Text(industries[index]).tag(industries[index])
                        }
                    }
                    .onChange(of: self.selectedIndustry, perform: { _ in
                        self.jobViewModel.fetchJobs(industry: self.selectedIndustry, country: self.selectedCountry, count: selectedCount)
                    })
                    
                    Picker("Country", selection: self.$selectedCountry) {
                        ForEach(countries.indices) { index in
                            Text(countries[index]).tag(countries[index])
                        }
                    }
                    .onChange(of: self.selectedCountry, perform: { _ in
                        self.jobViewModel.fetchJobs(industry: self.selectedIndustry, country: self.selectedCountry, count: selectedCount)
                    })
                }
                
                HStack {
                    Text("Result Count")
                    TextField("Result Count", text: $selectedCount)
                        .keyboardType(.numberPad)
                }
                .onChange(of: self.selectedCount, perform: { _ in
                    self.jobViewModel.fetchJobs(industry: self.selectedIndustry, country: self.selectedCountry, count: selectedCount)
                })
                
                List(self.jobViewModel.jobs) { job in
                    NavigationLink{
                        //destination
                        DetailView(job: job)
                    }label:{
                        JobRow(job: job)
                    }
                }
            }
        }
        .padding()
        .onAppear() {
            self.jobViewModel.fetchJobs(industry: self.selectedIndustry, country: self.selectedCountry, count: selectedCount)
        }
    }
}

#Preview {
    ContentView()
}
