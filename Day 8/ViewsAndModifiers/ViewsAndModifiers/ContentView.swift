//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Rahul on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button("Tap me") {
            print(type(of: self.body))
        }
        .background(.red) // ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>
        
        .foregroundColor(.white) // ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Optional<Color>>>
        
        .frame(width: 200, height: 200) //  ModifiedContent<ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Optional<Color>>>, _FrameLayout>

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
