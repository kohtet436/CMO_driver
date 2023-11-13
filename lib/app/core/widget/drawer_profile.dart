import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import '../util/widget_util.dart';
import '../values/color_manager.dart';
import '../values/styles_manager.dart';
import '../values/values_manager.dart';
import '../../data/model/driver.dart';

class DrawerProfile extends StatelessWidget {
  final Driver driver;

  const DrawerProfile({Key? key, required this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: WidgetUtil.defaultAllPadding(),
      color: ColorManager.secondaryColor,
      child: Column(
        children: [
          Padding(
            padding: WidgetUtil.defaultAllPadding(),
            child: OctoImage(
              image: CachedNetworkImageProvider(driver.photoPath),
              width: AppSize.drawerImageSize,
              height: AppSize.drawerImageSize,
              imageBuilder: OctoImageTransformer.circleAvatar(),
              fit: BoxFit.cover,
              placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
              errorBuilder: OctoError.icon(),
            ),
          ),
          Padding(
            padding: WidgetUtil.defaultHorizontalPadding(),
            child: Text(
              driver.name,
              style: getBoldStyle(color: ColorManager.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: WidgetUtil.defaultAllPadding(),
            child: Text(
              "#${driver.vehicleEmployeeNumber.toString()}",
              style: getRegularStyle(color: ColorManager.primaryDarkColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
