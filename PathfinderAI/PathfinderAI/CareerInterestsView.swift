//
//  CareerInterestsView.swift
//  PathfinderAI
//

import SwiftUI

private struct DiscoveryOption: Identifiable {
    let title: String
    let icon: String

    var id: String { title }
}

private struct DiscoveryStep {
    let name: String
    let title: String
    let description: String
    let options: [DiscoveryOption]
}

struct CareerInterestsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentStep = 0
    @State private var answers: [Int: Set<String>] = [:]
    @State private var isComplete = false
    @State private var showingRecommendations = false

    private let ink = Color(red: 0.10, green: 0.16, blue: 0.25)
    private let mutedInk = Color(red: 0.37, green: 0.43, blue: 0.51)
    private let canvas = Color(red: 0.96, green: 0.97, blue: 0.98)
    private let blue = Color(red: 0.20, green: 0.43, blue: 0.82)

    private let steps: [DiscoveryStep] = [
        DiscoveryStep(
            name: "Interests",
            title: "What are you interested in?",
            description: "Choose a few things you enjoy. Your interests can help you explore careers that might be a good fit.",
            options: [
                DiscoveryOption(title: "Technology", icon: "laptopcomputer"),
                DiscoveryOption(title: "Music", icon: "music.note"),
                DiscoveryOption(title: "Sports", icon: "figure.run"),
                DiscoveryOption(title: "Art & Design", icon: "paintpalette"),
                DiscoveryOption(title: "Science", icon: "atom"),
                DiscoveryOption(title: "Business", icon: "chart.line.uptrend.xyaxis"),
                DiscoveryOption(title: "Helping People", icon: "heart"),
                DiscoveryOption(title: "Writing", icon: "pencil.line")
            ]
        ),
        DiscoveryStep(
            name: "Strengths",
            title: "What are some of your strengths?",
            description: "Pick skills or qualities that sound like you. It’s okay if you’re still building them.",
            options: [
                DiscoveryOption(title: "Problem solving", icon: "puzzlepiece.extension"),
                DiscoveryOption(title: "Creativity", icon: "lightbulb"),
                DiscoveryOption(title: "Communication", icon: "bubble.left.and.bubble.right"),
                DiscoveryOption(title: "Leadership", icon: "person.3"),
                DiscoveryOption(title: "Organization", icon: "checklist"),
                DiscoveryOption(title: "Hands-on building", icon: "hammer"),
                DiscoveryOption(title: "Research", icon: "magnifyingglass"),
                DiscoveryOption(title: "Teamwork", icon: "person.2")
            ]
        ),
        DiscoveryStep(
            name: "Academics",
            title: "What subjects do you enjoy?",
            description: "Choose favorite subjects or topics you’d like to learn more about.",
            options: [
                DiscoveryOption(title: "Math", icon: "function"),
                DiscoveryOption(title: "Science", icon: "flask"),
                DiscoveryOption(title: "English & Writing", icon: "book"),
                DiscoveryOption(title: "Art", icon: "paintpalette"),
                DiscoveryOption(title: "History & Social Studies", icon: "globe.americas"),
                DiscoveryOption(title: "Computer Science", icon: "desktopcomputer"),
                DiscoveryOption(title: "Business", icon: "chart.bar"),
                DiscoveryOption(title: "Physical Education", icon: "figure.run")
            ]
        ),
        DiscoveryStep(
            name: "Work Style",
            title: "How do you like to work?",
            description: "Think about the places and ways of working where you feel comfortable and productive.",
            options: [
                DiscoveryOption(title: "Working with a team", icon: "person.3"),
                DiscoveryOption(title: "Working independently", icon: "person"),
                DiscoveryOption(title: "Hands-on activities", icon: "hand.raised"),
                DiscoveryOption(title: "Office or remote", icon: "desktopcomputer"),
                DiscoveryOption(title: "Being outdoors", icon: "sun.max"),
                DiscoveryOption(title: "A fast-paced day", icon: "hare"),
                DiscoveryOption(title: "Clear routines", icon: "calendar"),
                DiscoveryOption(title: "Lots of variety", icon: "shuffle")
            ]
        ),
        DiscoveryStep(
            name: "Priorities",
            title: "What matters most in a career?",
            description: "Choose what you hope a future job will offer or make possible.",
            options: [
                DiscoveryOption(title: "Creativity", icon: "sparkles"),
                DiscoveryOption(title: "Helping people", icon: "heart"),
                DiscoveryOption(title: "Stability", icon: "shield.lefthalf.filled"),
                DiscoveryOption(title: "Strong income", icon: "dollarsign.circle"),
                DiscoveryOption(title: "Flexibility", icon: "slider.horizontal.3"),
                DiscoveryOption(title: "Learning and growth", icon: "arrow.up.right"),
                DiscoveryOption(title: "Work-life balance", icon: "scale.3d"),
                DiscoveryOption(title: "Making an impact", icon: "globe")
            ]
        ),
        DiscoveryStep(
            name: "Education Preferences",
            title: "How would you like to learn for a career?",
            description: "There are many ways to prepare. Choose the paths you’d like to explore.",
            options: [
                DiscoveryOption(title: "A four-year college", icon: "building.columns"),
                DiscoveryOption(title: "A two-year college", icon: "books.vertical"),
                DiscoveryOption(title: "Trade or technical school", icon: "wrench.and.screwdriver"),
                DiscoveryOption(title: "Certificates", icon: "rosette"),
                DiscoveryOption(title: "Learning while working", icon: "briefcase"),
                DiscoveryOption(title: "Apprenticeship", icon: "person.2.badge.gearshape"),
                DiscoveryOption(title: "I’m still exploring", icon: "questionmark.circle")
            ]
        )
    ]

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    private var currentAnswers: Set<String> {
        answers[currentStep, default: []]
    }

    private var selectedInterests: Set<String> {
        answers[0, default: []]
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                if isComplete {
                    completionContent
                } else {
                    progressHeader
                    questionContent
                    navigationButtons
                }
            }
            .padding(.horizontal, 22)
            .padding(.top, 22)
            .padding(.bottom, 32)
            .frame(maxWidth: 560)
            .frame(maxWidth: .infinity)
        }
        .background(canvas.ignoresSafeArea())
        .foregroundStyle(ink)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("Home", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                }
                .tint(blue)
            }
        }
        .toolbar(.visible, for: .navigationBar)
        .navigationDestination(isPresented: $showingRecommendations) {
            CareerRecommendationsView(selectedInterests: selectedInterests)
        }
    }

    private var progressHeader: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack {
                Text("Step \(currentStep + 1) of \(steps.count)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(blue)
                Spacer()
                Text(steps[currentStep].name)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(mutedInk)
            }
            ProgressView(value: Double(currentStep + 1), total: Double(steps.count))
                .tint(blue)
        }
    }

    private var questionContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            if currentStep == 0 {
                Text("YOUR PATH STARTS WITH YOU")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1.3)
                    .foregroundStyle(blue)
            }

            Text(steps[currentStep].title)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tracking(-0.6)
                .fixedSize(horizontal: false, vertical: true)

            Text(steps[currentStep].description)
                .font(.system(size: 16))
                .lineSpacing(4)
                .foregroundStyle(mutedInk)
                .fixedSize(horizontal: false, vertical: true)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(steps[currentStep].options) { option in
                    optionCard(option)
                }
            }
            .padding(.top, 8)
        }
    }

    private func optionCard(_ option: DiscoveryOption) -> some View {
        let isSelected = currentAnswers.contains(option.title)

        return Button {
            var updatedAnswers = answers[currentStep, default: []]
            if isSelected {
                updatedAnswers.remove(option.title)
            } else {
                updatedAnswers.insert(option.title)
            }
            answers[currentStep] = updatedAnswers
        } label: {
            HStack(spacing: 10) {
                Image(systemName: option.icon)
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(isSelected ? blue : mutedInk)
                    .frame(width: 34, height: 34)
                    .background(
                        isSelected ? Color(red: 0.88, green: 0.94, blue: 1.0) : canvas,
                        in: RoundedRectangle(cornerRadius: 11, style: .continuous)
                    )

                Text(option.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer(minLength: 0)

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(blue)
                }
            }
            .foregroundStyle(ink)
            .padding(12)
            .frame(maxWidth: .infinity, minHeight: 76, alignment: .leading)
            .background(.white, in: RoundedRectangle(cornerRadius: 17, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 17, style: .continuous)
                    .stroke(isSelected ? blue : ink.opacity(0.05), lineWidth: isSelected ? 2 : 1)
            }
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    private var navigationButtons: some View {
        VStack(spacing: 10) {
            if currentAnswers.isEmpty {
                Text("Choose at least one option to continue.")
                    .font(.system(size: 13))
                    .foregroundStyle(mutedInk)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            HStack(spacing: 12) {
                Button {
                    if currentStep == 0 {
                        dismiss()
                    } else {
                        currentStep -= 1
                    }
                } label: {
                    Text("Back")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundStyle(blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(.white, in: RoundedRectangle(cornerRadius: 17, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 17, style: .continuous)
                                .stroke(blue.opacity(0.25), lineWidth: 1)
                        }
                }
                .buttonStyle(.plain)

                Button {
                    if currentStep == steps.count - 1 {
                        isComplete = true
                    } else {
                        currentStep += 1
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text(currentStep == steps.count - 1 ? "Finish" : "Next")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Image(systemName: currentStep == steps.count - 1 ? "checkmark" : "arrow.right")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(blue, in: RoundedRectangle(cornerRadius: 17, style: .continuous))
                }
                .buttonStyle(.plain)
                .disabled(currentAnswers.isEmpty)
                .opacity(currentAnswers.isEmpty ? 0.5 : 1)
            }
        }
    }

    private var completionContent: some View {
        VStack(alignment: .leading, spacing: 22) {
            VStack(alignment: .leading, spacing: 9) {
                HStack {
                    Text("Questionnaire complete")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundStyle(blue)
                    Spacer()
                    Text("6 of 6")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(mutedInk)
                }
                ProgressView(value: 1)
                    .tint(blue)
            }

            VStack(alignment: .leading, spacing: 12) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 42))
                    .foregroundStyle(blue)

                Text("You’re ready to explore your future.")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tracking(-0.6)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Your answers are saved for this session. The questionnaire is ready for career analysis, and you can review or change your answers any time.")
                    .font(.system(size: 16))
                    .lineSpacing(4)
                    .foregroundStyle(mutedInk)
                    .fixedSize(horizontal: false, vertical: true)
            }

            VStack(spacing: 12) {
                Button {
                    showingRecommendations = true
                } label: {
                    HStack(spacing: 9) {
                        Text("Explore sample career ideas")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(blue, in: RoundedRectangle(cornerRadius: 17, style: .continuous))
                }
                .buttonStyle(.plain)

                Button("Review answers") {
                    isComplete = false
                    currentStep = steps.count - 1
                }
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundStyle(blue)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CareerInterestsView()
    }
}
