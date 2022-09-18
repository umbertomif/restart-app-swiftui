//
//  HomeView.swift
//  Restart
//
//  Created by Umberto M. I. Ferreira on 2022/09/17.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35: -35)
                    .animation(.easeOut(duration: 4).repeatForever(), value: isAnimating)
            } //: ZSTACK
            // MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of your focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)

            // MARK: - FOOTER
            Spacer()
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart").font(.system(.title3,design: .rounded)).fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
