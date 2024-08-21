import 'package:sakhi_app/common/widgets/button_bar_view.dart';
import 'package:sakhi_app/feature/home/view/checkout_completed_view.dart';
import 'package:sakhi_app/feature/order/view/details_order_view.dart';

import 'package:get/get.dart';
import 'package:sakhi_app/feature/profile/view/FAQs_view.dart';
import 'package:sakhi_app/feature/profile/view/about_us_view.dart';
import 'package:sakhi_app/feature/profile/view/contact_us_view.dart';
import 'package:sakhi_app/feature/profile/view/profile_view.dart';
import 'package:sakhi_app/feature/profile/view/terms_and_condition.dart';
import 'package:sakhi_app/feature/signin/view/otp_view.dart';

import '../../feature/home/view/view_all_product_view.dart';
import '../../feature/signin/view/sign_in_view.dart';
import '../../feature/splash/view/splash_view.dart';
import '../binding/button_bar_binding.dart';
import '../binding/splash_binding.dart';



class AppUserRoutes {
  static const homeView = UserRoutes.homeView;
  static const splashView = UserRoutes.splashView;
  static const signInView = UserRoutes.signInView;

  static final routes = [
    GetPage(
      name: UserRoutes.splashView,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: UserRoutes.signInView,
      page: () => SignInView(),
    ),
    GetPage(
      name: UserRoutes.otpView,
      page: () => OTPView(),
    ),
    GetPage(
      name: UserRoutes.homeView,
      page: () => ButtonBarView(),
      binding: ButtonBarBinding(),
    ),
    GetPage(
      name: UserRoutes.detailsOrderView,
      page: () => DetailsOrderView(),

    ),
    GetPage(
      name: UserRoutes.viewAllProductView,
      page: () => ViewAllProductView(),
    ),

    GetPage(
      name: UserRoutes.checkoutCompletedView,
      page: () => CheckoutCompletedView(),
    ),
    GetPage(
      name: UserRoutes.profileView,
      page: () => ProfileView(),
    ),
    GetPage(
      name: UserRoutes.aboutUsView,
      page: () => AboutUsView(),
    ),
    GetPage(
      name: UserRoutes.termsAndCondition,
      page: () => TermsAndConditionView(),
    ),
    GetPage(
      name: UserRoutes.faqsView,
      page: () => FAQsView(),
    ),
    GetPage(
      name: UserRoutes.contactUsView,
      page: () => ContactUsView(),
    ),
  ];
}

class UserRoutes {
  static const splashView = '/splash_view';
  static const signInView = '/sign_in_view';
  static const otpView = '/otp_view';
  static const homeView = '/home_view';
  static const profileView = '/profile_view';
  static const aboutUsView = '/about_us_view';
  static const termsAndCondition = '/terms_and_condition';
  static const faqsView = '/faqs_view';
  static const contactUsView = '/contact_us_view';

  static const orderView = '/order_view';
  static const viewAllProductView = '/view_all_product_view';
  static const detailsOrderView = '/details_order_view';
  static const checkoutCompletedView = '/checkout_completed_view';
}
