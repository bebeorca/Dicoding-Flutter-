import 'dart:math';

class ContributorList {
  String name, jobDesk, description, phoneNumber, email, profilePicture, slug;
  double rating;
  int projects;

  List<String> projectImage;

  ContributorList(
      {required this.name,
      required this.jobDesk,
      required this.description,
      required this.phoneNumber,
      required this.email,
      required this.profilePicture,
      required this.projectImage,
      required this.slug,
      required this.rating,
      required this.projects});
}

var contributorsList = [
  ContributorList(
      name: "Palmer Benfield",
      jobDesk: "AI Services",
      slug: "ai_services",
      description: "Greetings! I'm Palmer Benfield, a passionate AI developer.",
      phoneNumber: "9720",
      email: "benfield.pal@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/42.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/014/174/791/large_2x/artificial-inteligence-robot-profile-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/014/070/417/non_2x/artificial-inteligence-technology-profile-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/001/968/714/non_2x/artifical-intelligence-icons-concept-cartoon-free-vector.jpg"
      ],
      rating: 4.5,
      projects: 3),
  ContributorList(
      name: "William Mortensen",
      jobDesk: "AI Services",
      slug: "ai_services",
      description: "Greetings! I'm William Mortensen, AI developer.",
      phoneNumber: "72712222",
      email: "william.mortensen@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/0.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/014/176/565/non_2x/artificial-inteligence-robot-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/001/968/797/non_2x/artifical-intelligence-icons-concept-cartoon-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/014/175/402/non_2x/ai-chip-processor-tech-vector.jpg"
      ],
      rating: 4.2,
      projects: 5),
  ContributorList(
      name: "Latife Solmaz",
      jobDesk: "Writing And Translation",
      slug: "writing_and_translation",
      description: "Greetings! I'm Latife Solmaz.",
      phoneNumber: "(179)-518-2132",
      email: "latife.solmaz@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/34.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/thumbnails/008/079/331/small_2x/book-with-speech-cloud-on-neon-podium-3d-illustration-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/006/570/687/non_2x/creative-search-file-document-3d-design-icon-on-color-purple-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/007/503/114/non_2x/3d-folder-and-paper-for-management-file-document-efficient-work-on-project-plan-concept-document-cartoon-style-minimal-folder-with-files-icon-3d-render-on-isolated-pink-pastel-background-free-vector.jpg"
      ],
      rating: 4.7,
      projects: 3),
  ContributorList(
      name: "Gorana Orlić",
      jobDesk: "Finance And Accounting",
      slug: "finance_and_accounting",
      description: "Greetings! I'm Gorana Orlić.",
      phoneNumber: "019-7427-879",
      email: "gorana.orlic@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/8.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/005/085/276/non_2x/investing-in-the-stock-market-is-risky-but-if-managed-and-predicted-correctly-it-will-have-a-high-growth-rate-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/002/792/552/non_2x/design-of-increase-investment-in-financial-saving-sector-future-chart-with-up-arrow-financial-literacy-illustration-can-be-for-websites-posters-banners-mobile-apps-web-social-media-ads-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/001/944/170/non_2x/man-invests-and-made-a-profit-free-vector.jpg"
      ],
      rating: 4.9,
      projects: 3),
  ContributorList(
      name: "Berry Nuen",
      jobDesk: "Mobile Development",
      slug: "mobile_development",
      description: "Hello! my name is Berry!",
      phoneNumber: "(099) Y88-7717",
      email: "nuen.berry@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/9.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/001/993/379/non_2x/app-development-concept-illustration-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/005/007/222/non_2x/mobile-layout-icon-design-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/002/209/482/non_2x/mobile-app-development-illustration-free-vector.jpg"
      ],
      rating: 4.7,
      projects: 4),
  ContributorList(
      name: "Čedomir Silić",
      jobDesk: "Web Development",
      slug: "web_development",
      description: "Hello! I'm Silić",
      phoneNumber: "030-9400-108",
      email: "cedomir.silic@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/49.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/004/579/151/non_2x/the-web-developer-team-is-building-a-smartphone-app-in-flat-design-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/005/005/080/non_2x/web-layout-programming-language-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/004/578/787/large_2x/install-web-wordpress-templates-free-vector.jpg"
      ],
      rating: 4.8,
      projects: 2),
  ContributorList(
      name: "Cléo Giraud",
      jobDesk: "Web Development",
      slug: "web_development",
      description: "Good to see you! I'm Cleo!",
      phoneNumber: "071-901-4168",
      email: "cleo.giraud@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/male/48.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/007/495/983/non_2x/the-concept-of-laptop-coding-or-html-programming-php-web-developer-design-programming-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/001/311/814/non_2x/programming-and-coding-concept-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/005/151/164/non_2x/programer-learning-programming-languages-by-computer-laptop-on-website-and-tutorial-channel-free-vector.jpg"
      ],
      rating: 4.6,
      projects: 6),
  ContributorList(
      name: "Sofie Mortensen",
      jobDesk: "Web Development",
      slug: "web_development",
      description: "Hi! I'm Sofie Morotensen, an web developer.",
      phoneNumber: "19748472",
      email: "sofie.mortensen@gmail.com",
      profilePicture:
          "https://xsgames.co/randomusers/assets/avatars/female/34.jpg",
      projectImage: [
        "https://static.vecteezy.com/system/resources/previews/001/991/605/non_2x/online-it-courses-concept-students-learn-programming-languages-with-teacher-on-screen-distance-education-internet-learning-computer-programming-illustration-for-web-banners-landing-page-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/001/991/729/non_2x/modern-flat-design-illustration-accounting-courses-landing-page-and-web-banner-template-finance-education-training-digital-education-distance-education-bookkeeping-money-calculation-free-vector.jpg",
        "https://static.vecteezy.com/system/resources/previews/011/844/824/non_2x/php-and-development-flat-style-illustration-design-free-vector.jpg"
      ],
      rating: 4.7,
      projects: 3),
];
