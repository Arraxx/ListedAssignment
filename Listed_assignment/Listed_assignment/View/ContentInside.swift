//
//  TopView.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 07/06/23.
//

import SwiftUI
import Kingfisher
import PopupView

struct ContentInside: View {
    @State private var showAlert = false
    @ObservedObject var dataViewModel : DataViewModel = DataViewModel()
    
    var body: some View {
        Color(red:245/255, green: 245/255, blue:245/255)
            .opacity(1.0)
            .cornerRadius(16)
            .edgesIgnoringSafeArea(.bottom)
            .overlay(alignment: .topLeading) {
                ZStack{
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(getGreetings())
                                .foregroundColor(Color.primaryGrey)
                                .font(.system(size:16))
                            
                            Text("Ajay Manva" + " 👋")
                                .font(.system(size:24)).fontWeight(.bold)
                            
                        }
                        .padding(.leading, 16)
                        HStack{
                            Spacer()
                            ChartView(dataViewModel: dataViewModel)
                                .frame(alignment: .center)
                            Spacer()
                        }
                        
                        
                        HStack(spacing: 24) {
                            // top
                            LinkButton(selectedSection: $dataViewModel.selectedSection, section: .top) {
                                dataViewModel.updateSection()
                            }
                            
                            // recent
                            LinkButton(selectedSection: $dataViewModel.selectedSection, section: .recent) {
                                dataViewModel.updateSection()
                            }
                            
                        }
                        .padding(.leading,16)
                        HStack {
                            Spacer()
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 20) {
                                    ForEach(dataViewModel.links, id: \.urlID) { link in
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 116)
                                            .cornerRadius(8, corners: [.allCorners])
                                            .overlay(alignment: .center) {
                                                HStack {
                                                    KFImage(URL(string: link.originalImage))
                                                        .resizable()
                                                        .frame(width: 48, height: 48)
                                                        .cornerRadius(8)
                                                    VStack(alignment: .leading) {
                                                        Text(link.title)
                                                        Text(link.timesAgo)
                                                            .foregroundColor(Color.primaryGrey)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack {
                                                        Text("\(link.totalClicks)")
                                                            .fontWeight(.bold)
                                                        Text("Clicks")
                                                            .foregroundColor(Color.primaryGrey)
                                                    }
                                                }
                                                .padding(.all)
                                                .padding(.bottom, 40)
                                            }
                                            .overlay(alignment: .bottom) {
                                                Rectangle()
                                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                                    .foregroundColor(.blue)
                                                    .background(Color.linkBlue)
                                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 40)
                                                    .overlay(alignment: .leading){
                                                        HStack {
                                                            Text("\(link.webLink)")
                                                                .font(.system(size: 14))
                                                                .foregroundColor(.blue)
                                                            Spacer()
                                                            Button(action : {
                                                                UIPasteboard.general.string = link.webLink
                                                                showAlert = true
                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                                                    showAlert = false
                                                                                }
                                                            })
                                                            {
                                                                Image(systemName: "doc.on.doc")
                                                            }
                                                            .popup(isPresented: $showAlert) {
                                                                Text("Link Copied")
                                                                    .foregroundColor(.white)
                                                                    .background(
                                                                        RoundedRectangle(cornerRadius: 4)
                                                                            .frame(width: UIScreen.main.bounds.width*0.9, height : 40)
                                                                            .foregroundColor(.blue)
                                                                    )
                                                            } customize: {
                                                                $0
                                                                    .type(.floater())
                                                                    .position(.bottom)
                                                                    .animation(.spring())
                                                                    .closeOnTapOutside(true)
                                                                    .backgroundColor(.black.opacity(0.5))
                                                            }
                                                        }.padding(.all)
                                                        
                                                    }
                                                    .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                                            }
                                    }
                                }
                                .padding(.trailing, 6)
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.top, 32)
            }
            .padding(.top, 90)
    }
}


struct ContentInside_Previews: PreviewProvider {
    static var previews: some View {
        ContentInside()
    }
}
