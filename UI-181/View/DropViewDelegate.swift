//
//  DropViewDelegate.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    var model : urlViewModel
    var url : Page
    
    func performDrop(info: DropInfo) -> Bool {
        
        model.currentpage = nil
        return true
        
    }
    func dropEntered(info: DropInfo) {
        
        if model.currentpage == nil{
            
            model.currentpage = url
            
        }
        
        let fromIndex = model.urls.firstIndex { (Page) -> Bool in
             return Page.id == model.currentpage?.id
        } ?? 0
        
        let toIndex = model.urls.firstIndex { (Page) -> Bool in
            return Page.id == self.url.id
        } ?? 0
        
        if fromIndex != toIndex{
            
            withAnimation(.default){
                
                let frompage = model.urls[fromIndex]
                model.urls[fromIndex] = model.urls[toIndex]
                model.urls[toIndex] = frompage
                
            }
            
        }
        
        
        
        
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
            
            
        
    }

}

