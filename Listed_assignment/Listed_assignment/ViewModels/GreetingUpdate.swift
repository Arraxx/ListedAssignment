//
//  GreetingUpdate.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 08/06/23.
//

import Foundation

func getGreetings() -> String{
    
    let currentDate = Date()
    let calendar = Calendar.current
    let currentTime = calendar.component(.hour, from: currentDate)
    
    var greetingVal : String = ""
    
    if(currentTime < 12){
        greetingVal = "Good Morning"
    }
    else if(currentTime < 18){
        greetingVal = "Good Afternoon"
    }
    else{
        greetingVal = "Good Evening"
    }
    
    return greetingVal
}
