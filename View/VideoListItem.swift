//
//  VideoListItem.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 29.10.2022.
//

import SwiftUI

struct VideoListItem: View {
    //MARK: - PROPERTIES
    
    let video:Video
    
    //MARK: - BODY
    
    var body: some View {
        HStack(spacing:10){
            ZStack{
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32)
                    .shadow(radius:4)
                
            }//:ZSTACK
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//VSTACK
        }//:HSTACK
    }
}
 //MARK: - PREVIEW

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode(file: "videos.json")
    
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
