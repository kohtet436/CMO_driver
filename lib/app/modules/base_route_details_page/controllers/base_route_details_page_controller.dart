import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/helper.dart';
import '../../../data/repository/base_route_repository.dart';
import '../../../data/model/base_route.dart';

class BaseRouteDetailsPageController extends GetxController {
  final baseRoute = Rxn<BaseRoute>();

  final isLoading = false.obs;

  final BaseRouteRepository baseRouteRepository = Get.find();

  void getBaseRoute(String baseRouteId) async {
    try {
      isLoading(true);
      final baseRouteData = await baseRouteRepository.getBaseRoute(baseRouteId);
      baseRouteData.fold(
        (data) => baseRoute(data),
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getBaseRoute(GetStorage().read('baseRouteId'));
    super.onInit();
  }
}
