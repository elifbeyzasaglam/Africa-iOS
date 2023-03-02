//
//  VideoListView.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 22.10.2022.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: PROPERTIES
    
    @State var videos:[Video] = Bundle.main.decode(file: "videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(videos) {item in
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItem(video: item)
                            .padding(.vertical,8)
                    }
                }
            }//:LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos",displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } // NAVIGATION
    }
}

//MARK: PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItemView()
    }
}
