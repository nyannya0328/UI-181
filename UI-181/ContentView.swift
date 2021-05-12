//
//  ContentView.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

struct ContentView: View {
    @State var gotoHome = false
    var body: some View {
        ZStack{
            
            if gotoHome{
                
                NavigationView{
                  SlideView()
                    .navigationBarHidden(true)
                }
                
            }
            else{
                OnbordScreen()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for:Notification.Name("HOME")), perform: { _ in
            withAnimation(.easeInOut){
                
                gotoHome.toggle()
            }
        })
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnbordScreen : View {
    var width = UIScreen.main.bounds.width - 100
    @State var offset : CGFloat = 0
    @State var martiColor = false
    var body: some View{
        
        ZStack{
            
            Color.primary
                .ignoresSafeArea()
            
            VStack{
                
                TextShimer(title: "Sky Tree", martiColor: $martiColor)
                
                
                TextShimer(title: "Night View", martiColor: $martiColor)
                
              
                
                Image("p2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .padding(.top,50)
                
                
                Toggle(isOn: $martiColor, label: {
                    
                    
                    TextShimer(title: "Color", martiColor: $martiColor)
                    
                })
                
                
                
                
                
                Spacer()
                
                
                ZStack{
                    
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                    
                    Text("Swip to Start")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    HStack{
                        Capsule()
                            .fill(Color.red)
                            .frame(width: CaluculateWidth() + 55)
                        
                        Spacer()
                        
                    }
                    
                    
                    HStack{
                        
                        
                        
                        ZStack{
                            
                            
                            Image(systemName: "chevron.forward.2")
                               
                        }
                        
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(Onchange(value:)).onEnded(OnEnd(value:)))
                        
                        
                        Spacer()
                        
                        
                    }
                        
                    
                }
                .frame(width: width, height: 65)
                .padding()
                
            }
            
            
            
        }
    }
    
    func CaluculateWidth()->CGFloat{
        
        let progress = offset / width
        
        return progress * width
        
    }
    
    func Onchange(value : DragGesture.Value){
        
        if value.translation.width > 0 && offset <= width - 65 {
            
            offset = value.translation.width
            
        }
        
        
    }
    
    func OnEnd(value : DragGesture.Value){
        
        withAnimation{
            
            
            if offset > 180{
                
                offset = width - 65
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    
                    NotificationCenter.default.post(name: Notification.Name("HOME"), object: nil)
                    
                }
                
            }
            else{
                
                offset = 0
            }
            
        }
        
        
    }
}


struct TextShimer : View {
    var title : String
    @State var show = false
    @Binding var martiColor : Bool
    var body: some View{
        
        ZStack{
            
            Text(title)
                .font(.system(size: 70, weight: .heavy))
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    
                    Text(String(title[title.index(title.startIndex,offsetBy : index)]))
                        .font(.system(size: 70, weight: .heavy))
                        .foregroundColor(martiColor ?  RandomColor() : .white)
                }
                
            }
            .mask(
            
            Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.red,.green]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: 80))
                .offset(x: -250)
                .offset(x: show ? 500 : 0)
                
            
            )
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                    
                    
                    show.toggle()
                }
            })
            
        }
        
    }
    func RandomColor()->Color{
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
        
    }
    
}
