import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../../core/util/widget_util.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/widget/base_route_ferry_stop_list_card.dart';
import '../../../core/widget/custom_text_widgets.dart';
import '../../../core/widget/vehicle_info_card.dart';
import '../controllers/base_route_details_page_controller.dart';
import '../../../core/widget/base_route_employee_list_card.dart';

class BaseRouteDetailsPageView extends GetView<BaseRouteDetailsPageController> {
  const BaseRouteDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Container(
                          padding: WidgetUtil.defaultAllPadding(),
                          child: Column(
                            children: [
                              Card(
                                color: Colors.transparent,
                                child: SizedBox(
                                  height: WidgetUtil.vehiclePhotoHeight(),
                                  child: CachedNetworkImage(
                                    imageUrl: controller
                                        .baseRoute.value!.vehicle.photoPath,
                                    imageBuilder: (context, imageProvider) =>
                                        GestureDetector(
                                      onTap: () => Get.dialog(
                                        Dialog(
                                          child: PhotoView(
                                            tightMode: true,
                                            minScale: PhotoViewComputedScale
                                                .contained,
                                            imageProvider:
                                                CachedNetworkImageProvider(
                                                    controller.baseRoute.value!
                                                        .vehicle.photoPath),
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.image),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: WidgetUtil.defaultAllPadding(),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CustomText(
                                            text: AppStrings.totalFerryStops,
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                          const CustomText(
                                            text: '-',
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                          CustomText(
                                            text: controller.baseRoute.value!
                                                .ferryStops.length
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CustomText(
                                            text: AppStrings.totalEmployees,
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                          const CustomText(
                                            text: '-',
                                            style: TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                          CustomText(
                                            text: controller.baseRoute.value!
                                                .employees.length
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VehicleInfoCard(
                                  vehicle: controller.baseRoute.value!.vehicle),
                              BaseRouteFerryStopListCard(
                                ferryStopList:
                                    controller.baseRoute.value!.ferryStops,
                              ),
                              BaseRouteEmployeeListCard(
                                employeeList:
                                    controller.baseRoute.value!.employees,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
