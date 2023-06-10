//
//  ChartView.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 07/06/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @ObservedObject var dataViewModel : DataViewModel = DataViewModel()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width : UIScreen.main.bounds.width*0.9, height:200)
            .foregroundColor(.white)
            .overlay(
                VStack {
                    HStack {
                        Text("Overview")
                            .font(.system(size:14))
                            .foregroundColor(Color(red:153/255, green :156/255, blue:160/255))
                            .padding(.leading,12)
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Text("22 Aug - 23 Sept")
                                Spacer().frame(width:7.25)
                                Image(systemName: "clock")
                            }
                            .frame(width:125,height:25)
                            .background(RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red:153/255, green :156/255, blue:160/255))
                            )
                            .padding(.trailing,19.25)
                            .font(.system(size:12))
                            .foregroundColor(.black)
                        }
                        
                        
                    }
                    .padding([.top, .bottom])
                    
                    Spacer()
                    
                    Chart {
                        ForEach(dataViewModel.convertStringToDate(), id: \.date) { item in
                            LineMark(
                                x: .value("Date", item.date),
                                y: .value("Profit A", item.value)
                            )
                            .foregroundStyle(.blue)
                        }
                    }
                }
                    .padding(.all)
            )
    }
    
}
