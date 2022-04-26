//
//  File.swift
//  
//
//  Created by Rizal Fahlepi on 26/04/22.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    
    public init() {}
    
    public func makeUIView(
        context: UIViewRepresentableContext<ActivityIndicator>
    ) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    public func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivityIndicator>
    ) {
        uiView.startAnimating()
    }
    
}
