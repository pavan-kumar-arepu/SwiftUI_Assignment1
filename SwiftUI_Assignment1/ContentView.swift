//
//  ContentView.swift
//  SwiftUI_Assignment1
//
//  Created by Pavankumar Arepu on 28/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var flagTheme = ["🇧🇴","🏁","🇮🇳", "🏳️‍⚧️","🇦🇺","🇧🇿","🇧🇯","🚩"]
    var vehicleTheme = ["🚗","🚙","🚌","🚎","🏎","🚐","🚕","🚁"]
    var fruitTheme = ["🍑","🍊","🍌","🍇","🍏","🍒","🍋","🥭"]
    
    @State var index = 0

    var body: some View {
        
        let themes = [flagTheme, vehicleTheme, fruitTheme]
        
        let theme = themes[index]

        VStack {
            
            topTitle.font(.largeTitle)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                
                ForEach(theme[0..<theme.count], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack {
                flag.font(.largeTitle)
                Spacer()
                vehicle.font(.largeTitle)
                Spacer()
                Fruits.font(.largeTitle)
            }.padding(.horizontal)

            
        }.padding(.horizontal)
       
      
    }
    
    
    // Top Title
    
    var topTitle: some View {
        Text("Memorize!")
    }
    // Add Themes at the bottom
    
    // Flag Theme
    var flag: some View {
        Button {
            index = 0
        } label: {
            Image(systemName: "flag.fill")
        }
    }
    
    // Vehicle Theme
    var vehicle: some View {
        Button {
            index = 1
        } label: {
            Image(systemName: "car.fill")
        }
    }
    
    // Fruits Theme
    var Fruits: some View {
        Button {
            index = 2
        } label: {
            Image(systemName: "bird.fill")
            
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4.0).foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
