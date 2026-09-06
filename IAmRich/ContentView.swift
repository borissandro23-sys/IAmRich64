import SwiftUI

struct ContentView: View {
    // Front = text screen ("IAmRich" nav bar). Back = glowing gem screen.
    @State private var showBack = false

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

            RadialGradient(
                colors: [Color(red: 1.0, green: 0.05, blue: 0.05),
                         Color(red: 0.4, green: 0.0, blue: 0.0),
                         Color.black],
                center: .center,
                startRadius: 10,
                endRadius: 260
            )
            .ignoresSafeArea()

            RubyGem()
                .frame(width: 90, height: 90)
                .shadow(color: .white.opacity(0.8), radius: 20)

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

/// A simple procedural gem/ruby drawn with SwiftUI shapes,
/// standing in for the original app's bitmap artwork.
struct RubyGem: View {
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            ZStack {
                GemShape()
                    .fill(
                        LinearGradient(
                            colors: [Color.red, Color(red: 0.7, green: 0, blue: 0), Color.black.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(GemShape().stroke(Color.white.opacity(0.6), lineWidth: 1.5))

                GemShape()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: w * 0.35, height: h * 0.2)
                    .offset(x: -w * 0.15, y: -h * 0.2)
                    .blur(radius: 4)
            }
        }
    }
}

struct GemShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height

        path.move(to: CGPoint(x: w * 0.5, y: 0))
        path.addLine(to: CGPoint(x: w * 0.85, y: h * 0.35))
        path.addLine(to: CGPoint(x: w * 0.7, y: h))
        path.addLine(to: CGPoint(x: w * 0.3, y: h))
        path.addLine(to: CGPoint(x: w * 0.15, y: h * 0.35))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
