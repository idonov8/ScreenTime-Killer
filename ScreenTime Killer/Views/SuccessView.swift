//
//  SuccessView.swift
//  ScreenTime Killer
//
//  Created by Ido Nov & ChatGPT on 06/09/2024.
//

import SwiftUI

struct SuccessView: View {
    // Dynamic elements
    var hoursGained: Int
    var daysChallenge: Int
    var moneySaved: Int
    var projectedDays: Int
    var projectedYears: Int
    var donationAmount: Int
    
    // State for animations
    @State private var showCheckmark = false
    @State private var showDetails = false
    @State private var showFutureBenefit = false
    @State private var showActions = false
    @State private var confettiTrigger = false
    
    // Animation delay
    private let animationDelay: Double = 2.1
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            // Confetti Animation
            if confettiTrigger {
                ConfettiView()
                    .transition(.opacity)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5).delay(animationDelay)) {
                            confettiTrigger = true
                        }
                    }
            }
            
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    // Header
                    Text("You made it!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                        .opacity(showCheckmark ? 1 : 0)
                        .scaleEffect(showCheckmark ? 1 : 0.5)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.5).delay(animationDelay)) {
                                showCheckmark = true
                            }
                        }
                    
                    // Celebratory Icon
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .opacity(showCheckmark ? 1 : 0)
                        .scaleEffect(showCheckmark ? 1 : 0.5)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.5).delay(animationDelay)) {
                                showCheckmark = true
                                confettiTrigger = true
                            }
                        }
                    
                    // Accomplishment Details
                    VStack {
                        (Text("\(hoursGained)").bold() + Text(" hours gained \n over ") + Text("\(daysChallenge)").bold() + Text(" days"))
                            .font(.system(size: 100))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(.white).scaledToFit()
                        
                        Text("(and $\(moneySaved) saved!)")
                            .font(.title3)
                            .foregroundColor(.white)
                    }.multilineTextAlignment(.center)
            
                    .opacity(showDetails ? 1 : 0)
                    .offset(y: showDetails ? 0 : 20)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5).delay(animationDelay * 2)) {
                            showDetails = true
                        }
                    }
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    // Future Benefits
                    Text("If you keep this habit, you'll gain \(projectedDays) full days in the next \(projectedYears) years!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .opacity(showFutureBenefit ? 1 : 0)
                        .offset(y: showFutureBenefit ? 0 : 20)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.5).delay(animationDelay * 3)) {
                                showFutureBenefit = true
                            }
                        }
                    
                    // Sharing and Donation
                    HStack(spacing: 20) {
                        // Sharing Icons
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width:30, height: 40)
                            .foregroundColor(.white)
                        
                        // Donation Button
                        Button(action: {
                            // Donation action
                        }) {
                            Text("Donate 30% of your saving ($\(donationAmount))")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .opacity(showActions ? 1 : 0)
                    .offset(y: showActions ? 0 : 20)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5).delay(animationDelay * 4)) {
                            showActions = true
                        }
                    }
                    
                    // Feedback Prompt
                    Text("We'd love to hear your feedback!")
                        .font(.body)
                        .foregroundColor(.blue)
                        .padding(.bottom)
                        .opacity(showActions ? 1 : 0)
                        .offset(y: showActions ? 0 : 20)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.5).delay(animationDelay * 4)) {
                                showActions = true
                            }
                        }
                }
            }
            .padding()
        }
    }
}

// ConfettiView for celebration effect
struct ConfettiView: View {
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<100) { index in
                ConfettiParticleView()
                    .position(
                        x: CGFloat.random(in: 0...geometry.size.width),
                        y: CGFloat.random(in: -50...0)
                    )
            }
        }
    }
}

struct ConfettiParticleView: View {
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .fill(Self.randomColor())
            .frame(width: 10, height: 10)
            .rotationEffect(.degrees(Double.random(in: 0...360)))
            .offset(y: yOffset)
            .onAppear {
                withAnimation(.linear(duration: Double.random(in: 2...4)).repeatForever(autoreverses: false)) {
                    yOffset = UIScreen.main.bounds.height + 50
                }
            }
    }
    
    private static func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink]
        return colors.randomElement() ?? .black
    }
}

#Preview {
    SuccessView(
        hoursGained: 40,
        daysChallenge: 30,
        moneySaved: 200,
        projectedDays: 200,
        projectedYears: 20,
        donationAmount: 60
    )
}
