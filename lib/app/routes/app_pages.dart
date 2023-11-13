import 'package:get/get.dart';

import '../modules/base_route_details_page/bindings/base_route_details_page_binding.dart';
import '../modules/base_route_details_page/views/base_route_details_page_view.dart';
import '../modules/change_password_page/bindings/change_password_page_binding.dart';
import '../modules/change_password_page/views/change_password_page_view.dart';
import '../modules/daily_route_ferry_stop_list_page/bindings/daily_route_ferry_stop_list_page_binding.dart';
import '../modules/daily_route_ferry_stop_list_page/views/daily_route_ferry_stop_list_page_view.dart';
import '../modules/employee_attendance_list_page/bindings/employee_attendance_list_page_binding.dart';
import '../modules/employee_attendance_list_page/views/employee_attendance_list_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leave_request_page/bindings/leave_request_page_binding.dart';
import '../modules/leave_request_page/views/leave_request_page_view.dart';
import '../modules/leaves_page/bindings/leaves_page_binding.dart';
import '../modules/leaves_page/views/leaves_page_view.dart';
import '../modules/log_in_page/bindings/log_in_page_binding.dart';
import '../modules/log_in_page/views/log_in_page_view.dart';
import '../modules/navigation-page/bindings/navigation_page_binding.dart';
import '../modules/navigation-page/views/navigation_page_view.dart';
import '../modules/profile_detail_page/bindings/profile_detail_page_binding.dart';
import '../modules/profile_detail_page/views/profile_detail_page_view.dart';
import '../modules/settings_page/bindings/settings_page_binding.dart';
import '../modules/settings_page/views/settings_page_view.dart';
import '../modules/splash_page/bindings/splash_page_binding.dart';
import '../modules/splash_page/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN_PAGE,
      page: () => LogInPageView(),
      binding: LogInPageBinding(),
    ),
    GetPage(
      name: _Paths.BASE_ROUTE_DETAILS_PAGE,
      page: () => const BaseRouteDetailsPageView(),
      binding: BaseRouteDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_PAGE,
      page: () => const NavigationPageView(),
      binding: NavigationPageBinding(),
    ),
    GetPage(
        name: _Paths.PROFILFE_DETAIL_PAGE,
        page: () => const ProfileDetailPageView(),
        binding: ProfileDetailPageBinding()),
    GetPage(
      name: _Paths.LEAVE_REQUEST_PAGE,
      page: () => const LeaveRequestPageView(),
      binding: LeaveRequestPageBinding(),
    ),
    GetPage(
      name: _Paths.LEAVES_PAGE,
      page: () => const LeavesPageView(),
      binding: LeavesPageBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_PAGE,
      page: () => const ChangePasswordPageView(),
      binding: ChangePasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_PAGE,
      page: () => const SettingsPageView(),
      binding: SettingsPageBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_ATTENDANCE_LIST_PAGE,
      page: () => const EmployeeAttendanceListPageView(),
      binding: EmployeeAttendanceListPageBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_ROUTE_FERRY_STOP_LIST_PAGE,
      page: () => const DailyRouteFerryStopListPageView(),
      binding: DailyRouteFerryStopListPageBinding(),
    ),
  ];
}
