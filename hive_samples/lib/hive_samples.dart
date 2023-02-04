import 'package:hive/hive.dart';

// void main()async{
//   Hive.init("c:/");
//   final box=await Hive.openBox("mybox");
//   box.put("name", "rahul");
//   box.put("id", 1);
//   String name=box.get("name");
//   int id=box.get("id");
//   print(name);
//   print(id);
//   print(box.values);
// //              print(box.);
//   print(box.values.toList());
//   print(box.path);
//   print(box.isOpen);
//  await box.add(6);
//   await box.add(7);
//   await box.add(8);
//   await box.add(9);
// print(box.values);
// print(box.keys);
// }

//
// void main()async{
//  try {
//   BoxCollection boxCollection = await BoxCollection.open(
//    "my", {"user", "preferences"},);
//   CollectionBox userbox = await boxCollection.openBox("user");
//   userbox.put("name", "rahul");
//   userbox.put("password", 123456);
//   print(await userbox.get("name"));
//   print(await userbox.get("password"));
//
//
//   CollectionBox preferences = await boxCollection.openBox("preferences");
//   preferences.put("useinternet", true);
//   preferences.put("currentWorkingDirectory", "c:/mydir");
//   print(await preferences.get("useinternet"));
//   print(await preferences.get("currentWorkingDirectory"));
//   //boxCollection.close();
//  // print(await userbox.get("currentWorkingDirectory"));
//   await boxCollection.transaction(() async{
//    preferences.put("LastEditedDate", DateTime.now());
//    preferences.put("timeSinceLastEdit",DateTime.now());
//    return Future.value();
//   },boxNames: ["useinternet"]
//   );
//   print(await preferences.get("LastEditedDate"));
//   print(await preferences.get("timeSinceLastEdit"));
//
//  }
//  on Error catch(e){
//   print("state error");
//  }
//   catch (e) {
//   print(e.toString());
//    }
//    print("finished");
// }
//
// void main() {
//   final my = myclass4();
//   print(my.b);
//   my.hi();
// }
//
// class myclass1 {
//   int a = 10;
// }
//
// class myclass2 {
//   int b = 19;
//
//   void hi() {
//     print("hi");
//   }
// }
//
// class myclass3 {
//   int c = 20;
// }
//
// class myclass4 extends myclass1 with myclass2, myclass3 {
//
// }

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;

  Person(this.name, this.id);
}

void main() async {
//  Hive.registerAdapter(PersonAdapter());
//  Hive.init("c:/");
//  Box person=await Hive.openBox('person');
//   final p=Person("shri",22);
// // await person.put("first",p);
// //  Person pSaved=person.get("first") as Person;
// //  print(pSaved.name);
// //  print(pSaved.id);
// // int i= await person.clear();
// // print(i);
// await person.add(p);
// Person pSaved=person.getAt(0);
// print(person.values.toList());
// print(pSaved.id);
//     print(pSaved.name);
  print(identical(0, 0.0));
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
