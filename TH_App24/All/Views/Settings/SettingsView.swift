//
//  SettingsView.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = EarningsViewModel()
    
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
                            .padding(.bottom, 20)
                            
                            Button(action: {

                                withAnimation(.spring()) {
                                    
                                    viewModel.isDeleteAll = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Reset app")
                                        .foregroundColor(.red)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.red)
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteAll ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteAll = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("App Reset")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Are you sure you want to delete all data and restore the app to its original state? This action cannot be undone.")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Rectangle()
                        .fill(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })

                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isDeleteAll ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
