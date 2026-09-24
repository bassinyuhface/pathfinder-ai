//
//  CareerRecommendationsView.swift
//  PathfinderAI
//

import SwiftUI

private struct CareerRecommendation: Identifiable {
    let title: String
    let description: String
    let relatedInterests: Set<String>

    var id: String { title }
}

struct CareerRecommendationsView: View {
    @Environment(\.dismiss) private var dismiss

    let selectedInterests: Set<String>

    private let ink = Color(red: 0.10, green: 0.16, blue: 0.25)
    private let mutedInk = Color(red: 0.37, green: 0.43, blue: 0.51)
    private let canvas = Color(red: 0.96, green: 0.97, blue: 0.98)
    private let blue = Color(red: 0.20, green: 0.43, blue: 0.82)

    private let sampleCareers = [
        CareerRecommendation(
            title: "Software Developer",
            description: "Build and maintain apps, websites, or other software that solves problems for people and organizations.",
            relatedInterests: ["Technology", "Art & Design", "Business"]
        ),
        CareerRecommendation(
            title: "Cybersecurity Analyst",
            description: "Help protect computer systems and information by finding security risks and responding to threats.",
            relatedInterests: ["Technology", "Science"]
        ),
        CareerRecommendation(
            title: "User Experience Designer",
            description: "Research how people use products and design digital experiences that are clear and easy to use.",
            relatedInterests: ["Technology", "Art & Design", "Helping People"]
        ),
        CareerRecommendation(
            title: "Audio Engineer",
            description: "Record, mix, and improve sound for music, films, live events, or podcasts.",
            relatedInterests: ["Music", "Technology"]
        ),
        CareerRecommendation(
            title: "Music Therapist",
            description: "Use music activities to support people's communication, well-being, and personal goals.",
            relatedInterests: ["Music", "Helping People"]
        ),
        CareerRecommendation(
            title: "Athletic Trainer",
            description: "Help athletes prevent injuries, recover safely, and prepare for practices and competitions.",
            relatedInterests: ["Sports", "Science", "Helping People"]
        ),
        CareerRecommendation(
            title: "Sports Journalist",
            description: "Report on teams and events through interviews, articles, broadcasts, or digital media.",
            relatedInterests: ["Sports", "Writing"]
        ),
        CareerRecommendation(
            title: "Graphic Designer",
            description: "Create visual materials such as logos, posters, and digital graphics to communicate ideas.",
            relatedInterests: ["Art & Design", "Technology", "Business"]
        ),
        CareerRecommendation(
            title: "Architect",
            description: "Plan and design buildings by combining creative ideas with materials, safety, and client needs.",
            relatedInterests: ["Art & Design", "Science", "Technology"]
        ),
        CareerRecommendation(
            title: "Environmental Scientist",
            description: "Study the natural world and use evidence to help address issues such as pollution and habitat loss.",
            relatedInterests: ["Science", "Helping People"]
        ),
        CareerRecommendation(
            title: "Nurse",
            description: "Care for patients, monitor their health, and work with medical teams to support treatment and recovery.",
            relatedInterests: ["Science", "Helping People"]
        ),
        CareerRecommendation(
            title: "Entrepreneur",
            description: "Develop a business idea, understand customer needs, and organize the work to bring a product or service to life.",
            relatedInterests: ["Business", "Technology", "Art & Design"]
        ),
        CareerRecommendation(
            title: "Market Research Analyst",
            description: "Gather information about customers and markets to help organizations make thoughtful business decisions.",
            relatedInterests: ["Business", "Science", "Writing"]
        ),
        CareerRecommendation(
            title: "Teacher",
            description: "Help students learn new skills and ideas by planning lessons, explaining concepts, and offering support.",
            relatedInterests: ["Helping People", "Writing", "Science"]
        ),
        CareerRecommendation(
            title: "Counselor",
            description: "Listen to people, help them work through challenges, and connect them with useful resources and goals.",
            relatedInterests: ["Helping People", "Writing"]
        ),
        CareerRecommendation(
            title: "Writer",
            description: "Research and create stories, articles, scripts, or other written content for different audiences.",
            relatedInterests: ["Writing", "Art & Design", "Business"]
        ),
        CareerRecommendation(
            title: "Technical Writer",
            description: "Turn complex information into clear guides, instructions, and documentation for readers.",
            relatedInterests: ["Writing", "Technology", "Science"]
        )
    ]

    private var recommendations: [CareerRecommendation] {
        sampleCareers.filter { !$0.relatedInterests.isDisjoint(with: selectedInterests) }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 22) {
                introduction

                if recommendations.isEmpty {
                    emptyState
                } else {
                    VStack(spacing: 12) {
                        ForEach(recommendations) { career in
                            careerCard(career)
                        }
                    }
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
                    Label("Interests", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                }
                .tint(blue)
            }
        }
        .toolbar(.visible, for: .navigationBar)
    }

    private var introduction: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("A FEW IDEAS TO EXPLORE")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1.3)
                .foregroundStyle(blue)

            Text("Careers that connect with you")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tracking(-0.6)
                .fixedSize(horizontal: false, vertical: true)

            Text("Based on your interests: \(selectedInterestNames)")
                .font(.system(size: 16))
                .lineSpacing(4)
                .foregroundStyle(mutedInk)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "sparkles")
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(blue)
            Text("Choose an interest to get started")
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Text("Go back and select at least one interest, and we'll find some career ideas for you.")
                .font(.system(size: 15))
                .lineSpacing(3)
                .foregroundStyle(mutedInk)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func careerCard(_ career: CareerRecommendation) -> some View {
        NavigationLink {
            CareerRoadmapView(careerTitle: career.title, careerDescription: career.description)
        } label: {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 9) {
                    Text(career.title)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundStyle(ink)
                    Text(career.description)
                        .font(.system(size: 14))
                        .lineSpacing(3)
                        .foregroundStyle(mutedInk)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(mutedInk.opacity(0.75))
            }
            .padding(17)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(ink.opacity(0.05), lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
        .accessibilityHint("View the career roadmap")
    }

    private var selectedInterestNames: String {
        let interestOrder = [
            "Technology", "Music", "Sports", "Art & Design",
            "Science", "Business", "Helping People", "Writing"
        ]
        return interestOrder.filter { selectedInterests.contains($0) }.joined(separator: ", ")
    }
}

#Preview {
    NavigationStack {
        CareerRecommendationsView(selectedInterests: ["Technology", "Art & Design"])
    }
}
