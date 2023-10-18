import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaoji/pages/home/home.dart';
import 'package:yaoji/pages/yaobo/yaobo.dart';
import 'package:yaoji/pages/souyao/souyao.dart';
import 'package:yaoji/pages/loushi/loushi.dart';
import 'package:yaoji/bottom_tabbar.dart';

final GoRouter yjRoute = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: "tabbar",
      path: "/",
      builder: (context, state) {
        return const YJBottomTabbar();
      },
    ),
    GoRoute(
      name: "home",
      path: '/pages/home',
      builder: (context, state) {
        return const YJHomePage();
      },
      routes: [
        GoRoute(
          name: 'loushi_',
          path: 'loushi/:pid',
          builder: (context, GoRouterState state) {
            String id = state.pathParameters['pid'] ?? "";
            return YJLoushiPage(id: id);
          },
        )
      ],
    ),
    GoRoute(
      path: '/pages/yaobo',
      builder: (context, state) {
        return const YJYaoboPage();
      },
    ),
    GoRoute(
      path: '/pages/souyao',
      builder: (context, state) {
        return const YJSouyaoPage();
      },
    ),
    GoRoute(
      name: 'loushi',
      path: '/pages/loushi',
      builder: (context, GoRouterState state) {
        String id = state.pathParameters['id'] ?? "";
        return YJLoushiPage(id: id);
      },
    ),
  ],
);
