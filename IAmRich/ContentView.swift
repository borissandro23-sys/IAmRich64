import SwiftUI

struct ContentView: View {
    // Front = text screen ("IAmRich" nav bar). Back = glowing gem screen.
    @State private var showBack = true

    var body: some View {
        ZStack {
            if showBack {
                BackView(flip: { showBack = false })
                    .transition(.opacity)
            } else {
                FrontView(flip: { showBack = true })
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: showBack)
        .statusBarHidden()
    }
}

/// The text screen: black background, "IAmRich" nav bar, "Done" button.
struct FrontView: View {
    var flip: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Nav bar
                ZStack {
                    Color(red: 0.08, green: 0.08, blue: 0.09)
                    HStack {
                        Spacer()
                        Text("IAmRich")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .overlay(alignment: .trailing) {
                        Button(action: flip) {
                            Text("Done")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.0, green: 0.48, blue: 1.0))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                        .padding(.trailing, 10)
                    }
                }
                .frame(height: 44)

                Spacer(minLength: 24)

                VStack(alignment: .leading, spacing: 2) {
                    Text("I am rich")
                    Text("I deserv it")
                    Text("")
                    Text("I am good,")
                        .fontWeight(.bold)
                    Text("healthy &")
                        .fontWeight(.bold)
                    Text("successful")
                        .fontWeight(.bold)
                }
                .font(.system(size: 40, weight: .regular, design: .rounded))
                .foregroundStyle(Color(white: 0.75))
                .padding(.leading, 24)
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
        }
    }
}

/// The back/flip screen: radial red glow with the gem, "i" info button.
struct BackView: View {
    var flip: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image("RubyGem")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: flip) {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 22))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                    .padding(16)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
