//
//  AddMat.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct AddMat: View {
    
    @StateObject var viewModel: MaterialViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New material")
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
                            
                            viewModel.addMat()
                            
                            viewModel.maName = ""
                            viewModel.maDurH = ""
                            viewModel.maDurM = ""
                            viewModel.maOpen = ""
                            viewModel.maMain = ""
                            viewModel.maClos = ""
                            
                            viewModel.fetchMats()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        .opacity(viewModel.maName.isEmpty || viewModel.maDurH.isEmpty || viewModel.maDurM.isEmpty || viewModel.maOpen.isEmpty || viewModel.maMain.isEmpty || viewModel.maClos.isEmpty ? 0.4 : 1)
                        .disabled(viewModel.maName.isEmpty || viewModel.maDurH.isEmpty || viewModel.maDurM.isEmpty || viewModel.maOpen.isEmpty || viewModel.maMain.isEmpty || viewModel.maClos.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        Text("Topic")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.maName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.maName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
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
                                    .opacity(viewModel.maDurH.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.maDurH)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                            ZStack(content: {
                                
                                Text("Miutes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.maDurM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.maDurM)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                        }
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 18) {
                            
                            Text("Opening")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.maOpen.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.maOpen)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                            Rectangle()
                                .fill(Color("bg"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.vertical, 5)
                            
                            Text("Main Section")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.maMain.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.maMain)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                            Rectangle()
                                .fill(Color("bg"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.vertical, 5)
                            
                            Text("Closing")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.maClos.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.maClos)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            
                            Rectangle()
                                .fill(Color("bg"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .padding(.vertical, 5)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
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
    AddMat(viewModel: MaterialViewModel())
}
