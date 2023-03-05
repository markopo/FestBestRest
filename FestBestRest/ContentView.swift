//
//  ContentView.swift
//  FestBestRest
//
//  Created by Marko Poikkimäki on 2023-03-02.
//

import CoreML
import SwiftUI





struct ContentView: View {
    @State private var coffeAmount = 1
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
                    .padding(.all)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeAmount == 1 ? "1 cup" : "\(coffeAmount) cups", value: $coffeAmount, in: 1...20)
                    .padding(.all)
            }
        }
        .navigationTitle("Fest Best Rest")
        .toolbar {
            Button("Calculate", action: calculateBedTime)
        }
    }
    
    func calculateBedTime() {
        print("calculateBedTime!")
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            
        } catch {
            print("exception: \(error)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
