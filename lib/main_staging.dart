import 'package:flutter/material.dart';

import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.STAGING;
  runApp(const App());
}
