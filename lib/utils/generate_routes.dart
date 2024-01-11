import 'package:backoffice/screens/admin_page.dart';
import 'package:backoffice/screens/book/create.dart';
import 'package:backoffice/screens/book/list.dart';
import 'package:backoffice/screens/writer/list.dart';
import 'package:backoffice/utils/app_routes.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.bookInsert) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'creator',
        page: CreatorCreateBook(),
      );
    });
  } else if (settings.name == AppRoutes.templates) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'templates',
        page: CreatorCreateBook(),
      );
    });
  } else if (settings.name == AppRoutes.bookList) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'creator',
        page: CreatorList(),
      );
    });
  } else if (settings.name == AppRoutes.writerList) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'writer',
        page: WriterList(),
      );
    });
  } else if (settings.name == AppRoutes.writerInsert) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'writer',
        page: WriterList(),
      );
    });
  } else if (settings.name == AppRoutes.home) {
    return MaterialPageRoute(builder: (context) {
      return const AdminPage(
        activeMenu: 'home',
        page: WriterList(),
      );
    });
  }

  assert(false, 'Need to implement ${settings.name}');
  return null;
}
