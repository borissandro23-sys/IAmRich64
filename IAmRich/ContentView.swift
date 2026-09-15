import SwiftUI

struct ContentView: View {
@State private var showBack = false
@State private var showDone = false

```
private let flipDuration = 0.7

var body: some View {
    ZStack {
        Color.black
            .ignoresSafeArea()

        // MARK: - Front / Back

        Image(showBack ? "BackImage" : "RichImage")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
            .rotation3DEffect(
                .degrees(showBack ? 180 : 0),
                axis: (x: 0, y: 1, z: 0),
                perspective: 0.7
            )
            .animation(
                .easeInOut(duration: flipDuration),
                value: showBack
            )

        // MARK: - Front (i) button

        if !showBack {
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
                        Text("ⓘ")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 18, height: 19)
                    .padding(.trailing, 28)
                    .padding(.bottom, 47)
                }
            }
        }

        // MARK: - Back "Done" button

        if showBack {
            VStack {
                HStack {
                    Spacer()

                    Button("Done") {
                        showDone = false

                        withAnimation(.easeInOut(duration: flipDuration)) {
                            showBack = false
                        }
                    }
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                    .opacity(showDone ? 1 : 0)
                    .allowsHitTesting(showDone)
                    .padding(.top, 8)
                    .padding(.trailing, 12)
                }

                Spacer()
            }
        }
    }
    .statusBarHidden()
}
```

}

#Preview {
ContentView()
}
