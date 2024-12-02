//
//  User.swift
//  Giggle_sb
//
//  Created by rjk on 28/10/24.
//


import Foundation
import UIKit

// MARK: - UserReg
struct UserReg: Codable {
    let email: String
    let password: String
}

// MARK: - User
struct User: Codable {
    let id: String
    let displayName: String
    let role: String
    let email: String
    let password: String
    let phoneNumber: String
    let location: String
    let skills: [String]
    let gigs: [String]
    let createdAt: Date
}

// MARK: - Gig
struct Gig: Codable {
    let id: String
    let title: String
    let description: String
    let employerId: String
    let requirements: [String]
    let location: String
    let duration: String
    let salary: Double
    let postedAt: Date
    let approximity: String
    let experience: String
    let qualification: String
    let specialization: String
    let facilites: [String]
    let gigAvatar: String
    let companyName: String
}

// MARK: - Notifications
struct Notifications: Codable {
    let id: String
    let gigAvatar: String
    let notificationContent: String
    let postedAt: String
    var isRead: Bool
}
// MARK: - Transcript
struct TranscriptText: Codable {
    let text: String
}

// MARK: - LiteracyScore
struct LiteracyScore {
    let score: Double
}

// MARK: - NumeracyScore
struct NumeracyScore {
    let score: Double
}

// MARK: - FLN Score
struct FLNScore: Codable {
    let id: String
    let fluencyScore: Int
    let literacyScore: Int
    let numeracyScore: Int
    let GiggleGrade: String
}

// MARK: - Literacy Question
struct LiteracyQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

// MARK: - Numeracy Question
struct NumeracyQuestion: Codable {
    let question: String
    let options: [String]
    let correctAnswer: String
}

