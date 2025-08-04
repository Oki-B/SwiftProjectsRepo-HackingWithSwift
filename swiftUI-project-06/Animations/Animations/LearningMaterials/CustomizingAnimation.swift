//
//  CustomizingAnimation.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct CustomizingAnimation: View {
    @State private var animationAmount = 1.0
    @State private var animationAmountOnAppear = 1.0

    var body: some View {
        VStack {
            Button("Tap Me") {
                animationAmount += 0.5
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 50)

            Spacer()

            VStack(spacing: 50) {
                HStack(spacing: 50) {
                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(.linear, value: animationAmount)
                        Text("Linear")
                    }.frame(width: 70)

                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(
                                .spring(duration: 1, bounce: 0.9),
                                value: animationAmount
                            )
                        Text("Spring")
                    }.frame(width: 70)

                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(
                                .easeInOut(duration: 2),
                                value: animationAmount
                            )
                        Text("Ease")
                    }.frame(width: 70)
                }

                HStack(spacing: 50) {
                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(
                                .easeInOut(duration: 2)
                                    .delay(1),
                                value: animationAmount
                            )
                        Text("Delay")
                    }.frame(width: 70)

                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(
                                .easeInOut(duration: 2)
                                    .repeatCount(3, autoreverses: true),
                                value: animationAmount
                            )
                        Text("Repeat")
                    }.frame(width: 70)

                    VStack(spacing: 50) {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                            .scaleEffect(animationAmount)
                            .blur(radius: (animationAmount - 1) * 0.5)
                            .animation(
                                .easeInOut(duration: 2)
                                    .repeatForever(autoreverses: true),
                                value: animationAmount
                            )
                        Text("Forever")
                    }.frame(width: 70)
                }

                VStack(spacing: 50) {
                    Circle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(.blue)
                                .scaleEffect(animationAmountOnAppear)
                                .opacity(2 - animationAmountOnAppear)
                                .animation(
                                    .easeInOut(duration: 1)
                                        .repeatForever(autoreverses: false),
                                    value: animationAmountOnAppear
                                )
                        )

                    Text(
                        """
                        Trigger animation using on Appear
                        Utilize repeat forever to create continue anim
                        """
                    ).multilineTextAlignment(.center)
                }
                .padding(.top, 50)
            }

            Spacer()
            Spacer()
        }
        .onAppear {
            animationAmountOnAppear = 2
        }

    }
}

#Preview {
    CustomizingAnimation()
}
