//
//  CombineJSon.swift
//  Blog
//
//  Created by 정다산 on 1/6/24.
//

import SwiftUI
import Combine



class DownloadWithCombineViewModel: ObservableObject{
    
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init(){
            getPosts()
    }
    
    func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] returnedPost in
                self?.posts = returnedPost
            }
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else { throw URLError(.badServerResponse) }
        return output.data
    }
}



struct CombineJSon: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(vm.posts){ post in
                    VStack(alignment: .leading,spacing: 10){
                        Text(post.title)
                            .font(Font.title.bold())
                        Text(post.body)
                            .foregroundColor(Color(UIColor.systemGray2))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .navigationTitle("Fake JSON Data")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    CombineJSon()
}
