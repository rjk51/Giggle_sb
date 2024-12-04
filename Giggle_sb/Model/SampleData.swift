import Foundation

let sampleGigs: [Gig] = [
    Gig(
        id: "1",
        title: "Mobile App Developer",
        description: "Design and develop a mobile application for our online marketplace. Collaborate with a small, dedicated team to ensure seamless user experience. Focus on creating a lightweight, efficient app that supports our growing customer base.",
        employerId: "msme001",
        requirements: ["Flutter", "Dart", "Firebase", "UI/UX Design"],
        location: "Pune, Maharashtra",
        duration: "4 months",
        salary: 40000.00,
        postedAt: Date(),
        approximity: "On-site",
        experience: "1+ years",
        qualification: "Diploma or Bachelor's in Computer Science",
        specialization: "Mobile App Development",
        facilites: ["Daily Meals", "Flexible Hours", "Team Outings"],
        gigAvatar: "mc",
        companyName: "MarketConnect Solutions"
    ),
    Gig(
        id: "2",
        title: "Social Media Manager",
        description: "Manage and grow the online presence of our small business. Create engaging content, monitor analytics, and run targeted campaigns to increase brand visibility. Ideal for a creative individual with strong knowledge of social media trends and strategies.",
        employerId: "msme002",
        requirements: ["Content Creation", "Social Media Management", "SEO", "Canva"],
        location: "Remote",
        duration: "6 months",
        salary: 30000.00,
        postedAt: Date(),
        approximity: "Remote",
        experience: "1+ years",
        qualification: "Any Graduate",
        specialization: "Digital Marketing",
        facilites: ["Work-from-Home Allowance", "Performance Bonus"],
        gigAvatar: "dg",
        companyName: "Digital Growth Hub"
    ),
    Gig(
        id: "3",
        title: "Inventory Manager Intern",
        description: "Set up and optimize inventory management systems for our manufacturing unit. Work with suppliers and warehouse staff to ensure stock availability, streamline operations, and reduce waste. Ideal for someone with strong organizational skills.",
        employerId: "msme003",
        requirements: ["Excel", "Inventory Management Software", "Procurement"],
        location: "Jaipur, Rajasthan",
        duration: "5 months",
        salary: 35000.00,
        postedAt: Date(),
        approximity: "On-site",
        experience: "2+ years",
        qualification: "Diploma in Supply Chain Management",
        specialization: "Inventory Management",
        facilites: ["Accommodation", "Transport Allowance", "Health Insurance"],
        gigAvatar: "sc",
        companyName: "Shree Craftworks"
    ),
    Gig(
        id: "4",
        title: "Graphic Designer Intern",
        description: "Create visually appealing designs for our marketing materials, including posters, brochures, and social media posts. Work closely with the marketing team to align designs with brand identity. Perfect for someone with a creative flair.",
        employerId: "msme004",
        requirements: ["Adobe Photoshop", "Illustrator", "CorelDRAW"],
        location: "Bangalore, Karnataka",
        duration: "3 months",
        salary: 25000.00,
        postedAt: Date(),
        approximity: "Hybrid",
        experience: "6+ months",
        qualification: "Certification in Graphic Design",
        specialization: "Graphic Design",
        facilites: ["Free Snacks", "Creative Freedom", "Performance Bonus"],
        gigAvatar: "ds",
        companyName: "The Design Studio"
    ),
    Gig(
        id: "5",
        title: "Sales Executive",
        description: "Generate leads, meet potential clients, and promote our products to expand our customer base. Focus on building long-term relationships with clients and achieving sales targets. Ideal for a motivated individual with good interpersonal skills.",
        employerId: "msme005",
        requirements: ["Sales", "Communication Skills", "CRM Software"],
        location: "Mumbai, Maharashtra",
        duration: "6 months",
        salary: 45000.00,
        postedAt: Date(),
        approximity: "On-site",
        experience: "1+ years",
        qualification: "Any Graduate",
        specialization: "Sales and Marketing",
        facilites: ["Travel Reimbursement", "Incentives", "Training Program"],
        gigAvatar: "ep",
        companyName: "EcoPack Solutions"
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
    LiteracyQuestion(
        question: "Which part of a sentence provides more information about the subject?",
        options: ["Verb", "Object", "Predicate", "Clause"],
        correctAnswer: "Predicate"
    ),
    LiteracyQuestion(
        question: "What is the term for a word that modifies a noun?",
        options: ["Adjective", "Verb", "Adverb", "Pronoun"],
        correctAnswer: "Adjective"
    ),
    LiteracyQuestion(
        question: "Identify the correct spelling of the word:",
        options: ["Accomodate", "Acommodate", "Accommodate", "Acomodate"],
        correctAnswer: "Accommodate"
    ),
    LiteracyQuestion(
        question: "Which punctuation mark is used to indicate a strong pause or separation?",
        options: ["Comma", "Dash", "Period", "Colon"],
        correctAnswer: "Dash"
    ),
    LiteracyQuestion(
        question: "What is the past tense of the verb 'run'?",
        options: ["Ran", "Runned", "Running", "Raned"],
        correctAnswer: "Ran"
    )
]
var numeracyQuestions: [NumeracyQuestion] = [
    NumeracyQuestion(
        question: "What is 15% of 200?",
        options: ["25", "30", "35", "40"],
        correctAnswer: "30"
    ),
    NumeracyQuestion(
        question: "Solve: 8 × (5 + 3)",
        options: ["40", "56", "64", "48"],
        correctAnswer: "64"
    ),
    NumeracyQuestion(
        question: "What is the square root of 144?",
        options: ["10", "11", "12", "14"],
        correctAnswer: "12"
    ),
    NumeracyQuestion(
        question: "Which of the following is a prime number?",
        options: ["4", "9", "13", "15"],
        correctAnswer: "13"
    ),
    NumeracyQuestion(
        question: "Solve for x: 2x + 6 = 14",
        options: ["2", "3", "4", "5"],
        correctAnswer: "4"
    )
]

let transcript = TranscriptText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pellentesque viverra dui. Fusce non congue quam, pellentesque feugiat tellus. Suspendisse iaculis ligula erat, vitae aliquam dolor hendrerit ac. Suspendisse facilisis ac ipsum laoreet consectetur. Vestibulum diam magna, interdum in imperdiet eu, sodales sit amet nisl. Etiam lacus nisl, dictum nec nisi id, tempor posuere purus. Donec pulvinar vitae nibh id sollicitudin. Sed dui nisl, iaculis pharetra purus sed, ultricies porttitor justo. Nullam quis porta lectus. Phasellus non turpis commodo, finibus nisi vel, tempor velit. Praesent sodales urna sit amet mauris vestibulum blandit. Sed blandit, diam vel suscipit placerat, eros odio rhoncus orci, in vestibulum nisl ligula ac lectus.Nunc porttitor lacus in augue dignissim, a cursus lacus accumsan. Quisque eu nisi venenatis, blandit orci sit amet, dictum erat. Morbi quis ornare nunc. Fusce faucibus sapien non nibh semper convallis. Sed hendrerit malesuada aliquam. Cras vel libero quam. Aliquam sed mi non leo condimentum feugiat. Suspendisse nec convallis justo, sit amet porttitor ipsum. Praesent laoreet nisl ornare vulputate pharetra. Sed maximus ipsum sed justo eleifend, pharetra lacinia neque porta. Mauris nisl nunc, ultrices molestie elit ut, eleifend hendrerit est.Donec faucibus pharetra dui sed cursus. Pellentesque bibendum orci leo, in laoreet velit convallis a. Duis gravida sem eu consequat scelerisque. Sed egestas suscipit arcu vitae imperdiet. Cras tortor elit, imperdiet a consectetur eu, aliquet vitae justo. Vivamus ultrices leo nisi, quis euismod nunc suscipit et. Praesent pulvinar bibendum rutrum. Quisque maximus sollicitudin sapien non eleifend. Phasellus commodo purus tristique nibh ultrices accumsan. Vestibulum ultricies posuere aliquam. Proin ut risus porta, tempor ante a, dictum mauris. Pellentesque vel nisi at tortor suscipit dignissim vitae et ex. Ut accumsan dignissim arcu, eu sollicitudin quam pretium eu. Vestibulum eget scelerisque turpis. Cras sit amet nibh commodo, imperdiet velit vitae, dapibus nibh. In accumsan ligula in enim sollicitudin, at tempor turpis fringilla.")

