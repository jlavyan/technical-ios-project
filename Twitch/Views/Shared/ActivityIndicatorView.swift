//
//  ActivityIndicatorView.swift
//  Twitch
//
//  Created by Jlavyan on 5/25/20.
//  Copyright © 2020 Jlavayn. All rights reserved.
//

import SwiftUI

/// Progress view indicator
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
