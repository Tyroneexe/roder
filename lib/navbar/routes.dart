import 'package:get/get.dart';
import 'package:roder/messages/messages_page.dart';
import 'package:roder/navbar/navbar.dart';
import 'package:roder/search/search_page.dart';
import 'package:roder/homepage/home_page.dart';
import 'package:roder/ui/notification_page.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: noti, page: () => NotificationPage()),
    GetPage(name: search, page: () => const Search()),
    GetPage(name: message, page: () => MessagePage()),
  ];

  //
  static getnavbar() => navbar;
  static gethome() => home;
  static getnoti() => noti;
  static getsearch() => search;
  static getmessage() => message;
  //
  static String navbar = '/';
  static String home = '/home';
  static String noti = '/noti';
  static String search = '/search';
  static String message = '/message';
}
