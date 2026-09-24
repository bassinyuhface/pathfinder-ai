//
//  ContentView.swift
//  PathfinderAI
//
//  Created by LA6_mac22 on 9/22/26.
//

import SwiftUI

struct ContentView: View {
    private let ink = Color(red: 0.10, green: 0.16, blue: 0.25)
    private let mutedInk = Color(red: 0.37, green: 0.43, blue: 0.51)
    private let canvas = Color(red: 0.96, green: 0.97, blue: 0.98)

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 26) {
                    header
                    welcome
                    exploreButton
                    futureSection
                    footerNote
                }
                .padding(.horizontal, 22)
                .padding(.top, 16)
                .padding(.bottom, 32)
                .frame(maxWidth: 560)
                .frame(maxWidth: .infinity)
            }
            .background(canvas.ignoresSafeArea())
            .foregroundStyle(ink)
        }
    }

    private var header: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(Color(red: 0.88, green: 0.94, blue: 1.0))
                    .frame(width: 42, height: 42)
                Image(systemName: "location.north.circle.fill")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color(red: 0.20, green: 0.43, blue: 0.82))
            }
            Text("Pathfinder AI")
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Spacer()
            Image(systemName: "person.crop.circle")
                .font(.system(size: 25, weight: .regular))
                .foregroundStyle(mutedInk)
                .accessibilityLabel("Profile")
        }
    }

    private var welcome: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("YOUR NEXT CHAPTER STARTS HERE")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1.3)
                .foregroundStyle(Color(red: 0.20, green: 0.43, blue: 0.82))

            Text("Big future.\nSmall first steps.")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .tracking(-0.8)
                .fixedSize(horizontal: false, vertical: true)

            Text("Welcome to Pathfinder AI. Discover careers that fit you and make a plan to get there—one step at a time.")
                .font(.system(size: 16))
                .lineSpacing(4)
                .foregroundStyle(mutedInk)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, 10)
    }

    private var exploreButton: some View {
        NavigationLink {
            CareerInterestsView()
        } label: {
            HStack(spacing: 10) {
                Text("Explore Careers")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                Image(systemName: "arrow.right")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color(red: 0.20, green: 0.43, blue: 0.82), in: RoundedRectangle(cornerRadius: 17, style: .continuous))
        }
        .buttonStyle(.plain)
        .accessibilityHint("Start exploring career ideas")
    }

    private var futureSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Build Your Future")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                Text("A few helpful ways to get started")
                    .font(.system(size: 14))
                    .foregroundStyle(mutedInk)
            }

            VStack(spacing: 12) {
                FutureCard(
                    icon: "sparkles",
                    title: "Career interests",
                    detail: "Explore what you enjoy and what you're good at.",
                    tint: Color(red: 0.95, green: 0.89, blue: 0.74),
                    ink: ink,
                    mutedInk: mutedInk
                )
                FutureCard(
                    icon: "book.closed.fill",
                    title: "Education paths",
                    detail: "See different ways to learn and prepare.",
                    tint: Color(red: 0.84, green: 0.92, blue: 0.87),
                    ink: ink,
                    mutedInk: mutedInk
                )
                FutureCard(
                    icon: "flag.fill",
                    title: "Goal planning",
                    detail: "Turn a big idea into simple next steps.",
                    tint: Color(red: 0.89, green: 0.87, blue: 0.97),
                    ink: ink,
                    mutedInk: mutedInk
                )
            }
        }
    }

    private var footerNote: some View {
        HStack(spacing: 7) {
            Image(systemName: "heart.fill")
                .font(.system(size: 11))
                .foregroundStyle(Color(red: 0.88, green: 0.40, blue: 0.42))
            Text("Your path is yours to shape.")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(mutedInk)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 1)
    }
}

private struct FutureCard: View {
    let icon: String
    let title: String
    let detail: String
    let tint: Color
    let ink: Color
    let mutedInk: Color

    var body: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 13, style: .continuous)
                .fill(tint)
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: icon)
                        .font(.system(size: 19, weight: .semibold))
                        .foregroundStyle(ink)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(ink)
                Text(detail)
                    .font(.system(size: 13))
                    .lineSpacing(2)
                    .foregroundStyle(mutedInk)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(mutedInk.opacity(0.75))
        }
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(ink.opacity(0.05), lineWidth: 1)
        }
    }
}

#Preview {
    ContentView()
}
