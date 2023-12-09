import 'package:proyek_akhir_dicoding/model/contributorList.dart';

class ContributorModel {
  String jobDeskCategory, thumbnail, slug;
  int numberOfTalent;

  ContributorModel(
      {required this.jobDeskCategory,
      required this.numberOfTalent,
      required this.thumbnail,
      required this.slug});
}

var contributorModelList = [
  ContributorModel(
      jobDeskCategory: "AI Services",
      slug: "ai_services",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "ai_services")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/004/244/700/non_2x/illustration-of-artificial-intelligence-develops-machine-learning-programs-and-analyzes-input-data-design-for-landing-page-web-website-mobile-apps-poster-flyer-ui-ux-free-vector.jpg"),
  ContributorModel(
      jobDeskCategory: "Mobile Development",
      slug: "mobile_development",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "mobile_development")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/002/136/381/large_2x/mobile-application-development-free-vector.jpg"),
  ContributorModel(
      jobDeskCategory: "Web Development",
      slug: "web_development",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "web_development")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/001/879/576/large_2x/designing-program-web-apps-on-monitor-screen-or-desktop-teamwork-in-developing-programming-debugging-development-process-illustration-for-website-homepage-header-landing-web-page-template-free-vector.jpg"),
  ContributorModel(
      jobDeskCategory: "Writing and Translation",
      slug: "writing_and_translation",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "writing_and_translation")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/001/829/852/non_2x/people-give-review-and-fill-out-questionnaires-survey-or-exam-for-service-or-product-provide-feedback-with-emoticon-from-customer-experience-illustration-for-web-landing-page-banner-mobile-free-vector.jpg"),
  ContributorModel(
      jobDeskCategory: "Sales and Marketing",
      slug: "sales_and_marketing",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "sales_and_marketing")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/001/871/244/non_2x/illustration-for-online-marketplace-with-a-shop-or-stall-selling-booths-search-and-compare-items-in-the-marketplace-can-be-used-for-landing-page-website-web-mobile-apps-posters-flyers-free-vector.jpg"),
  ContributorModel(
      jobDeskCategory: "Finance and Accounting",
      slug: "finance_and_accounting",
      numberOfTalent: contributorsList
          .where((element) => element.slug == "finance_and_accounting")
          .length,
      thumbnail:
          "https://static.vecteezy.com/system/resources/previews/001/879/515/non_2x/refer-a-friend-for-affiliate-and-referral-program-promotion-and-marketing-with-mobile-ads-and-seo-smartphone-technology-to-connect-people-illustration-for-business-card-banner-brochure-flyer-free-vector.jpg"),
];
