//
//  Home.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

struct Home: View {
    @StateObject var model = urlViewModel()
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack{
                
               
                      
                  
                
                Image(systemName: "paperplane")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedTab ==  "paperplane" ? .black : .white)
                    .background(Color.white.opacity(model.selectedTab == "paperplane" ? 1 : 0))
                    .background(
                        ZStack{
                            
                            if model.selectedTab != "paperplane"{
                                
                                
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                            
                        }
                    
                    )
                    .onTapGesture {
                        model.selectedTab = "paperplane"
                    }
                        
                   
                
                
           
                
                Image(systemName: "tortoise.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedTab ==  "tortoise.fill" ? .black : .white)
                    .background(Color.white.opacity(model.selectedTab == "tortoise.fill" ? 1 : 0))
                    .background(
                        ZStack{
                            
                            if model.selectedTab != "tortoise.fill"{
                                
                                
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                            
                        }
                    
                    )
                    .onTapGesture {
                        model.selectedTab = "tortoise.fill"
                    }
               
                
                Image(systemName: "alarm.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 80, height: 45)
                    .foregroundColor(model.selectedTab ==  "alarm.fill" ? .black : .white)
                    .background(Color.white.opacity(model.selectedTab == "alarm.fill" ? 1 : 0))
                    .background(
                        ZStack{
                            
                            if model.selectedTab != "alarm.fill"{
                                
                                
                                Color.clear
                            }
                            else{
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                            
                        }
                    
                    )
                    .onTapGesture {
                        model.selectedTab = "alarm.fill"
                    }
                    
            }
            .background(Color.white.opacity(0.3))
            .cornerRadius(15)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                
                
                let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                
                
                LazyVGrid(columns: columns,spacing: 20, content: {
                   
                    ForEach(model.urls){url in
                        
                        WebView(url: url.url)
                            .frame(height: 200)
                            .opacity(model.currentpage?.id == url.id ? 0.01 : 1)
                            .cornerRadius(10)
                            
                            .onDrag({
                                
                                
                                return NSItemProvider(contentsOf: URL(string: "\(url.id)")!)!
                            })
                            .onDrop(of: [.url], delegate: DropViewDelegate(model: model, url: url))
                        
                    }
                    
                })
                .padding()
                
            })
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
