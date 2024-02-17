//
//  FlightReservationEntryFormScreen.swift
//  Pabita_Flights
//
//  Created by Pabita Pun on 2024-02-13.
//

import SwiftUI

struct FlightReservationEntryFormScreen: View {
    @State private var selectedArrivalAirport: String = ""
    @State private var selectedFlight: Flight?
    
    @State private var customerName : String = ""
    @State private var passportNumber : String = ""
    @State private var departureDate = Date()
    @State private var errorMsg = ""
    @State private var confirmationMsg = ""
    @State private var flightInfo = ""
    @State private var isReservationConfirmed = false
    
    
    // Sample data for flights
    let flights: [Flight] = [
        Flight(flightNumber: "AM3116", departureCity: "ATL", arrivalCity: "MAD", distance: 6943.70, airlineCarrier: "Aeromexico"),
        Flight(flightNumber: "WS6463", departureCity: "ATL", arrivalCity: "AUS", distance: 1514.00, airlineCarrier: "Westjet"),
        Flight(flightNumber: "KL662", departureCity: "ATL", arrivalCity: "HKG", distance: 12538.51, airlineCarrier: "KLM")
    ]
    
    // reservation list
    @EnvironmentObject var reservationsList: ReservationList
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Flight Reservation Form")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                
                // form
                VStack (alignment: .leading, spacing: 15) {
                    
                    Text("Reserve the Flight")
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    
                    // Picker
                    Section {
                        HStack {
                            Text ("Select an arrival airport")
                            // Picker for selecting arrival airport
                            
                            Spacer()
                            
                            Picker("Arrival Airport", selection: $selectedArrivalAirport) {
                                ForEach(flights, id: \.flightNumber) { flight in
                                    Text("\(flight.arrivalCity)")
                                }
                                
                                
                            }
                            .onChange(of: selectedArrivalAirport, { oldValue, newValue in
                                
                                for flight in flights {
                                    if (flight.flightNumber == newValue) {
                                        
                                        // setting the selected flight values
                                        selectedFlight = flight
                                        
                                        // Display flight information if the flight number matches newValue
                                        print("\(flight.flightNumber)")
                                        flightInfo = """
                                        Flight: \(flight.flightNumber)
                                        Operated By: \(flight.airlineCarrier)
                                        Price: $\(String(format: "%.2f", flight.price))
                                        """
                                    }
                                }
                            
                            })
                        }
                        
                        if(!flightInfo.isEmpty) {
                            Text("Flight Details")
                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                                .fontWeight(.semibold)
                            
                            Text(flightInfo)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        
                    } // Section
                    
                    
                    // Customer info
                    Section {
                        // customer name
                        Text("Customer Name:")
                        TextField("Enter your name", text: $customerName)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.default)
                            .textFieldStyle(.roundedBorder)
                            .padding(.all, 5.0)
                    
                        // passport number
                        Text("Passport Number:")
                        TextField("Enter your passport number", text: $passportNumber)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.default)
                            .textFieldStyle(.roundedBorder)
                            .padding(.all, 5.0)
                    } // Section
                    
                    // departure date picker
                    DatePicker("Departure Date:", selection: $departureDate, in: Date.now..., displayedComponents: .date)
                        .onAppear {
                            // Set the date format
                            let formatter = DateFormatter()
                            formatter.dateFormat = "dd MMMM yyyy"
                            
                            // Convert the departure date to the desired format
                            let formattedDate = formatter.string(from: departureDate)
                            
                            // Update the departure date to the formatted date
                            if let formattedDate = formatter.date(from: formattedDate) {
                                departureDate = formattedDate
                            }
                        }
                    
                    // error msg
                    Text("\(errorMsg)")
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                    
                    // button to make reservation
                    HStack {
                        Spacer()
                        
                        Button {
                            // calling make reservatin func
                           makeReservation()
                            
                        } label: {
                            Text("Make Reservation")
                                .padding(.all, 10.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                        } // Button
                        
                        Spacer()
                    } // HStack
                    .padding()
                    
                    
                    // confirmation msg
                    if isReservationConfirmed {
                        Text(confirmationMsg)
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    } else {
                        Text("")
                    }

                    
                } // VStack - form
                .padding()
                
                Spacer()
            } // VStack
        }
    } // body
    
    private func makeReservation() {
        
        print("\(selectedArrivalAirport)")
        
        // Form Validation
        if(customerName.isEmpty) {
            errorMsg = "ERROR - customer name must be provided"
            isReservationConfirmed = false
            return
        }
        
        if(passportNumber.isEmpty) {
            errorMsg = "ERROR - passport number must be provided"
            isReservationConfirmed = false
            return
        }
        
        if (!customerName.isEmpty && !passportNumber.isEmpty) {
            errorMsg = ""
            print("Flight reservation made successfully.")
        }
        
        isReservationConfirmed = true
        confirmationMsg = "Flight Reservation confirmed!"
        
        
        
        // Add to reservation list
        if let selectedFlight = selectedFlight {
            let newReservation = Reservation(customerName: customerName, passportNumber: passportNumber, flight: selectedFlight, departureDate: departureDate)
            reservationsList.reservations.append(newReservation)
        }
        
        print(selectedFlight)
        
        // reset form fields to their default values
        selectedArrivalAirport = "Select an airport"
        customerName = ""
        passportNumber = ""
        departureDate = Date()
        flightInfo = ""
        
    }
}

#Preview {
    FlightReservationEntryFormScreen()
}
