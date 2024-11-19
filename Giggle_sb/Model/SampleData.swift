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

let transcript = TranscriptText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pellentesque viverra dui. Fusce non congue quam, pellentesque feugiat tellus. Suspendisse iaculis ligula erat, vitae aliquam dolor hendrerit ac. Suspendisse facilisis ac ipsum laoreet consectetur. Vestibulum diam magna, interdum in imperdiet eu, sodales sit amet nisl. Etiam lacus nisl, dictum nec nisi id, tempor posuere purus. Donec pulvinar vitae nibh id sollicitudin. Sed dui nisl, iaculis pharetra purus sed, ultricies porttitor justo. Nullam quis porta lectus. Phasellus non turpis commodo, finibus nisi vel, tempor velit. Praesent sodales urna sit amet mauris vestibulum blandit. Sed blandit, diam vel suscipit placerat, eros odio rhoncus orci, in vestibulum nisl ligula ac lectus.Nunc porttitor lacus in augue dignissim, a cursus lacus accumsan. Quisque eu nisi venenatis, blandit orci sit amet, dictum erat. Morbi quis ornare nunc. Fusce faucibus sapien non nibh semper convallis. Sed hendrerit malesuada aliquam. Cras vel libero quam. Aliquam sed mi non leo condimentum feugiat. Suspendisse nec convallis justo, sit amet porttitor ipsum. Praesent laoreet nisl ornare vulputate pharetra. Sed maximus ipsum sed justo eleifend, pharetra lacinia neque porta. Mauris nisl nunc, ultrices molestie elit ut, eleifend hendrerit est.Donec faucibus pharetra dui sed cursus. Pellentesque bibendum orci leo, in laoreet velit convallis a. Duis gravida sem eu consequat scelerisque. Sed egestas suscipit arcu vitae imperdiet. Cras tortor elit, imperdiet a consectetur eu, aliquet vitae justo. Vivamus ultrices leo nisi, quis euismod nunc suscipit et. Praesent pulvinar bibendum rutrum. Quisque maximus sollicitudin sapien non eleifend. Phasellus commodo purus tristique nibh ultrices accumsan. Vestibulum ultricies posuere aliquam. Proin ut risus porta, tempor ante a, dictum mauris. Pellentesque vel nisi at tortor suscipit dignissim vitae et ex. Ut accumsan dignissim arcu, eu sollicitudin quam pretium eu. Vestibulum eget scelerisque turpis. Cras sit amet nibh commodo, imperdiet velit vitae, dapibus nibh. In accumsan ligula in enim sollicitudin, at tempor turpis fringilla.")

