//
//  OBR2.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct OBR2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("obr2")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack {
                            
                            Text("Add Your Material")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)
                            
                            Text("Easily add new jokes, ideas, and structures for your performances. Categorize them into: opening, main section, and closing.")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()

                            NavigationLink(destination: {
                                
                                OBR3()
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
    OBR2()
}
