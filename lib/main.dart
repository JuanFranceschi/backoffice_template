import 'package:backoffice/data/fake_database.dart';
import 'package:backoffice/screens/admin_page.dart';
import 'package:backoffice/screens/book/create.dart';
import 'package:backoffice/screens/book/list.dart';
import 'package:backoffice/screens/writer/list.dart';
import 'package:backoffice/utils/app_routes.dart';
import 'package:backoffice/utils/generate_routes.dart';
import 'package:backoffice/utils/side_menu_manager.dart';
import 'package:backoffice/utils/theme_manager.dart';
import 'package:backoffice/utils/themes.dart';
import 'package:backoffice/utils/toast_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
ToastManager toastManager = ToastManager(FToast());
FakeDatabase database = FakeDatabase();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideMenuManager(),
        )
      ],
      // create: (context) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: const Color.fromARGB(100, 0, 0, 0),
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 175, 175, 175),
        ),
      ),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        builder: FToastBuilder(),
        themeMode: Provider.of<ThemeManager>(context).themeMode,
        initialRoute: AppRoutes.bookList,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
