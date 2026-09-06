import SwiftUI

struct ContentView: View {
    // true = ruby screen (default), false = text screen
    @State private var showRuby = true

    var body: some View {
        ZStack {
            if showRuby {
                RubyView(flip: { showRuby = false })
                    .transition(.opacity)
            } else {
                TextView(flip: { showRuby = true })
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showRuby)
        .statusBarHidden()
        .preferredColorScheme(.dark)
    }
}

/// Text screen — classic "I am rich" mantra + Done button
struct TextView: View {
    var flip: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Navigation bar (old iOS style)
                ZStack {
                    Color(red: 0.07, green: 0.07, blue: 0.08)
                    
                    Text("IAmRich")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    HStack {
                        Spacer()
                        Button(action: flip) {
                            Text("Done")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(Color(red: 0.0, green: 0.48, blue: 1.0))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                        .padding(.trailing, 10)
                    }
                }
                .frame(height: 44)

                Spacer(minLength: 40)

                // Mantra — closer to original 2008 look
                VStack(alignment: .leading, spacing: 0) {
                    Text("I am rich")
                        .font(.system(size: 42, weight: .regular))
                    
                    Text("I deserv it")
                        .font(.system(size: 42, weight: .regular))
                    
                    Text(" ")
                        .font(.system(size: 22))
                    
                    Text("I am good,")
                        .font(.system(size: 42, weight: .bold))
                    
                    Text("healthy &")
                        .font(.system(size: 42, weight: .bold))
                    
                    Text("successful")
                        .font(.system(size: 42, weight: .bold))
                }
                .foregroundStyle(Color(white: 0.78))
                .padding(.leading, 28)
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
            }
        }
    }
}

/// Ruby screen — glowing gem + info button
struct RubyView: View {
    var flip: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image("RubyGem")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .clipped()

            // Soft vignette for better depth
            RadialGradient(
                colors: [.clear, .black.opacity(0.35)],
                center: .center,
                startRadius: 80,
                endRadius: 420
            )
            .ignoresSafeArea()
            .allowsHitTesting(false)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: flip) {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 24))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.white.opacity(0.9))
                            .shadow(color: .black.opacity(0.5), radius: 4, y: 1)
                    }
                    .padding(.trailing, 18)
                    .padding(.bottom, 18)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
