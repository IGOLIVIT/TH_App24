//
//  MaterialView.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct MaterialView: View {
    
    @StateObject var viewModel = MaterialViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("Material")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()

                if viewModel.materials.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("em1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        Text("It's empty here")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("You haven't added any stand-up material yet.")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.materials, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedMat = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Text(index.maName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                    .padding(20)
                                    .background(RoundedRectangle(cornerRadius: 11).fill(Color("bg")))
                                })
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
                }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 11).fill(Color("bg")))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onAppear {
            
            viewModel.fetchMats()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMat(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MatDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    MaterialView()
}
