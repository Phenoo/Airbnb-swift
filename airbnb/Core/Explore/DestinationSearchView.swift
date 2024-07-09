//
//  DestinationSearchView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 08/07/2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case dates
    case location
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    
    @State private var startDate = Date()

    @State private var endDate = Date()
    
    @State private var numGuests = 0
    
    @State private var selectedOption : DestinationSearchOptions = .location
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
                
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
                Spacer()
                
                if !destination.isEmpty {
                    Button ("Clear") {
                        destination = ""
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }

            .padding()
            
            VStack{
                if selectedOption == .location {
                    VStack(alignment: .leading) {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            
                            TextField("Search Destination", text: $destination)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                } else {
                    ExtractedView(title: "Where", description: "Add location")
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy)
                {
                    selectedOption = .location
                }
            }
            
            // date selection view
            
            VStack {
                if selectedOption == .dates {
                   Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                } else {
                    ExtractedView(title: "When", description: "Add dates")
                       
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 160 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy)
                {
                    selectedOption = .dates
                }
            }

            
            //guests
            
            
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                   Text("Who's coming")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    ExtractedView(title: "Who?", description: "Add guests")
                       
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation(.snappy)
                {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct ExtractedView: View {
    
    let title: String
    
    let description: String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
       
    }
}
