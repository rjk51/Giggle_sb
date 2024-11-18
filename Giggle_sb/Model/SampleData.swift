import Foundation

let sampleGigs: [Gig] = [
    Gig(
        id: "1",
        title: "iOS Developer",
        description: "Develop and maintain high-performance iOS applications using Swift and UIKit. Collaborate with cross-functional teams to define, design, and ship new features. Perform code reviews, troubleshoot bugs, and improve app performance for a smooth user experience. Ideal for a motivated developer with a passion for mobile technology.",
        employerId: "employer123",
        requirements: ["Swift", "UIKit", "Xcode", "Git", "REST APIs", "MVVM architecture"],
        location: "New York, NY",
        duration: "6 months",
        salary: 80000.00,
        postedAt: Date(),
        approximity: "On-site",
        experience: "2+ years",
        qualification: "Bachelor's Degree",
        specialization: "App Development",
        facilites: ["Health Insurance", "Paid Time Off", "Gym Membership", "Relocation Assistance"],
        gigAvatar: "apple1",
        companyName: "Apple"
    ),
    Gig(
        id: "2",
        title: "Backend Developer",
        description: "Design, develop, and maintain scalable REST APIs and backend systems for high-traffic applications. Ensure security, reliability, and performance optimization within a cloud-based environment. Work closely with frontend teams to support seamless integration with client applications. Opportunity for a seasoned developer to make a significant impact.",
        employerId: "employer456",
        requirements: ["Python", "Django", "REST", "AWS", "Docker", "Microservices"],
        location: "Remote",
        duration: "12 months",
        salary: 95000.00,
        postedAt: Date(),
        approximity: "Remote",
        experience: "3+ years",
        qualification: "Bachelor's Degree",
        specialization: "Database Management",
        facilites: ["Remote Work Stipend", "Flexible Hours", "Stock Options", "Annual Retreat"],
        gigAvatar: "google",
        companyName: "Google"
    ),
    Gig(
        id: "3",
        title: "Data Analyst",
        description: "Analyze and interpret complex datasets to provide actionable insights and improve decision-making processes. Collaborate with different departments to understand data requirements and create visualizations that effectively communicate data-driven insights. Ideal for a detail-oriented analyst with strong analytical and problem-solving skills.",
        employerId: "employer789",
        requirements: ["SQL", "Python", "Tableau", "Data Visualization", "Statistics"],
        location: "San Francisco, CA",
        duration: "3 months",
        salary: 70000.00,
        postedAt: Date(),
        approximity: "Hybrid",
        experience: "1+ years",
        qualification: "Bachelor's Degree",
        specialization: "Data Science",
        facilites: ["Commuter Benefits", "Health Insurance", "Catered Lunches", "Wellness Program"],
        gigAvatar: "amazon",
        companyName: "Amazon"
    )
]
var sampleNotifications: [Notifications] = [
    Notifications(
        id: "1",
        gigAvatar: "Image",
        notificationContent: "You have a new job opportunity at Google. Apply now!",
        postedAt: "15h",
        isRead: false
    ),
    Notifications(
        id: "2",
        gigAvatar: "amazon",
        notificationContent: "Amazon have accepted your application for the Data Analyst role.",
        postedAt: "20h",
        isRead: false
    )
]


var questions: [LiteracyQuestion] = [
    LiteracyQuestion(question: "Is Python case sensitive when dealing with identifiers?",
             options: ["No", "Yes", "Machine dependent", "None of the mentioned"],
                     correctAnswer: "Yes"),
    LiteracyQuestion(question: "What is the correct file extension for Python files?",
                     options: [".py", ".python", ".pyt", ".code"], correctAnswer: ".py")
]

