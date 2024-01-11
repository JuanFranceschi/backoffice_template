import 'package:backoffice/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { success, error, warning, info, simple }

class ToastManager {
  final FToast _ftoast;

  ToastManager(this._ftoast);

  showToast(BuildContext context, String message,
      {ToastType type = ToastType.success}) {
    _ftoast.init(navigatorKey.currentContext ?? context);

    Widget toast = _ToastWidget(type, message);

    _ftoast.removeQueuedCustomToasts();

    _ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}

class _ToastWidget extends StatelessWidget {
  final ToastType type;
  final String message;
  const _ToastWidget(this.type, this.message);
  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late IconData icon;
    Color contrastColor = Colors.white;

    switch (type) {
      case ToastType.success:
        backgroundColor = const Color.fromARGB(255, 82, 185, 99);
        icon = CupertinoIcons.check_mark;
        break;
      case ToastType.error:
        backgroundColor = const Color.fromARGB(255, 223, 89, 89);
        icon = CupertinoIcons.xmark;
        break;
      case ToastType.warning:
        backgroundColor = const Color.fromARGB(255, 233, 213, 2);
        contrastColor = const Color.fromARGB(255, 20, 20, 20);
        icon = CupertinoIcons.exclamationmark_triangle;
        break;
      case ToastType.info:
        backgroundColor = const Color.fromARGB(255, 30, 146, 244);
        icon = CupertinoIcons.info;
        break;
      case ToastType.simple:
        backgroundColor = const Color.fromARGB(255, 230, 230, 230);
        contrastColor = const Color.fromARGB(255, 20, 20, 20);
        icon = CupertinoIcons.circle;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: contrastColor,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(color: contrastColor),
          ),
        ],
      ),
    );
  }
}
