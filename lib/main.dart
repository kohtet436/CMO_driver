import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/core/helper/constant.dart';
import 'app/core/values/theme_manager.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'flavors.dart';
import 'app/core/util/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  if (GetStorage().read('isEng') == null) {
    GetStorage().write('isEng', true);
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  initializeDateFormatting();

  runApp(
    GetMaterialApp(
      translations: Languages(),
      locale: GetStorage().read('isEng') ? ENG_LOCALE : MM_LOCALE,
      fallbackLocale: ENG_LOCALE,
      debugShowCheckedModeBanner: false,
      title: F.title,
      theme: getApplicationTheme(),
      navigatorKey: Get.key,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
