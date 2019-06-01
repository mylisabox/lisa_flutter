
enum LisaFlavor {
  prod,
  dev
}

// ignore: avoid_classes_with_only_static_members
class Config {
  static LisaFlavor flavor;
  static String kUrl;
}
