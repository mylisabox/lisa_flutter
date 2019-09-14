Future<String> getMainDirectory() {
  String appDocPath = '.'; //Doesn't matter as on web there is not need for files
  return Future.value(appDocPath);
}
