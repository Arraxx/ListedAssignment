//
//  BodyView.swift
//  Listed_assignment
//
//  Created by Aman Kumar on 07/06/23.
//

import SwiftUI
import Kingfisher

struct BodyView: View {
    
    @ObservedObject var dataViewModel: DataViewModel = DataViewModel()
    
    var body: some View {
        
        ZStack(alignment: .top) {

            TopView()
            
            ContentInside(dataViewModel: dataViewModel)
            
        }
        .onAppear {
            dataViewModel.fetchData()
        }
        
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}
