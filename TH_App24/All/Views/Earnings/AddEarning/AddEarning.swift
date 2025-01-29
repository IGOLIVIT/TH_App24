//
//  AddEarning.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct AddEarning: View {

    @StateObject var viewModel: EarningsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New earning")
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
                            
                            viewModel.TotEar += Int(viewModel.eaEarning) ?? 0
                            
                            viewModel.addEarning()
                            
                            viewModel.eaLoc = ""
                            viewModel.eaDurH = ""
                            viewModel.eaDurM = ""
                            viewModel.eaEarning = ""
                            
                            viewModel.fetchEarnings()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.eaLoc.isEmpty || viewModel.eaDurH.isEmpty || viewModel.eaDurM.isEmpty || viewModel.eaEarning.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.eaLoc.isEmpty || viewModel.eaDurH.isEmpty || viewModel.eaDurM.isEmpty || viewModel.eaEarning.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        Text("Location")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.eaLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.eaLoc)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Date")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        DatePicker("", selection: $viewModel.eaDate, displayedComponents: .date)
                            .labelsHidden()
                            .background(RoundedRectangle(cornerRadius: 6).fill(.gray.opacity(0.4)))
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Duration")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        HStack {
                            
                            ZStack(content: {
                                
                                Text("Hours")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.eaDurH.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.eaDurH)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                            ZStack(content: {
                                
                                Text("Miutes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.eaDurM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.eaDurM)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                                                    
                            Text("Earning")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.eaEarning.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.eaEarning)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
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
    AddEarning(viewModel: EarningsViewModel())
}
