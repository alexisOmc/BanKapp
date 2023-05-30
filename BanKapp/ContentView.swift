//
//  ContentView.swift
//  BanKapp
//
//  Created by Alexis Marquez on 30/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkRequest = NetworkCall()
    
    
    var body: some View {
        NavigationView {
            List(self.networkRequest.infoBank, id: \.description){ user in
                    
                ZStack {
                  
                    HStack(){
                        ImageView(imageUrl: user.url)

                        
       
                        VStack {
                            HStack {
                                
                                
                                Text(user.description)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.gray)
                                    .padding(5)
                                
                                Text("\(user.age)")
                                    .multilineTextAlignment(.center)
                                    .font(.body)
                                    .padding(.trailing, 30 )
                            }
                        }
                            }
                        }
                  
                
                VStack {
                    Text(user.bankName)
                        .useCapsuleStyle(enabled: true)
                        .aspectRatio(contentMode: .fit)

                }
                Spacer()
            }
        }
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    var body: some View {
        Image(uiImage: ((imageLoader.data.count == 0) ? UIImage(systemName: "photo") : UIImage(data: imageLoader.data))!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
