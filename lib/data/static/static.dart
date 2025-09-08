import '../model/onboarding_model.dart';
import '../../core/constant/app_texts.dart';
import '../../core/constant/app_images.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: AppTexts.onBoardingTitle1,
    body: AppTexts.onBoardingSubTitle1,
    image: AppImages.onboarding1Animation,
  ),
  OnboardingModel(
    title: AppTexts.onBoardingTitle2,
    body: AppTexts.onBoardingSubTitle2,
    image: AppImages.onboarding2Animation,
  ),
  OnboardingModel(
    title: AppTexts.onBoardingTitle3,
    body: AppTexts.onBoardingSubTitle3,
    image: AppImages.onboarding3Animation,
  ),
];

final List<Map<String, dynamic>> categoryList = [
  {
    "title_en": AppTexts.haircut_en,
    "title_ar": AppTexts.haircut_ar,
    "title_fr": AppTexts.haircut_fr,
    "image": AppImages.haircut,
  },
  {
    "title_en": AppTexts.beard_trim_en,
    "title_ar": AppTexts.beard_trim_ar,
    "title_fr": AppTexts.beard_trim_fr,
    "image": AppImages.beardTrimming,
  },
  {
    "title_en": AppTexts.hair_color_en,
    "title_ar": AppTexts.hair_color_ar,
    "title_fr": AppTexts.hair_color_fr,
    "image": AppImages.hairColoring,
  },
  {
    "title_en": AppTexts.facial_en,
    "title_ar": AppTexts.facial_ar,
    "title_fr": AppTexts.facial_fr,
    "image": AppImages.facialTreatment,
  },
  {
    "title_en": AppTexts.black_mask_en,
    "title_ar": AppTexts.black_mask_ar,
    "title_fr": AppTexts.black_mask_fr,
    "image": AppImages.blackMask,
  },
  {
    "title_en": AppTexts.kids_haircut_en,
    "title_ar": AppTexts.kids_haircut_ar,
    "title_fr": AppTexts.kids_haircut_fr,
    "image": AppImages.kidsHaircut,
  },
  {
    "title_en": AppTexts.styling_en,
    "title_ar": AppTexts.styling_ar,
    "title_fr": AppTexts.styling_fr,
    "image": AppImages.hairStyling,
  },
  {
    "title_en": AppTexts.keratin_en,
    "title_ar": AppTexts.keratin_ar,
    "title_fr": AppTexts.keratin_fr,
    "image": AppImages.keratinTreatment,
  },
  {
    "title_en": AppTexts.scalp_care_en,
    "title_ar": AppTexts.scalp_care_ar,
    "title_fr": AppTexts.scalp_care_fr,
    "image": AppImages.scalpCare,
  },
  {
    "title_en": AppTexts.waxing_en,
    "title_ar": AppTexts.waxing_ar,
    "title_fr": AppTexts.waxing_fr,
    "image": AppImages.waxing,
  },
  {
    "title_en": AppTexts.hair_extensions_en,
    "title_ar": AppTexts.hair_extensions_ar,
    "title_fr": AppTexts.hair_extensions_fr,
    "image": AppImages.hairExtensions,
  },
  {
    "title_en": AppTexts.massage_chair_en,
    "title_ar": AppTexts.massage_chair_ar,
    "title_fr": AppTexts.massage_chair_fr,
    "image": AppImages.massageChair,
  },
  {
    "title_en": AppTexts.package_premium_en,
    "title_ar": AppTexts.package_premium_ar,
    "title_fr": AppTexts.package_premium_fr,
    "image": AppImages.premiumPackage,
  },
];
