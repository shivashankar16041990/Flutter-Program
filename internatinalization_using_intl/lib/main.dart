import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'L10n/LanguageModel.dart';
import "package:provider/provider.dart";
import 'L10n/L10n.dart';

void main() {
  runApp(ChangeNotifierProvider<LanguageModel>(
      create: (_) => LanguageModel(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp_State();
  }
}

class MyApp_State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate
        ],
        locale: Locale.fromSubtags(
            languageCode: context.watch<LanguageModel>().choosen_language),
        home: MyScaffold());
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:
        Drawer(child:AnimatedContainer(
            duration:Duration(seconds: 60),curve: Curves.fastOutSlowIn,child:
        CreateSettingDrawer(context),
        )),
        appBar: AppBar(
          title: Text("Languages"),
        ),
        body: CreateBodyContent(context));
  }

  Widget CreateSettingDrawer(BuildContext context) {
    var model = context.read<LanguageModel>();
    var modelwatch = context.watch<LanguageModel>();
    return ListView.builder(
      itemCount: model.language_name.length,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: Checkbox(
              value:
                  model.languages_code.indexOf(modelwatch.choosen_language) ==
                      index,
              onChanged: (check) {
                model.setLanguage(model.languages_code[index]);
                Navigator.of(context).pop();
              },
            ),
            title: Text(model.language_name[index]),
            onTap: () {
              //model.setLanguage(model.languages_code[index]);
           //   Navigator.of(context).pop();
            });
      },
    );
  }

  Widget CreateBodyContent(BuildContext context) {
    List<ListTile> list = List.empty(growable: true);
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.brother) ?? "",
      textScaleFactor: 1.5,
    )));
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.language) ?? "",
      textScaleFactor: 1.5,
    )));
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.arabicurdu) ?? "",
      textScaleFactor: 1.5,
    )));
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.english) ?? "",
      textScaleFactor: 1.5,
    )));
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.hindi) ?? "",
      textScaleFactor: 1.5,
    )));
    list.add(ListTile(
        title: Text(
      (AppLocalizations.of(context)?.marathi) ?? "",
      textScaleFactor: 1.5,
    )));

    return ListView.builder(
      itemBuilder: (context, index) {
        return list[index];
      },
      itemCount: list.length,
    );
  }
}
