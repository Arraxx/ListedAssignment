//
//  TopView.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 10/06/23.
//

import SwiftUI

struct TopView: View {
    @State var showSheet : Bool = false
    var body: some View {
        Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    HStack {
                        Text("Dashboard")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.leading, 30)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showSheet = true
                            }
                        }) {
                            Image("wrench")
                            
                        }
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius:8)
                                .fill(Color(.white)
                                .opacity(0.12))
                        )
                        .padding(.trailing, 30)
                    }
                    Spacer()
                }
                    .padding(.top)
            )
            .sheet(isPresented: $showSheet) {
                Text("Settings")
            }
    }
}
