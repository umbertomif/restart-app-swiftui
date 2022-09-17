//
//  OnboardingView.swift
//  Restart
//
//  Created by Umberto M. I. Ferreira on 2022/09/17.
//

import SwiftUI

struct OnboardingView: View {
    // if the app doesn't find the onboarding value, then this value will be set.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    It"s not how much we give but
                    how much love we put nto giving.
                    """).font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                } //: HEADER
                // MARK: - CENTER
                ZStack() {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                Spacer()
                // MARK: - FOOTER
                ZStack() {
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    HStack() {
                        Capsule().fill(Color("ColorRed")).frame(width: 80)
                        Spacer()
                    }
                    HStack {
                        ZStack() {
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15)).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24,weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    } //: HStack
                } //: FOOTER
                .frame(height: 80, alignment: .center).padding()
            } //: VStack
        } //: ZStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
