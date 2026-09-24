//
//  CareerRoadmapView.swift
//  PathfinderAI
//

import SwiftUI

private struct RoadmapMilestone: Identifiable {
    let title: String
    let detail: String

    var id: String { title }
}

private struct CareerRoadmapPlan {
    let overview: String
    let subjects: [String]
    let projects: [String]
    let pathways: [String]
    let programsToResearch: [String]
    let timeline: [RoadmapMilestone]
    let checklist: [String]

    static func sample(for career: String) -> CareerRoadmapPlan {
        switch career {
        case "Software Developer":
            CareerRoadmapPlan(
                overview: "Developers plan, write, test, and improve software. They often work with designers and other developers to turn a need into a reliable app or service.",
                subjects: ["Computer science", "Algebra and statistics", "English and communication", "Digital design"],
                projects: ["Build a small website, game, or app and ask someone to try it.", "Learn version control with Git and document what you change.", "Join a coding club or contribute to a supervised team project."],
                pathways: ["A bachelor’s degree in computer science, software engineering, or a related area is common.", "Some people enter through a community college transfer route, apprenticeship, or focused training plus a strong portfolio."],
                programsToResearch: ["Computer science and software engineering programs with project courses or co-ops.", "Local technology apprenticeships and internship eligibility for high school or college students."],
                timeline: [
                    .init(title: "High school", detail: "Build math and coding foundations; finish a small project and save it in a portfolio."),
                    .init(title: "After graduation", detail: "Choose a degree, transfer, apprenticeship, or other training route that fits your goals."),
                    .init(title: "During training", detail: "Work on team projects, practice testing and documentation, and seek an internship or co-op."),
                    .init(title: "Entering the career", detail: "Apply for junior developer roles with project examples and practice explaining your decisions.")
                ],
                checklist: ["Try one beginner programming lesson and write a tiny program.", "Ask a teacher about a coding, robotics, or app-building club.", "Compare two computer science or apprenticeship pathways.", "Save one finished project and a short note about how you built it."]
            )
        case "Cybersecurity Analyst":
            CareerRoadmapPlan(
                overview: "Cybersecurity analysts monitor systems, investigate suspicious activity, and help organizations reduce risks to computers, networks, and data.",
                subjects: ["Computer science", "Networking or information technology", "Math and statistics", "Writing and communication"],
                projects: ["Use a legal beginner cyber range or capture-the-flag exercise.", "Practice Linux and networking in a lab you own or have permission to use.", "Write a clear incident report for a fictional security scenario."],
                pathways: ["Study cybersecurity, information technology, or computer science at a college or community college.", "Some people start in IT support or networking and build security experience over time."],
                programsToResearch: ["Cybersecurity programs with labs, internships, and clear transfer options.", "Entry-level credentials such as CompTIA A+ or Security+; check current prerequisites and employer expectations."],
                timeline: [
                    .init(title: "High school", detail: "Learn computer systems and networking; practice only in authorized labs and competitions."),
                    .init(title: "First training", detail: "Choose an IT, networking, or cybersecurity program and build a foundation in systems."),
                    .init(title: "Build experience", detail: "Complete lab work, document investigations, and seek a supervised IT or security internship."),
                    .init(title: "Entering the career", detail: "Apply for entry-level security or IT roles; continue learning as tools and threats change.")
                ],
                checklist: ["Set up a beginner lab using a trusted learning platform.", "Write down three networking terms and explain them in your own words.", "Compare a cybersecurity degree with an IT support pathway.", "Check current requirements for one entry-level security credential."]
            )
        case "User Experience Designer":
            CareerRoadmapPlan(
                overview: "UX designers learn what users need, map how a product should work, and test designs so digital tools are useful and understandable.",
                subjects: ["Art and visual design", "Psychology or social science", "Computer science", "English and research writing"],
                projects: ["Ask a few people how they use a familiar app; summarize patterns without collecting sensitive data.", "Sketch and prototype a better version of a school or community task.", "Test your prototype and show what you changed based on feedback."],
                pathways: ["Explore interaction design, human-computer interaction, graphic design, psychology, or related programs.", "A portfolio that shows research, iteration, and clear reasoning is important across many routes."],
                programsToResearch: ["Human-computer interaction, interaction design, or digital product design programs.", "Programs that include usability research, accessibility, portfolio reviews, and internships."],
                timeline: [
                    .init(title: "High school", detail: "Practice drawing interfaces, observing user needs, and explaining design choices."),
                    .init(title: "After graduation", detail: "Choose a design, HCI, psychology, or related program and check portfolio expectations."),
                    .init(title: "During training", detail: "Complete research and prototype projects; seek feedback from real users and mentors."),
                    .init(title: "Entering the career", detail: "Present case studies that show the problem, your process, testing, and final design.")
                ],
                checklist: ["Choose one everyday task that could be easier to use.", "Sketch a simple screen flow for improving that task.", "Ask someone to try your design and note where they get stuck.", "Save a short case study with your changes and reasoning."]
            )
        case "Audio Engineer":
            CareerRoadmapPlan(
                overview: "Audio engineers capture, edit, mix, and balance sound for recordings, live performances, film, games, and other media.",
                subjects: ["Music", "Physics", "Computer science or media arts", "Math and communication"],
                projects: ["Record and mix a short piece using equipment you can access safely.", "Compare microphones or room positions and write down what changes in the sound.", "Volunteer for supervised school theater, podcast, or concert sound work."],
                pathways: ["Build hands-on experience through a media production, audio engineering, or music technology program.", "Community college courses, studio assistance, and live-event experience can complement formal study."],
                programsToResearch: ["Audio production and sound engineering programs with studio access and live mixing practice.", "Local theaters, community radio, and studios that offer supervised internships or entry-level assistant roles."],
                timeline: [
                    .init(title: "High school", detail: "Practice recording and editing; help with school events under an experienced adult."),
                    .init(title: "After graduation", detail: "Compare audio programs, community college courses, and direct assistant opportunities."),
                    .init(title: "Build experience", detail: "Create a varied demo reel and learn signal flow, editing, and safe equipment setup."),
                    .init(title: "Entering the career", detail: "Seek assistant, venue, broadcast, or studio work and grow a network through reliable projects.")
                ],
                checklist: ["Record a short sound or music sample and practice editing it.", "Ask about helping with sound for a school performance or event.", "Compare two audio programs by equipment access and project work.", "Start a demo folder and label each sample with your role."]
            )
        case "Music Therapist":
            CareerRoadmapPlan(
                overview: "Music therapists use planned musical experiences to support clients’ health, learning, communication, or well-being as part of a professional care plan.",
                subjects: ["Music theory and performance", "Biology", "Psychology", "Communication and health"],
                projects: ["Practice an instrument or voice consistently and reflect on how music affects mood or focus.", "Learn about client privacy and respectful communication through school health or psychology coursework.", "Explore supervised volunteering in a community or care setting if age and local rules allow."],
                pathways: ["Research an American Music Therapy Association approved degree or equivalency route with clinical training.", "In the U.S., education and supervised clinical training lead to eligibility for the MT-BC exam; state rules can also apply."],
                programsToResearch: ["AMTA-approved music therapy college programs and their required clinical placements.", "Certification Board for Music Therapists requirements and your state’s recognition or licensing rules."],
                timeline: [
                    .init(title: "High school", detail: "Develop musicianship and learn about psychology, biology, and helping professions."),
                    .init(title: "College preparation", detail: "Apply to an approved music therapy program and ask about auditions and prerequisite courses."),
                    .init(title: "Clinical training", detail: "Complete required coursework and supervised clinical training, including an internship."),
                    .init(title: "Entering the career", detail: "Check current MT-BC and state requirements, then pursue roles in healthcare, schools, or community settings.")
                ],
                checklist: ["Pick an instrument or musical skill to practice on a regular schedule.", "Read about the difference between music therapy and general music activities.", "Find an AMTA-approved program and review its clinical training path.", "Check current MT-BC and state requirements with official organizations."]
            )
        case "Athletic Trainer":
            CareerRoadmapPlan(
                overview: "Athletic trainers work with physicians and other professionals to prevent, recognize, and help manage injuries and health concerns related to physical activity.",
                subjects: ["Biology and anatomy", "Chemistry", "Physical education", "Psychology and communication"],
                projects: ["Learn basic sports safety and injury-prevention principles from a qualified instructor.", "Help organize a school wellness or hydration awareness activity with staff approval.", "Observe a sports medicine professional only through an approved program."],
                pathways: ["In the U.S., the professional route commonly includes a CAATE-accredited master’s athletic training program.", "Graduates pursue the BOC certification exam and any state credential required where they plan to work."],
                programsToResearch: ["CAATE-accredited professional athletic training programs and their admissions prerequisites.", "Board of Certification exam eligibility and state athletic trainer licensure rules."],
                timeline: [
                    .init(title: "High school", detail: "Take biology and anatomy when available; learn about safe training and health careers."),
                    .init(title: "Undergraduate study", detail: "Complete prerequisite coursework and prepare an application for an accredited professional program."),
                    .init(title: "Professional training", detail: "Complete graduate coursework and supervised clinical experiences in varied settings."),
                    .init(title: "Entering the career", detail: "Meet current BOC and state requirements, then apply to schools, clinics, or sports organizations.")
                ],
                checklist: ["Ask a counselor which anatomy or health science classes are available.", "Find the official directory of CAATE-accredited programs.", "Write down the current BOC and state requirements for your area.", "Ask about an approved sports medicine observation opportunity."]
            )
        case "Sports Journalist":
            CareerRoadmapPlan(
                overview: "Sports journalists report on athletes, teams, and events through articles, interviews, audio, video, or digital storytelling.",
                subjects: ["English and journalism", "History and social studies", "Media production", "Statistics and communication"],
                projects: ["Write a game recap using verified facts and quotes gathered with permission.", "Start a school sports newsletter, podcast, or short video with an advisor.", "Practice interviewing and checking names, scores, and sources before publishing."],
                pathways: ["Study journalism, communications, or media production; many roles value a strong reporting portfolio.", "Student newspapers, campus stations, internships, and local outlets can provide early experience."],
                programsToResearch: ["Journalism and sports media programs with student newsrooms or broadcast facilities.", "Internship and mentorship programs at reputable local or campus news organizations."],
                timeline: [
                    .init(title: "High school", detail: "Report for a school publication and practice fair, accurate game coverage."),
                    .init(title: "After graduation", detail: "Choose journalism or media training and join a student newsroom early."),
                    .init(title: "Build a portfolio", detail: "Cover varied sports, learn audio or video tools, and complete supervised internships."),
                    .init(title: "Entering the career", detail: "Pitch focused story ideas and show published work that demonstrates accuracy and range.")
                ],
                checklist: ["Write a short recap of a school game using confirmed details.", "Ask an advisor about joining a student newspaper or broadcast team.", "Practice preparing interview questions and asking for permission to record.", "Save three edited samples in a journalism portfolio."]
            )
        case "Graphic Designer":
            CareerRoadmapPlan(
                overview: "Graphic designers create visual systems and materials—such as posters, identities, packaging, and digital graphics—to communicate a message.",
                subjects: ["Art and design", "Computer graphics", "English and communication", "Business or marketing"],
                projects: ["Create a poster for a school event and make versions for print and a phone screen.", "Practice typography, color, layout, and accessibility with feedback from classmates.", "Build a portfolio that shows drafts and design decisions, not only final images."],
                pathways: ["Explore associate or bachelor’s programs in graphic design, visual communication, or digital media.", "A focused certificate or self-directed portfolio can also help develop practical skills; employer expectations vary."],
                programsToResearch: ["Design programs with studio critiques, portfolio development, and internship opportunities.", "Adobe Certified Professional options if a credential fits your goals; compare cost and current exam scope."],
                timeline: [
                    .init(title: "High school", detail: "Make design projects for real audiences and build fundamentals in drawing and digital tools."),
                    .init(title: "After graduation", detail: "Compare design degrees, community college routes, and portfolio-based training."),
                    .init(title: "During training", detail: "Collect varied work, take critique seriously, and seek internships or client projects with guidance."),
                    .init(title: "Entering the career", detail: "Present a focused portfolio and explain the audience, goal, and choices behind each project.")
                ],
                checklist: ["Redesign a flyer or poster for a school activity.", "Ask two people what they notice first and what is unclear.", "Compare two design programs’ portfolio and internship requirements.", "Start a portfolio with a short explanation for each piece."]
            )
        case "Architect":
            CareerRoadmapPlan(
                overview: "Architects plan and design buildings, balancing how spaces look and function with client needs, building systems, safety, and regulations.",
                subjects: ["Geometry and algebra", "Physics", "Art and design", "Computer-aided drafting"],
                projects: ["Measure a small space and draw a scaled floor plan.", "Build a simple model and explain how light, movement, and accessibility affect it.", "Explore sustainable design by comparing materials or building energy choices."],
                pathways: ["Research professional architecture degrees and the education options accepted by your licensing jurisdiction.", "In many U.S. routes, licensure includes education, the NCARB Architectural Experience Program (AXP), and the ARE."],
                programsToResearch: ["NAAB-accredited architecture programs and each state board’s accepted education paths.", "NCARB AXP and ARE steps; ask programs whether they support early experience or an IPAL route."],
                timeline: [
                    .init(title: "High school", detail: "Build math and visual design skills; practice drawing spaces and making scale models."),
                    .init(title: "Architecture education", detail: "Compare accredited professional degree routes and confirm prerequisites with programs."),
                    .init(title: "Experience and exams", detail: "After qualifying education, document required AXP experience and prepare for ARE divisions."),
                    .init(title: "Entering the career", detail: "Apply for supervised design roles and complete the requirements of the jurisdiction where you seek licensure.")
                ],
                checklist: ["Draw a measured floor plan of a room you know.", "Compare architecture programs and verify accreditation directly.", "Read NCARB’s current overview of education, AXP, and ARE.", "Check your state board’s architect licensure requirements."]
            )
        case "Environmental Scientist":
            CareerRoadmapPlan(
                overview: "Environmental scientists collect and interpret evidence about air, water, soil, and ecosystems to understand problems and inform decisions.",
                subjects: ["Biology and ecology", "Chemistry", "Statistics and algebra", "Geography or earth science"],
                projects: ["Join a supervised local habitat, garden, or water-quality project.", "Practice mapping observations or organizing publicly available environmental data.", "Write a short evidence-based report that separates observations from conclusions."],
                pathways: ["Study environmental science, ecology, geology, chemistry, or another relevant field.", "Field, lab, GIS, and data experience can help; some roles prefer graduate study or a specialty."],
                programsToResearch: ["Environmental science programs with field courses, labs, internships, and GIS training.", "Local government, university, and conservation internships with age-appropriate supervision."],
                timeline: [
                    .init(title: "High school", detail: "Take lab sciences and statistics; participate in a supervised community science project."),
                    .init(title: "After graduation", detail: "Choose a science program with fieldwork and learn what specialties interest you."),
                    .init(title: "Build experience", detail: "Seek research or agency internships and practice sampling, mapping, and data reporting."),
                    .init(title: "Entering the career", detail: "Apply to technician or analyst roles that match your training; consider advanced study for specialized work.")
                ],
                checklist: ["Find a supervised community science project near you.", "Compare environmental science programs by field and lab courses.", "Try a beginner GIS or public environmental data lesson.", "Save one short project report with your methods and findings."]
            )
        case "Nurse":
            CareerRoadmapPlan(
                overview: "Nurses assess and monitor patients, coordinate care, educate people about health, and collaborate with other members of a care team.",
                subjects: ["Biology and anatomy", "Chemistry", "Math and statistics", "Psychology and communication"],
                projects: ["Strengthen study habits in science and practice clear, respectful communication.", "Explore approved first-aid or health education courses with a parent or school counselor.", "Look for supervised, age-appropriate volunteering in a community health setting."],
                pathways: ["Compare approved associate and bachelor’s nursing programs and their clinical placement requirements.", "Graduates seeking RN licensure generally complete the NCLEX-RN and meet their state board’s requirements."],
                programsToResearch: ["State-approved nursing programs and their NCLEX outcomes, clinical placements, and transfer options.", "Your state board of nursing and the official NCLEX candidate guidance from NCSBN."],
                timeline: [
                    .init(title: "High school", detail: "Focus on biology, chemistry, math, and communication; ask about health career exploration."),
                    .init(title: "Nursing program", detail: "Apply to a state-approved program and complete required coursework and supervised clinical training."),
                    .init(title: "Licensure", detail: "Graduate, apply through your board of nursing, and meet current NCLEX-RN requirements."),
                    .init(title: "Entering the career", detail: "Begin in an eligible nursing role and pursue orientation, experience, and specialties over time.")
                ],
                checklist: ["Ask a counselor which biology and chemistry courses support nursing preparation.", "Find your state board’s approved nursing program list.", "Compare associate and bachelor’s nursing pathways and transfer policies.", "Review current NCLEX-RN steps with NCSBN and your state board."]
            )
        case "Entrepreneur":
            CareerRoadmapPlan(
                overview: "Entrepreneurs identify a problem or opportunity, test a product or service idea, and organize the people and resources needed to run a venture.",
                subjects: ["Business and economics", "Math and personal finance", "English and presentation", "Technology or design"],
                projects: ["Interview potential customers about a problem before proposing a solution.", "Make a simple budget and test a small school-approved project or fundraiser.", "Track feedback and revise your idea instead of assuming the first version is right."],
                pathways: ["There is no single required degree; business, design, engineering, or industry knowledge can all help.", "Some founders learn through work experience, a small business program, or an incubator while developing a venture."],
                programsToResearch: ["College entrepreneurship centers, community small business workshops, and youth business competitions.", "U.S. Small Business Development Centers (SBDCs) or equivalent local small-business advising services."],
                timeline: [
                    .init(title: "High school", detail: "Notice a problem, learn budgeting, and test a small idea with adult guidance."),
                    .init(title: "After graduation", detail: "Choose training or work that builds knowledge in your intended industry and business skills."),
                    .init(title: "Test a venture", detail: "Research customers, costs, legal obligations, and risks before investing significant money."),
                    .init(title: "Entering the career", detail: "Launch in stages, keep records, learn from results, and seek qualified business advice.")
                ],
                checklist: ["Write down one problem you would like to solve.", "Ask three people what they currently do about that problem.", "Estimate the costs of a small, low-risk test of your idea.", "Find a local small-business advising center or school entrepreneurship program."]
            )
        case "Market Research Analyst":
            CareerRoadmapPlan(
                overview: "Market research analysts study consumers, competitors, and business conditions, then translate data into findings that guide decisions.",
                subjects: ["Statistics and algebra", "Economics and business", "Psychology or social science", "English and data visualization"],
                projects: ["Design a short, voluntary survey for a school project and avoid collecting private details.", "Use a spreadsheet to summarize results with a chart and plain-language takeaway.", "Compare two products using public information and explain the limits of your evidence."],
                pathways: ["A bachelor’s degree in marketing, business, statistics, communications, or social science is common.", "Research methods, statistics, internships, and strong writing are useful; advanced study may help in some roles."],
                programsToResearch: ["Marketing research, business analytics, economics, or statistics programs with applied projects.", "Internships with research firms or organizations; voluntary certifications only after checking employer value."],
                timeline: [
                    .init(title: "High school", detail: "Practice statistics, research questions, spreadsheets, and clear presentations."),
                    .init(title: "After graduation", detail: "Choose a quantitative or business-related degree and include methods courses."),
                    .init(title: "Build experience", detail: "Complete an ethical survey or data project and seek a research internship."),
                    .init(title: "Entering the career", detail: "Show that you can gather reliable data, analyze it, and make findings easy to act on.")
                ],
                checklist: ["Create one clear question about a product or service people use.", "Summarize public or voluntary survey data in a spreadsheet.", "Compare marketing research and business analytics programs.", "Practice explaining a chart in a short written paragraph."]
            )
        case "Teacher":
            CareerRoadmapPlan(
                overview: "Teachers plan lessons, explain ideas, assess learning, and adapt instruction to help students build knowledge and confidence.",
                subjects: ["A subject you may want to teach", "English and communication", "Psychology or child development", "Technology and statistics"],
                projects: ["Tutor or mentor through a school-approved program.", "Create a short lesson and ask a peer to try it; revise based on what was confusing.", "Practice explaining one topic in more than one way."],
                pathways: ["Many public-school teaching roles require a bachelor’s degree and an approved teacher preparation route.", "Alternative certification routes exist in some places; student teaching and a state credential are common requirements."],
                programsToResearch: ["State-approved teacher preparation programs, subject endorsements, and student teaching placements.", "Your state education department’s current credential, exam, and background-check requirements."],
                timeline: [
                    .init(title: "High school", detail: "Build subject knowledge and try supervised tutoring, coaching, or peer mentoring."),
                    .init(title: "Teacher preparation", detail: "Choose a subject and grade range, then enroll in an approved preparation program."),
                    .init(title: "Student teaching", detail: "Complete supervised classroom placements, required exams, and credential steps."),
                    .init(title: "Entering the career", detail: "Apply for teaching roles and continue learning through mentoring and professional development.")
                ],
                checklist: ["Choose a subject area you enjoy explaining to others.", "Ask about approved tutoring or peer mentoring opportunities.", "Find your state’s approved teacher preparation program list.", "Compare student teaching and credential requirements for two programs."]
            )
        case "Counselor":
            CareerRoadmapPlan(
                overview: "Counselors listen, help people identify goals and options, and support them through challenges. Duties and qualifications differ between school, career, and mental health counseling.",
                subjects: ["Psychology", "English and communication", "Statistics or research", "Health and social science"],
                projects: ["Practice active listening in everyday teamwork and reflect on respectful boundaries.", "Learn about helping professions through a school-approved career day or volunteer program.", "Explore how counselors protect privacy and connect people with qualified support."],
                pathways: ["Many professional counseling roles require a relevant master’s degree and supervised practice.", "School counselor credentials, mental health licenses, and career counseling requirements differ by role and location."],
                programsToResearch: ["Accredited counseling or school counseling programs that match the specialty you want.", "Your state licensing board’s education, supervised hours, exam, and scope-of-practice requirements."],
                timeline: [
                    .init(title: "High school", detail: "Explore psychology and social science while learning about boundaries and ethical support."),
                    .init(title: "Undergraduate study", detail: "Study psychology or a related field and learn which counseling specialty interests you."),
                    .init(title: "Graduate training", detail: "Complete a relevant master’s program, supervised fieldwork, and any required exams."),
                    .init(title: "Entering the career", detail: "Meet the credential or license rules for your specialty and work setting before practicing.")
                ],
                checklist: ["Compare school, career, and mental health counseling roles.", "Ask a school counselor how they prepared for the profession.", "Find your state board’s current requirements for one counseling specialty.", "List graduate programs that include supervised practicum experience."]
            )
        case "Writer":
            CareerRoadmapPlan(
                overview: "Writers research and shape ideas into stories, articles, scripts, books, marketing, or other work for a specific audience and purpose.",
                subjects: ["English and literature", "History or social science", "Theater, media, or art", "A subject you want to write about"],
                projects: ["Keep a regular writing habit and revise a piece after feedback.", "Write for a school publication, literary magazine, script, or community project.", "Practice researching sources and checking facts before publishing."],
                pathways: ["A degree in English, journalism, communications, or another subject can help, but requirements vary by writing role.", "A portfolio, subject knowledge, editing practice, and internships can be as important as a specific major."],
                programsToResearch: ["Writing, journalism, creative writing, and communications programs with workshops and student publications.", "Internships with reputable publishers, newsrooms, nonprofits, or organizations in a subject you enjoy."],
                timeline: [
                    .init(title: "High school", detail: "Write regularly, seek feedback, and publish through supervised school outlets."),
                    .init(title: "After graduation", detail: "Choose a writing-focused or subject-area program that supports practice and revision."),
                    .init(title: "Build a portfolio", detail: "Try several formats, complete internships, and learn to meet editorial deadlines."),
                    .init(title: "Entering the career", detail: "Pitch relevant work, apply to entry roles, or build freelance experience responsibly.")
                ],
                checklist: ["Start a folder for writing samples you are proud of.", "Revise one piece using feedback from a teacher or editor.", "Submit a piece to a school publication or writing contest.", "Research one writing path tied to a topic you care about."]
            )
        case "Technical Writer":
            CareerRoadmapPlan(
                overview: "Technical writers turn complex information into clear instructions, help content, manuals, and online documentation for specific users.",
                subjects: ["English and technical communication", "Computer science or engineering", "Science", "Visual design and research"],
                projects: ["Write a short how-to guide for a safe, familiar task and test whether someone can follow it.", "Add labeled screenshots or diagrams and revise for clarity and accessibility.", "Interview a knowledgeable person and check each technical detail before publishing."],
                pathways: ["Many roles prefer a bachelor’s degree in English, communications, journalism, or a technical subject.", "Experience with science or technology and samples of clear documentation are valuable."],
                programsToResearch: ["Technical communication, English, journalism, or STEM programs with editing and documentation projects.", "Internships with software, engineering, science, or healthcare teams; optional association credentials if employers value them."],
                timeline: [
                    .init(title: "High school", detail: "Practice explaining a process clearly and build subject knowledge in science or technology."),
                    .init(title: "After graduation", detail: "Choose a communication or technical degree path and keep writing for real users."),
                    .init(title: "Build experience", detail: "Create tested instructions, learn documentation tools, and seek a technical writing internship."),
                    .init(title: "Entering the career", detail: "Apply with before-and-after samples that show accuracy, structure, and user-focused writing.")
                ],
                checklist: ["Choose a simple process and write numbered instructions for it.", "Ask someone unfamiliar with the task to test your guide.", "Revise confusing steps and add diagrams where useful.", "Compare technical communication programs and local internships."]
            )
        default:
            CareerRoadmapPlan(
                overview: "Explore the day-to-day work and skills for this career by speaking with a counselor or someone working in the field.",
                subjects: ["English and communication", "Math", "A subject related to the field"],
                projects: ["Try a small project related to the career.", "Ask a teacher or counselor about a supervised way to learn more."],
                pathways: ["Compare college, trade, certification, and learn-while-working options that employers in the field recognize."],
                programsToResearch: ["Check current program and credential requirements with official schools and licensing organizations."],
                timeline: [
                    .init(title: "High school", detail: "Build relevant skills and try a supervised project."),
                    .init(title: "After graduation", detail: "Compare training routes and their costs, length, and entry requirements."),
                    .init(title: "Prepare", detail: "Complete training and gain experience through projects or supervised work."),
                    .init(title: "Entering the career", detail: "Confirm requirements and apply for entry-level opportunities.")
                ],
                checklist: ["Find an official career information source.", "Ask a counselor about relevant classes.", "Compare at least two training options."]
            )
        }
    }
}

struct CareerRoadmapView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var completedActions: Set<String> = []

    let careerTitle: String
    let careerDescription: String

    private let ink = Color(red: 0.10, green: 0.16, blue: 0.25)
    private let mutedInk = Color(red: 0.37, green: 0.43, blue: 0.51)
    private let canvas = Color(red: 0.96, green: 0.97, blue: 0.98)
    private let blue = Color(red: 0.20, green: 0.43, blue: 0.82)

    private var plan: CareerRoadmapPlan {
        CareerRoadmapPlan.sample(for: careerTitle)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                careerHeader
                roadmapSection(title: "What this career involves", icon: "briefcase") {
                    Text(plan.overview)
                        .font(.system(size: 15))
                        .lineSpacing(4)
                        .foregroundStyle(mutedInk)
                }
                roadmapSection(title: "High school classes", icon: "book") {
                    bulletList(plan.subjects)
                }
                roadmapSection(title: "Skills and projects to start now", icon: "hammer") {
                    bulletList(plan.projects)
                }
                roadmapSection(title: "Education and training paths", icon: "graduationcap") {
                    bulletList(plan.pathways)
                }
                roadmapSection(title: "Programs and credentials to research", icon: "magnifyingglass") {
                    bulletList(plan.programsToResearch)
                }
                timelineSection
                checklistSection
                verificationNote
            }
            .padding(.horizontal, 22)
            .padding(.top, 20)
            .padding(.bottom, 34)
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
                    Label("Recommendations", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                }
                .tint(blue)
            }
        }
        .toolbar(.visible, for: .navigationBar)
    }

    private var careerHeader: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text("YOUR CAREER ROADMAP")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1.3)
                .foregroundStyle(blue)

            Text(careerTitle)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tracking(-0.6)
                .fixedSize(horizontal: false, vertical: true)

            Text(careerDescription)
                .font(.system(size: 16))
                .lineSpacing(4)
                .foregroundStyle(mutedInk)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

    private func roadmapSection<Content: View>(
        title: String,
        icon: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 13) {
            Label(title, systemImage: icon)
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .foregroundStyle(ink)
            content()
        }
        .padding(17)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(ink.opacity(0.05), lineWidth: 1)
        }
    }

    private func bulletList(_ items: [String]) -> some View {
        VStack(alignment: .leading, spacing: 11) {
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 9) {
                    Circle()
                        .fill(blue)
                        .frame(width: 6, height: 6)
                        .padding(.top, 7)
                    Text(item)
                        .font(.system(size: 14))
                        .lineSpacing(3)
                        .foregroundStyle(mutedInk)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    private var timelineSection: some View {
        roadmapSection(title: "Step-by-step timeline", icon: "calendar") {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(Array(plan.timeline.enumerated()), id: \.element.id) { index, milestone in
                    HStack(alignment: .top, spacing: 12) {
                        VStack(spacing: 0) {
                            Circle()
                                .fill(blue)
                                .frame(width: 10, height: 10)
                            if index < plan.timeline.count - 1 {
                                Rectangle()
                                    .fill(blue.opacity(0.2))
                                    .frame(width: 2, height: 64)
                            }
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(milestone.title)
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundStyle(ink)
                            Text(milestone.detail)
                                .font(.system(size: 14))
                                .lineSpacing(3)
                                .foregroundStyle(mutedInk)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.bottom, 17)
                    }
                }
            }
        }
    }

    private var checklistSection: some View {
        roadmapSection(title: "Your action checklist", icon: "checklist") {
            VStack(alignment: .leading, spacing: 13) {
                ForEach(plan.checklist, id: \.self) { action in
                    Button {
                        if completedActions.contains(action) {
                            completedActions.remove(action)
                        } else {
                            completedActions.insert(action)
                        }
                    } label: {
                        HStack(alignment: .top, spacing: 11) {
                            Image(systemName: completedActions.contains(action) ? "checkmark.circle.fill" : "circle")
                                .font(.system(size: 21))
                                .foregroundStyle(completedActions.contains(action) ? blue : mutedInk.opacity(0.6))
                            Text(action)
                                .font(.system(size: 14))
                                .lineSpacing(3)
                                .foregroundStyle(completedActions.contains(action) ? mutedInk : ink)
                                .strikethrough(completedActions.contains(action))
                                .multilineTextAlignment(.leading)
                            Spacer(minLength: 0)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel(action)
                    .accessibilityAddTraits(completedActions.contains(action) ? .isSelected : [])
                }
            }
        }
    }

    private var verificationNote: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "info.circle.fill")
                .foregroundStyle(blue)
            Text("This roadmap is a starting point based on sample information. Education, certification, and licensing requirements can vary by location and change over time. Verify details with official schools, program accreditors, and licensing organizations before making decisions.")
                .font(.system(size: 13))
                .lineSpacing(3)
                .foregroundStyle(mutedInk)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.90, green: 0.94, blue: 1.0), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    NavigationStack {
        CareerRoadmapView(
            careerTitle: "Software Developer",
            careerDescription: "Build and maintain apps, websites, or other software that solves problems for people and organizations."
        )
    }
}
