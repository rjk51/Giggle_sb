//
//  SampleData.swift
//  Giggle_sb
//
//  Created by rjk on 06/11/24.
//

import Foundation

let sampleGigs: [Gig] = [
    Gig(
        id: "1",
        title: "iOS Developer",
        description: "Develop and maintain iOS applications using Swift and UIKit.",
        employerId: "employer123",
        requiredSkills: ["Swift", "UIKit", "Xcode", "Git"],
        location: "New York, NY",
        duration: "6 months",
        salary: 80000.00,
        postedAt: Date(),
        approximity: "On-site",
        experience: "2+ years",
        gigInfo: [
            ["Project Type": "Mobile Development"],
            ["Team Size": "5-10"],
            ["Deadline": "6 months"]
        ],
        facilites: ["Health Insurance", "Paid Time Off", "Gym Membership"],
        gigAvatar: "apple1",
        companyName: "Apple"
    ),
    Gig(
        id: "2",
        title: "Backend Developer",
        description: "Design and implement REST APIs in a cloud-based environment.",
        employerId: "employer456",
        requiredSkills: ["Python", "Django", "REST", "AWS"],
        location: "Remote",
        duration: "12 months",
        salary: 95000.00,
        postedAt: Date(),
        approximity: "Remote",
        experience: "3+ years",
        gigInfo: [
            ["Project Type": "Web Development"],
            ["Team Size": "10-15"],
            ["Deadline": "12 months"]
        ],
        facilites: ["Remote Work Stipend", "Flexible Hours", "Stock Options"],
        gigAvatar: "Image",
        companyName: "Google"
    ),
    Gig(
        id: "3",
        title: "Data Analyst",
        description: "Analyze and interpret complex data to provide insights for business decisions.",
        employerId: "employer789",
        requiredSkills: ["SQL", "Python", "Tableau", "Data Visualization"],
        location: "San Francisco, CA",
        duration: "3 months",
        salary: 70000.00,
        postedAt: Date(),
        approximity: "Hybrid",
        experience: "1+ years",
        gigInfo: [
            ["Project Type": "Data Analysis"],
            ["Team Size": "3-5"],
            ["Deadline": "3 months"]
        ],
        facilites: ["Commuter Benefits", "Health Insurance", "Catered Lunches"],
        gigAvatar: "amazon",
        companyName: "Amazon"
    )
]
