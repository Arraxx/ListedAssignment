//
//  LinkButton.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 10/06/23.
//

import SwiftUI

struct LinkButton: View {
    @Binding var selectedSection: SelectedSection
    var section: SelectedSection
    
    var callback: (() -> ())
    
    var body: some View {
        Button(action : {
            withAnimation {
                callback()
            }
        }) {
            Text(section.rawValue)
                .font(.system(size:16))
                .foregroundColor(selectedSection == section ? .white : Color.primaryGrey)
        }
        .frame(width:112 ,height: 40)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(selectedSection == section ? .blue : .clear)
        )
        
    }
}

