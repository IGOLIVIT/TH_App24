//
//  LoadingView.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding(.bottom, 70)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
