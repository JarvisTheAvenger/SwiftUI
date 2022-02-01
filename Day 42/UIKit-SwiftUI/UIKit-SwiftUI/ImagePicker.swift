//
//  ImagePicker.swift
//  UIKit-SwiftUI
//
//  Created by Rahul on 01/02/22.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = PHPickerViewController
        
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        
        return picker
        
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }

}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
