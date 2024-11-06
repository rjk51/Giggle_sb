//
//  User.swift
//  Giggle_sb
//
//  Created by rjk on 28/10/24.
//


import Foundation

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
    let requiredSkills: [String]
    let location: String
    let duration: String
    let salary: Double
    let postedAt: Date
    let approximity: String
    let experience: String
    let gigInfo: [[String: String]]
    let facilites: [String]
    let gigAvatar: String
}

// MARK: - Employer
struct Employer: Codable {
    let id: String
    let companyName: String
    let industry: String
    let address: String
    let contactEmail: String
    let postedGigs: [String]
}

// MARK: - Application
struct Application: Codable {
    let id: String
    let userId: String
    let gigId: String
    let applicationStatus: String
    let submittedAt: Date
}

// MARK: - Review
struct Review: Codable {
    let id: String
    let reviewerId: String
    let revieweeId: String
    let rating: Int
    let comments: String
    let reviewType: String
    let createdAt: Date
}

// MARK: - FLN Score
struct FLNScore: Codable {
    let id: String
    let fluencyScore: Int
    let literacyScore: Int
    let numeracyScore: Int
    let GiggleGrade: String
    let attempts: Int
}

// MARK: - Skill Validation (UI/UX)
struct SkillValidationUiUx: Codable {
    let id: String
    let skills: [String]
    let behance: String
    let dribbble: String
    let media: [String]
}

// MARK: - Literacy Question
struct LiteracyQuestion: Codable {
    let id: String
    let questionText: String
}

// MARK: - Literacy Answer
struct LiteracyAnswer: Codable {
    let id: String
    let questionId: String
    let answerText: String
}

// MARK: - Literacy Correct Answer
struct LiteracyCorrectAnswer: Codable {
    let id: String
    let questionId: String
    let correctAnswerId: String
}

// MARK: - Numeracy Question
struct NumeracyQuestion: Codable {
    let id: String
    let questionText: String
}

// MARK: - Numeracy Answer
struct NumeracyAnswer: Codable {
    let id: String
    let questionId: String
    let answerText: String
}

// MARK: - Numeracy Correct Answer
struct NumeracyCorrectAnswer: Codable {
    let id: String
    let questionId: String
    let correctAnswerId: String
}

// MARK: - Admin
struct Admin: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
}
