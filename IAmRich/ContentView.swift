//
//  ContentView.swift
//  IAmRich
//
//  Tap the (i) button to flip the view, just like the original
//  UIKit app's MainView / FlipsideView pair.
//

import SwiftUI

struct ContentView: View {
    @State private var showBack = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image(showBack ? "BackImage" : "RichImage")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .leading)
                ))
                .id(showBack)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.6)) {
                            showBack.toggle()
                        }
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(.white.opacity(0.85))
                            .shadow(radius: 4)
                    }
                    .padding()
                }
            }
        }
        .statusBarHidden()
    }
}

#Preview {
    ContentView()
}
