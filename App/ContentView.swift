//
//  ContentView.swift
//  Africa
//
//  Created by ELİF BEYZA SAĞLAM on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
   
let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive :Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    //MARK: FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        //ToolBar Image
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "square.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View{
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
               
                        NavigationLink(destination:AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                           
                          }  //:LINK
                        } //LOOP
                    } //LIST
                } else {
                    ScrollView(.vertical ,  showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//NavigationLink
                            } //LOOP
                        } //GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//SCROLL
                }// CONDITION
            } //GROUP
            
            .navigationBarTitle("Africa", displayMode:.large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .accentColor)
                        }//GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor: .primary)
                        }
                    } // HSTACK
                }//Buttons
            } //ToolBar
        } // Navigation
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
