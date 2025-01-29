//
//  AddInsp.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct AddInsp: View {

    @StateObject var viewModel: InspirationViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New inspiration")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.inRate = String("\(viewModel.selRate)")
                            
                            viewModel.addInsp()
                            
                            viewModel.inAu = ""
                            viewModel.inRate = ""
                            viewModel.inQuote = ""
                            viewModel.selRate = 1
                            
                            viewModel.fetchInsps()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.inAu.isEmpty || viewModel.inQuote.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.inAu.isEmpty || viewModel.inQuote.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        Text("Author")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.inAu.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.inAu)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)

                        Text("Quote")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.inQuote.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.inQuote)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Joke rating")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        HStack {
                            
                            ForEach(1...5, id: \.self) { rate in
                                
                                Button(action: {
                                    
                                    viewModel.selRate = rate
                                    
                                }, label: {
                                    
                                    Image(systemName: rate <= viewModel.selRate ? "star.fill" : "star")
                                        .foregroundColor(Color.orange)
                                        .font(.system(size: 15, weight: .regular))
                                })
                            }
                        }
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
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
    AddInsp(viewModel: InspirationViewModel())
}
