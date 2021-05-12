//
//  SlideView.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

struct SlideView: View {
    var body: some View {
        VStack{
            
            HStack{
                
                NavigationLink(
                    destination: Home().navigationBarHidden(true),
                    label: {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                        
                    })
                
                
                    
               
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "gear")
                        .font(.title)
                })
                
                
                
                
            }
            .overlay(
            Text("Drag Down")
                .font(.largeTitle)
               // .background(Color.white)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
                
            
            )
            .foregroundColor(.black)
            .padding()
            
            
            GeometryReader{proxy in
                
                ZStack{
                    
                    
                    ForEach(items.reversed()){item in
                        
                        
                        ItemView(item: item, rect: proxy.frame(in: .global))
                        
                        
                        
                    }
                    
                }
                
                
            }
            .padding([.horizontal,.top])
        }
        .background(Color.primary.opacity(0.02).ignoresSafeArea())
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView()
    }
}

struct ItemView : View {
    @State var item : Item
    var rect : CGRect
    var body: some View{
        
        ZStack(alignment:.bottom){
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: rect.width, height: rect.height)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
             
                
                (item.offset > 0 ? Color.red : Color.blue)
                    .opacity(item.offset != 0 ? 0.7 : 0)
                
                HStack{
                    
                    if item.offset < 0{
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(item.offset == 0 ? "" : (item.offset > 0 ? "Like" : "Good"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,25)
                        .padding(.horizontal)
                    
                    if item.offset > 0{
                        
                        Spacer(minLength: 0)
                    }
                    
                }
                
                
                
            })
            LinearGradient(gradient: .init(colors: [.clear,.clear,.black]), startPoint: .top, endPoint: .bottom)
            
            
            VStack(spacing:15){
                
               
                Spacer()
                   
                        Text(item.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    
                  
                    
                
                
                
                
                HStack(spacing:20){
                    
                   
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeIn(duration: 0.8)){
                            
                            item.offset = -1000
                        }
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    
                    
                    
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeIn(duration: 0.8)){
                            
                            item.offset = +1000
                        }
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    
                }
                .padding()
                
                
                
            }
                
            
        }
        .cornerRadius(20)
        .offset(x:item.offset)
        .rotationEffect(.init(degrees: item.offset == 0 ? 0 :(item.offset > 0 ? 12 : -12)))
        .gesture(DragGesture().onChanged({ value in
            
            
            withAnimation(.default){
                item.offset = value.translation.width
            }
        }).onEnded({ value in
            withAnimation(.easeIn){
                
                if item.offset > 150{
                    
                    
                    item.offset = 1000
                }
                else if item.offset < -150{
                    
                    item.offset = -1000
                }
                else{
                    
                    item.offset = 0
                }
                
            }
        }))
        
    }
}
