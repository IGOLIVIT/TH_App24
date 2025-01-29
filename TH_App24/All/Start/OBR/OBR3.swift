//
//  OBR3.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct OBR3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("obr3")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Track Your Earnings")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)
                            
                            Text("Record events, date, duration, and your earnings. Keep track of how your income is growing")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()

                            Button(action: {
                                
                                status = true
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                    .background(RoundedRectangle(cornerRadius: 11).fill(Color("prim")))
                            })
                            .padding(.bottom, 24)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 267)
                        .background(Color.black)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    OBR3()
}
