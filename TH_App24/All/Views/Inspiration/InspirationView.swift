//
//  InspirationView.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI

struct InspirationView: View {
    
    @StateObject var viewModel = InspirationViewModel()
    @State var rate: Int = 1
    
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
                    
                    Text("Inspiration")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                
                if viewModel.inspirations.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("em2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        Text("It's empty here")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("You haven't added any inspiration yet")
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
                            
                            ForEach(viewModel.inspirations, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 14) {
                                        
                                        HStack {
                                            
                                            Text(index.inAu ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                        }
                                        .onTapGesture {
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetailVisible.toggle()
                                            }
                                        }
                                        
                                        if viewModel.isDetailVisible {
                                            
                                            Text("Quote")
                                                .foregroundColor(.white.opacity(0.8))
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(.top)
                                            
                                            Text(index.inQuote ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .regular))
                                            
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
                                                                                                    
                                                    Image(systemName: rate <= index.inRate ? "star.fill" : "star")
                                                        .foregroundColor(Color.orange)
                                                        .font(.system(size: 15, weight: .regular))
                                                }
                                            }
                                            
                                            HStack {
                                                
                                                Rectangle()
                                                    .fill(Color("bg"))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 1)
                                                    .padding(.vertical, 5)
                                                
                                                Spacer()
                                             
                                                Button(action: {
                             
                                                    viewModel.selectedInsp = index
                                                    
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
                                    }
                                    .padding(20)
                                    .background(RoundedRectangle(cornerRadius: 11).fill(Color("bg")))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
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
            
            viewModel.fetchInsps()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddInsp(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
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
                            
                            CoreDataStack.shared.deleteInspiration(withInQuote: viewModel.selectedInsp?.inQuote ?? "", completion: {
                                
                                viewModel.fetchInsps()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
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
    InspirationView()
}
