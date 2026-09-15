```swift
import SwiftUI

struct ContentView: View {
    @State private var showBack = false
    @State private var showDone = false

    private let flipDuration = 0.7

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            // MARK: - Front

            ZStack {
                Image("RichImage")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    HStack {
                        Spacer()

                        Button {
                            showDone = false

                            withAnimation(.easeInOut(duration: flipDuration)) {
                                showBack = true
                            }

                            DispatchQueue.main.asyncAfter(
                                deadline: .now() + flipDuration / 2
                            ) {
                                withAnimation(.easeInOut(duration: 0.15)) {
                                    showDone = true
                                }
                            }
                        } label: {
                            Text("(i)")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                                .frame(width: 18, height: 19)
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 10)
                    }
                }
            }
            .rotation3DEffect(
                .degrees(showBack ? -180 : 0),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.7
            )
            .opacity(showBack ? 0 : 1)

            // MARK: - Back

            ZStack {
                Image("BackImage")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()

                        Button {
                            showDone = false

                            withAnimation(.easeInOut(duration: flipDuration)) {
                                showBack = false
                            }
                        } label: {
                            Text("Done")
                                .font(.system(size: 17))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                        }
                        .opacity(showDone ? 1 : 0)
                        .allowsHitTesting(showDone)
                    }

                    Spacer()
                }
            }
            .rotation3DEffect(
                .degrees(showBack ? 0 : 180),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.7
            )
            .opacity(showBack ? 1 : 0)
        }
        .statusBarHidden()
    }
}

#Preview {
    ContentView()
}
