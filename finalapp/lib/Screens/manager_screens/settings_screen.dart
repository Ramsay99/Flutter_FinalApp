import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),

        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate("drawer.settings"),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _onActionSheetPress(context);
                  },
                  icon: Icon(Icons.language),
                ),
                TextButton(
                  onPressed: () {
                    _onActionSheetPress(context);
                  },
                  child: Text(
                    translate("language.language"),
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   children: [
            //     IconButton(onPressed: () {}, icon: Icon(Icons.color_lens_sharp)),
            //     TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           translate("theme"),
            //           style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            //         )),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  void showDemoActionSheet(
      {required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => child).then((String? value) {
      if (value != null) changeLocale(context, value);
    });
  }

  void _onActionSheetPress(BuildContext context) {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(translate('language.selection.title')),
        message: Text(translate('language.selection.message')),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(translate('language.name.en')),
            onPressed: () => Navigator.pop(context, 'en_US'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.ar')),
            onPressed: () => Navigator.pop(context, 'ar'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, null),
          child: Text(translate('button.cancel')),
        ),
      ),
    );
  }
}
