import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

//@HiveType(typeId: 1)
class SaveData with ChangeNotifier {
//  @HiveField(0)
  String name = "";
//  @HiveField(1)
  String emailid = "";

  void update(String argname, String argmailid) async {
    name = argname;
    emailid = argmailid;
    final setting = await Hive.openBox("mysetting");
    await setting.put("name", name);
    await setting.put("mailid", emailid);
    notifyListeners();
    print("from update");
    print("name $name");
    print("mail $emailid");
  }

  init() async {
    if (await Hive.boxExists("mysetting")) {
      final settings = await Hive.openBox("mysetting");
      name = settings.get("name");
      emailid = settings.get("mailid");
      print("from init");
      print("name $name");
      print("mail $emailid");
    }
    notifyListeners();
  }
}
