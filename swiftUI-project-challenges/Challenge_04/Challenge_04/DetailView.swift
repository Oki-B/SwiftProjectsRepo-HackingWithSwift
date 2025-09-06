//
//  DetailView.swift
//  Challenge_04
//
//  Created by Syaoki Biek on 06/09/25.
//

import SwiftUI

struct DetailView: View {
    @Bindable var activities : Activities
    var activity: Activity
    var currentDate = Date.now

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationStack {

            VStack(alignment: .leading) {
                Group {
                    Text("Activity Description : ")
                        .font(.headline)

                    ScrollView {
                        Text("\(activity.description)")
                            .foregroundStyle(.black.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 20)
                    }
                    .frame(height: 100)

                    VStack {
                        Button {
                            activities.addCompletion(for: activity, date: .now)
                        } label: {
                            Text("Mark as complete")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(12)
                        }

                        Text(
                            "Mark if you already completed this activity for today"
                        )
                        .font(.caption)
                        .foregroundStyle(.black.opacity(0.8))
                    }
                    .padding(.top)
                }
            }
            .padding(16)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding()
            .toolbar {

            }

            if activity.completionData.count > 0 {
                Group {
                    HStack(alignment: .center, spacing: 16) {
                        Text("Completion History")
                            .font(.title2)
                            .fontWeight(.bold)

                        HStack(spacing: 8) {
                            Text("\(activity.completionData.count)")
                                .font(.title2)
                                .fontWeight(.bold)

                            Image(systemName: "checkmark.seal.fill")
                                .font(.headline)
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .background(.green.opacity(0.8))
                        .cornerRadius(20)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                }
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activity.completionData, id: \.self) { completion in
                        let dateAndTime = activity.formattedCompletionDates(
                            date: completion
                        )
                        VStack(spacing: 10) {
                            Text(dateAndTime.date)
                                .font(.headline)

                            Image(systemName: "checkmark.seal")
                                .foregroundStyle(.green.opacity(0.8))
                                .font(.largeTitle)

                            Text(
                                """
                                Completed at 
                                \(dateAndTime.time)
                                """
                            )
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green.opacity(0.5), lineWidth: 2))
                        .padding(.horizontal, 8)
                        .padding(.bottom, 12)
                    }
                }
                .padding(.horizontal, 32)
                .padding(.top, 8)
            }
            .navigationTitle(activity.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackgroundVisibility(.visible)
            .toolbarBackground(.blue.opacity(0.7))
            .toolbarColorScheme(.dark)

        }
    }
}

#Preview {
    let activities = Activities()
    let activity: Activity = Activity(
        id: UUID(),
        title: "Jogging",
        description:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32.",
        completionData: []
    )

    return DetailView(activities: activities, activity: activity)
}
