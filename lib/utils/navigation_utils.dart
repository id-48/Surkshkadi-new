import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_information_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_information_web_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/assets_web_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/bank_life_insurance_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/bank_savings_accounts_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_APY_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_EPF_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_KVP_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_NPS_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/government_ppf_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/immovable_property_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/investments_demat_account_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/miscellaneous_company_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/personal_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/personal_vehicle_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/utility_electricity_screen.dart';
import 'package:surakshakadi/ui/Screens/Assets_Details_Screen/components/utility_screen.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/check_your_information_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/Check_Your_Information_Screen/check_your_information_web_screen.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/components/components.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/kyc_identity_screen.dart';
import 'package:surakshakadi/ui/Screens/Kyc_Screen/kyc_screen.dart';
import 'package:surakshakadi/ui/Screens/Plan_Screen/plan_web_screen.dart';
import 'package:surakshakadi/ui/Screens/Signup_Screen/otp_verification.dart';
import 'package:surakshakadi/ui/Screens/Signup_Screen/sign_in.dart';
import 'package:surakshakadi/ui/Screens/Splash_Screen/common_screen/commonpage.dart';
import 'package:surakshakadi/ui/Screens/Splash_Screen/splash_screen.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/kyc_chatbot_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/chatbot_screen/plan_chatbot_screen.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/confirmation_plan_screen.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/confirmation_specific_screen.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/payment_confirmation_plan_web_screen.dart';
import 'package:surakshakadi/ui/Screens/confirmation_Screen/payment_confirmation_specific_web_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/constant/admin_Web_Clients.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/partner_with_web_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/register_web_screen.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/start_partner_with_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/add_information_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/add_information_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/choose_assets_mobile_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/Components/choose_assets_web_screen.dart';
import 'package:surakshakadi/ui/Screens/dashboard/dashboard_web_screen.dart';
import 'package:surakshakadi/ui/Screens/record_video_screen/record_a_video_screen.dart';
import 'package:surakshakadi/ui/Screens/will_review_screen/will_review_screen.dart';
import 'package:surakshakadi/widgets/custom_bottomnavigationbar.dart';

import '../widgets/custom_drawer.dart';
import 'constants/navigation_route_constants.dart';
import 'constants/navigations_key_constant.dart';

class NavigationUtils {
  GlobalKey<NavigatorState> globalStateKey = GlobalKey();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic>? args =
        settings.arguments as Map<String, dynamic>?;

    // final isDocument = settings.name?.contains(routeDocuments) ?? false;
    // if (isDocument) {
    //   // http://192.168.1.10:8080/#/documents/24_95e550da-3ab2-44aa-a0ec-17559b3f93ed
    //   String? code = settings.name?.substring(
    //       settings.name!.lastIndexOf("/") + 1, settings.name?.length);
    //   return CustomRoute(
    //     settings: RouteSettings(name: routeDocuments + '/' + code!),
    //     builder: (_) => Documents(
    //       code: code,
    //     ),
    //   );
    // }

    // if (kIsWeb &&
    //     !authenticatedRoutes(settings.name) &&
    //     getString(prefToken) == '') {
    //   return CustomRoute(
    //     ///TODO Change route with login screen
    //     settings: const RouteSettings(name: routeHome),
    //     builder: (_) => const SplashScreen(),
    //   );
    // }

    switch (settings.name) {
      case routeSplash:
        return CustomRoute(
            settings: const RouteSettings(name: routeSplash),
            builder: (_) => const SplashScreen());
      case routeCommonepagee:
        return CustomRoute(
            settings: const RouteSettings(name: routeCommonepagee),
            builder: (_) => Commonpagee());
      case routeSignin:
        return CustomRoute(
            settings: const RouteSettings(name: routeSignin),
            builder: (_) => Sign_in());
      case routeOtpVerification:
        return CustomRoute(
            settings: const RouteSettings(name: routeOtpVerification),
            builder: (_) => OTP_Verification(userId: args![navUserId],userType: args[navUserType],));

      case routeCustomDrawer:
        return CustomRoute(
            settings: const RouteSettings(name: routeCustomDrawer),
            builder: (_) => Custom_drawer());

      case routeCustomBottomNavigationBar:
        return CustomRoute(
            settings:
                const RouteSettings(name: routeCustomBottomNavigationBar),
            builder: (_) => Custom_BottomNavigationBar(index: args?[navIndex] ?? 0,));

      case routeChooseAssetMobile:
        return CustomRoute(
            settings:
            const RouteSettings(name: routeChooseAssetMobile),
            builder: (_) => ChooseAssetMobile(
              dashboardResponse: args?[navDashboardResponse],
              specificAssets: args?[navSpecificAssets],
              messagesList: args?[navMessagesList],
              selectedPlan: args?[navSelectedPlan],
            ));

      case routePlanChatBotMobile:
        return CustomRoute(
            settings:
            const RouteSettings(name: routePlanChatBotMobile),
            builder: (_) => PlanChatBotMobile(selectedPlanCB: args?[navSelectedPlanCB],));
        
      case routeAddInformationScreen:
        return CustomRoute(
            settings: const RouteSettings(name: routeAddInformationScreen),
            builder: (_) => AddInformationScreen(singleChooseAssetsAI: args?[navSingleChooseAssetsAI],));


      case routeKycScreen:
        return CustomRoute(
            settings: const RouteSettings(name: routeKycScreen),
            builder: (_) => KYCScreen());

      case routeCheckYourInformation:
        return CustomRoute(
            settings: const RouteSettings(name: routeCheckYourInformation),
            builder: (_) => CheckyourInformation());

      case routeKycIdentiyScreen:
        return CustomRoute(
            settings: const RouteSettings(name: routeKycIdentiyScreen),
            builder: (_) => KYCIdentity());
      case routeAssetScreen:
        return CustomRoute(
            settings: const RouteSettings(name: routeAssetScreen),
            builder: (_) => AssetsMobile());
      case routeConfirmationPlan:
        return CustomRoute(
            settings:  RouteSettings(name: routeConfirmationPlan),
            builder: (_) => ConfirmationPlanScreen());

      case routeAssetsInformation:
        return CustomRoute(
            settings: const RouteSettings(name: routeAssetsInformation),
            builder: (_) => AssetsInformation(selectedindex: args![navSelectedindex],dattaa: args[navDattaa],));

      case routeConfirmationSpecific:
        return CustomRoute(
            settings: const RouteSettings(name: routeConfirmationSpecific),
            builder: (_) => ConfirmationSpecific());

      case routeWillReview:
        return CustomRoute(
            settings: const RouteSettings(name: routeWillReview),
            builder: (_) => WillReview());

      case routeRecordAVideo:
        return CustomRoute(
            settings: const RouteSettings(name: routeRecordAVideo),
            builder: (_) => RecordAVideo(videoPictureRV: args?[navVideoPictureRV],videoRecord: args?[navVideoRecord],videoBase64: args?[navVideoBase64],));

      case routeKYCChatBotMobile:
        return CustomRoute(
            settings: const RouteSettings(name: routeKYCChatBotMobile),
            builder: (_) => KYCChatBotMobile());

      case routeDigiLockerWebView:
        return CustomRoute(
            settings: const RouteSettings(name: routeDigiLockerWebView),
            builder: (_) => DigiLockerWebView());

      case routeBankSavingsAccounts:
        return CustomRoute(
            settings: const RouteSettings(name: routeBankSavingsAccounts),
            builder: (_) => BankSavingsAccounts());

      case routeGovernmentAPY:
        return CustomRoute(
            settings: const RouteSettings(name: routeGovernmentAPY),
            builder: (_) => GovernmentAPY());

      case routeGovernmentEPF:
        return CustomRoute(
            settings: const RouteSettings(name: routeGovernmentEPF),
            builder: (_) => GovernmentEPF());

      case routeGovernmentKVP:
        return CustomRoute(
            settings: const RouteSettings(name: routeGovernmentKVP),
            builder: (_) => GovernmentKVP());

      case routeGovernmentNPS:
        return CustomRoute(
            settings: const RouteSettings(name: routeGovernmentNPS),
            builder: (_) => GovernmentNPS());

      case routeGovernmentPPF:
        return CustomRoute(
            settings: const RouteSettings(name: routeGovernmentPPF),
            builder: (_) => GovernmentPPF());

      case routeImmovableProperty:
        return CustomRoute(
            settings: const RouteSettings(name: routeImmovableProperty),
            builder: (_) => ImmovableProperty());

      case routeBankLifeInsurance:
        return CustomRoute(
            settings: const RouteSettings(name: routeBankLifeInsurance),
            builder: (_) => BankLifeInsurance());

      case routeInvestmentsDematAccount:
        return CustomRoute(
            settings: const RouteSettings(name: routeInvestmentsDematAccount),
            builder: (_) => InvestmentsDematAccount());

      case routeMiscellaneousCompany:
        return CustomRoute(
            settings: const RouteSettings(name: routeMiscellaneousCompany),
            builder: (_) => MiscellaneousCompany());

      case routePersonal:
        return CustomRoute(
            settings: const RouteSettings(name: routePersonal),
            builder: (_) => Personal());

      case routePersonalVehicle:
        return CustomRoute(
            settings: const RouteSettings(name: routePersonalVehicle),
            builder: (_) => PersonalVehicle());

      case routeUtilityElectricity:
        return CustomRoute(
            settings: const RouteSettings(name: routeUtilityElectricity),
            builder: (_) => UtilityElectricity());

      case routeUtility:
        return CustomRoute(
            settings: const RouteSettings(name: routeUtility),
            builder: (_) => Utility());





        ///                               Web   Route

      case routeDashboardWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeDashboardWeb),
            builder: (_) => DashBoardWeb());

      case routePlansWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routePlansWeb),
            builder: (_) => PlansWeb());

      case routeChooseAssetsWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeChooseAssetsWeb),
            builder: (_) => ChooseAssetsWeb(dashboardResponseWeb: args?[navDashboardResponseWeb],routeCA: args?[navRouteCA],));

      case routePaymentConfirPlanWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routePaymentConfirPlanWeb),
            builder: (_) => PaymentConfirPlanWeb());

      case routeCheckYourInfoWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeCheckYourInfoWeb),
            builder: (_) => CheckYourInfoWeb());

      case routePartnerWithWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routePartnerWithWeb),
            builder: (_) => PartnerWithWeb());


      case routeAssetsWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeAssetsWeb),
            builder: (_) => AssetsWeb());

      case routeAssetsInformationWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeAssetsInformationWeb),
            builder: (_) => AssetsInformationWeb(selectindex: args?[navSelectIndex],selectdattaa: args?[navSelectDattaa],));


      case routeRegisterWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeRegisterWeb),
            builder: (_) => RegisterWeb());

      case routeAddInfoWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeAddInfoWeb),
            builder: (_) => AddInfoWeb());

      case routePaymentConfoSpeciWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routePaymentConfoSpeciWeb),
            builder: (_) => PaymentConfoSpeciWeb());

      case routeStartPartnerWithWeb:
        return CustomRoute(
            settings: const RouteSettings(name: routeStartPartnerWithWeb),
            builder: (_) => StartPartnerWithWeb());

      case routeAdminDashboard:
        return CustomRoute(
            settings: const RouteSettings(name: routeAdminDashboard),
            builder: (_) => AdminDashboard());
      case routeAdminWebClient:
        return CustomRoute(
            settings: const RouteSettings(name: routeAdminWebClient),
            builder: (_) => AdminWebClients());

      default:
        return _errorRoute(" Unimplemented...");
    }
  }

  Route<dynamic> _errorRoute(String message) {
    return CustomRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: Center(child: Text(message)));
    });
  }

  void pushReplacement(String routeName, {Object? arguments}) {
    globalStateKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? push(String routeName, {Object? arguments}) {
    return globalStateKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void pop({dynamic args}) {
    globalStateKey.currentState?.pop(args);
  }

  Future<dynamic>? pushAndRemoveUntil(String routeName, {Object? arguments}) {
    return globalStateKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  Future<dynamic>? pushAndRemoveUntilRoute(String routeName,

      ///TODO Change it to home screen
      {Object? arguments,
      String? lastRoute = routeSplash}) {
    // {Object? arguments, String? lastRoute = routeHome}) {
    return globalStateKey.currentState?.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(lastRoute ?? "/"),
        arguments: arguments);
  }

  bool authenticatedRoutes(routeName) {
    switch (routeName) {
      // case routeLoginOtp:
      //   return true;
      // case routeLoginWithPassword:
      //   return true;
      // case routeCreateNewPassword:
      //   return true;
      // case routeOtpVerification:
      //   return true;
      case routeSplash:
        return true;
      // case routeDocuments:
      //   return true;
      default:
        return false;
    }
  }
}

// Custom Page Route to support fade in transition for web and default Material route for mobile
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute(
      {required Widget Function(BuildContext context) builder,
      RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (!kIsWeb) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Duration get transitionDuration =>
      !kIsWeb ? super.transitionDuration : const Duration(milliseconds: 100);
}
