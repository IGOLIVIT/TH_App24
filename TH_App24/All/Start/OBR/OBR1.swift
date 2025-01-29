//
//  OBR1.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct OBR1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("obr1")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Welcome to Comedian's Toolkit!")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)
                            
                            Text("Our goal is to help you organize your stand-up material, track inspiration, and manage your earnings. Let’s get started!")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()

                            NavigationLink(destination: {
                                
                                OBR2()
                                    .navigationBarBackButtonHidden()
                                
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
    OBR1()
}
