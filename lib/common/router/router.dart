import 'package:go_router/go_router.dart';
import 'package:yaoji/pages/article/article_list.dart';
import 'package:yaoji/pages/home/home.dart';
import 'package:yaoji/pages/yaobo/yaobo.dart';
import 'package:yaoji/pages/souyao/souyao.dart';
import 'package:yaoji/pages/loushi/loushi.dart';
import 'package:yaoji/pages/detail/product_detail.dart';
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
    GoRoute(
      name: 'detail',
      path: '/pages/detail/:id',
      builder: (context, state) {
        String sid = state.pathParameters['id'] ?? "";
        int id = int.tryParse(sid) ?? 0;
        return YJProductDetailPage(id: id);
      },
    ),
    GoRoute(
      name: "article",
      path: "/pages/article",
      builder: (context, state) {
        Object? extra = state.extra;
        String bookName = (extra as Map)['bookName'] ?? "";
        String name = (extra as Map)['name'] ?? "";
        int? category;
        if ((extra)["category"] != null) {
          category = (extra)["category"];
        }
        return YJArticleList(
          bookName: bookName,
          name: name,
          category: category,
        );
      },
    )
  ],
);
