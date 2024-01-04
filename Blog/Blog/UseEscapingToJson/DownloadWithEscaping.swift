//
//  DownloadWithEscaping.swift
//  Blog
//
//  Created by 정다산 on 1/4/24.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject{
    
    @Published var posts: [PostModel] = []
    init(){
        getPosts()
    }
    
    func getPosts(){
        //https://jsonplaceholder.typicode.com/posts
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadData(fromURL: url) { returnData in
            if let data = returnData{
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
                DispatchQueue.main.async {[weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("반환될 데이터가 존재 하지 않습니다")
            }
        }
        
        
        
       
        
    }
    
    
    func downloadData(fromURL url: URL, completionHandler: @escaping(_ data: Data?) -> ()){
        URLSession.shared.dataTask(with: url){data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("데이터 다운로드에 실패했습니다.")
                completionHandler(nil)
                return
                
            }
            completionHandler(data)
            
        }.resume()
        
    }
}



struct DownloadWithEscaping: View {
    
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        ScrollView{
            ForEach(vm.posts){ post in
                VStack(spacing: 10){
                    Text(post.title)
                        .font(Font.title.bold())
                    Text(post.body)
                        .foregroundColor(Color(UIColor.systemGray2))
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                
            }
        }
    }
}

#Preview {
    DownloadWithEscaping()
}
