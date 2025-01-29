//
//  SettingsView.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.presentationMode) var back
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    ZStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                back.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .regular))
                    }
                }
                .padding()
           
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "star")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Rate the app")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))

                                }
                                .padding(18)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                            })
                            
                            Button(action: {

                                guard let url = URL(string: "https://www.termsfeed.com/live/e5653248-0eff-4fce-b7d8-994babd9a89e") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "doc")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Usage Policy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding(18)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
                             
            }
        }
    }
}

#Preview {
    SettingsView()
}
