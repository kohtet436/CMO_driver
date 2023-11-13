import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:octo_image/octo_image.dart';

import '../../../core/widget/custom_text_widgets.dart';
import '../../../routes/app_pages.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/values/assets_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../base_route_details_page/bindings/base_route_details_page_binding.dart';
import '../../base_route_details_page/views/base_route_details_page_view.dart';
import '../../home/views/home_view.dart';
import '../../leaves_page/bindings/leaves_page_binding.dart';
import '../../leaves_page/views/leaves_page_view.dart';
import '../../profile_detail_page/bindings/profile_detail_page_binding.dart';
import '../../profile_detail_page/views/profile_detail_page_view.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../home/bindings/home_binding.dart';
import '../../settings_page/bindings/settings_page_binding.dart';
import '../../settings_page/views/settings_page_view.dart';
import '../controllers/navigation_page_controller.dart';

class NavigationPageView extends GetView<NavigationPageController> {
  const NavigationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtil.defaultAppBar(title: AppStrings.appName),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Obx(() => controller.isLoading.value
                          ? const DrawerHeader(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                color: ColorManager.secondaryColor,
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImageAssets.drawerHeaderBackground,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              currentAccountPicture: OctoImage(
                                width: AppSize.drawerImageSize,
                                height: AppSize.drawerImageSize,
                                imageBuilder:
                                    OctoImageTransformer.circleAvatar(),
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  controller.driver.value!.photoPath,
                                ),
                                placeholderBuilder:
                                    OctoPlaceholder.circularProgressIndicator(),
                                errorBuilder: (context, error, stackTrace) =>
                                    const Image(
                                  image: AssetImage(
                                      ImageAssets.employeePhotoPlaceHolder),
                                ),
                              ),
                              accountName: Text(
                                controller.driver.value!.name,
                                style: getBoldStyle(color: ColorManager.white),
                              ),
                              accountEmail: Text(
                                '#${controller.driver.value!.vehicleEmployeeNumber}',
                                style: getDrawerStyle(
                                  color: ColorManager.primaryDarkColor,
                                ),
                              ),
                            )
                      // DrawerProfile(driver: controller.driver.value!),
                      ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.home,
                    ),
                    onTap: () {
                      controller.changePage(PageIndex.HOME);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.profile,
                    ),
                    onTap: () {
                      controller.changePage(PageIndex.PROFILE);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.information,
                    ),
                    onTap: () {
                      controller.changePage(PageIndex.INFORMATION);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.outbond,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.leaveManagement,
                    ),
                    onTap: () {
                      controller.changePage(PageIndex.LEAVE);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.settings,
                    ),
                    onTap: () {
                      controller.changePage(PageIndex.SETTING);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.power_settings_new,
                      color: ColorManager.black,
                    ),
                    title: const DrawerText(
                      text: AppStrings.logOut,
                    ),
                    onTap: () {
                      Get.offAllNamed(Routes.LOG_IN_PAGE);
                    },
                  ),
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: WidgetUtil.defaultAllPadding(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Version: ${controller.appVersion.value}',
                    style: getDrawerStyle(
                      color: ColorManager.textOnPrimary,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => _getPage(controller.pageIndex.value),
      ),
    );
  }

  Widget _getPage(PageIndex pageIndex) {
    switch (pageIndex) {
      case PageIndex.HOME:
        HomeBinding().dependencies();
        return const HomeView();
      case PageIndex.PROFILE:
        ProfileDetailPageBinding().dependencies();
        return const ProfileDetailPageView();
      case PageIndex.INFORMATION:
        BaseRouteDetailsPageBinding().dependencies();
        return const BaseRouteDetailsPageView();
      case PageIndex.LEAVE:
        LeavesPageBinding().dependencies();
        return const LeavesPageView();
      case PageIndex.SETTING:
        SettingsPageBinding().dependencies();
        return const SettingsPageView();
      case PageIndex.LOG_OUT:
        GetStorage().remove('baseRouteId');
        return const HomeView();
    }
  }
}
