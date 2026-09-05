import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Deep red background, like the original app
            LinearGradient(
                colors: [Color(red: 0.55, green: 0.02, blue: 0.02),
                         Color(red: 0.25, green: 0.0, blue: 0.0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                RubyGem()
                    .frame(width: 180, height: 180)
                    .shadow(color: .red.opacity(0.6), radius: 30)

                Text("I AM RICH")
                    .font(.system(size: 34, weight: .heavy, design: .serif))
                    .foregroundStyle(.white)
                    .tracking(4)

                Text("I am rich, I deserv it, I am good, healthy & successful.")
                    .font(.system(size: 15, weight: .medium, design: .serif))
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white.opacity(0.85))
                    .padding(.horizontal, 40)

                Spacer()
                Spacer()
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
