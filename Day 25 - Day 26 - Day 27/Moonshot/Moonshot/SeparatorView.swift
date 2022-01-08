//
//  SeparatorView.swift
//  Moonshot
//
//  Created by Rahul on 08/01/22.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
