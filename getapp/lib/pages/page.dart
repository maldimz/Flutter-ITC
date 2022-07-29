import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getapp/main.dart';

class PageSatu extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Action'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Action'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => PageDua());
              },
              icon: Icon(Icons.arrow_right))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Data 1 : ${data['data 1']}"),
            Text("Data 2: ${data['data 2']}"),
            ElevatedButton(
                onPressed: () {
                  // Get.snackbar("Hi", "Ini pesan ${data['data 1']}");
                  Get.rawSnackbar(
                      message: "Test",
                      icon: Icon(Icons.alarm),
                      isDismissible: true,
                      mainButton:
                          ElevatedButton(onPressed: () {}, child: Text("OK")));
                },
                child: Text("Snackbar")),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("GOJEK", "Kode otp anda 123");
                },
                child: Text("Notifikasi")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 5.0,
                      onConfirm: () {
                        Get.back();
                      },
                      middleText: "Dialog made in 3 lines of code");
                },
                child: Text("Dialog")),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.music_note),
                            title: Text('Music'),
                            onTap: () => {}),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text('Video'),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ));
                },
                child: Text("Bottom Sheet")),
            CupertinoButton(
                onPressed: () {
                  _showAlertDialog(context);
                },
                child: Text("Cuppertino")),
            CupertinoButton(
              onPressed: () => _showActionSheet(context),
              child: const Text('CupertinoActionSheet'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Data get storage ${box.read('satu')}"),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(Homepage());
                },
                child: Text("home")),
            ElevatedButton(
                onPressed: () {
                  box.listenKey('satu', (value) {
                    print('new key is $value');
                  });
                },
                child: Text("listen")),
          ],
        ),
      ),
    );
  }
}
