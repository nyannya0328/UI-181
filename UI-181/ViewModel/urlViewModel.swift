//
//  urlViewModel.swift
//  UI-181
//
//  Created by にゃんにゃん丸 on 2021/05/11.
//

import SwiftUI

class urlViewModel: ObservableObject {
   @Published var urls = [
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!),
    Page(url: URL(string: "https://unsplash.com/")!)
   ]
    
    @Published var selectedTab = "paperplane"
    
    @Published var currentpage : Page?
}

