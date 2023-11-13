enum Flavor {
  STAGING,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.STAGING:
        return 'Staging CMO Driver';
      case Flavor.PROD:
        return 'CMO Driver';
      default:
        return 'title';
    }
  }
}
