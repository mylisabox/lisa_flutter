import 'package:path_provider/path_provider.dart';

Future<String> getMainDirectory() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  return appDocPath;
}
