//
//  MatDetail.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct MatDetail: View {

    @StateObject var viewModel: MaterialViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedMat?.maName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
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
     
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "trash")
                                .foregroundColor(Color.red)
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                }
                .padding()
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        Text(viewModel.selectedMat?.maName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        Text("Duration")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("\(viewModel.selectedMat?.maDurH ?? "")h \(viewModel.selectedMat?.maDurM ?? "")min")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Opening")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        Text(viewModel.selectedMat?.maOpen ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Main Section")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        Text(viewModel.selectedMat?.maMain ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Rectangle()
                            .fill(Color("bg"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 5)
                        
                        Text("Closing")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13, weight: .regular))
                        
                        Text(viewModel.selectedMat?.maClos ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)

                    Rectangle()
                        .fill(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteMaterial(withMaName: viewModel.selectedMat?.maName ?? "", completion: {
                                
                                viewModel.fetchMats()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    MatDetail(viewModel: MaterialViewModel())
}
