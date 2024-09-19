import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numart_app/routes/app_pages.dart';
import 'package:numart_app/routes/app_routes.dart';
import 'package:numart_app/theme/theme.dart';
import 'base_bindings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/graphql_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await initHiveForFlutter();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: ValueNotifier(GraphQLConfig.client()),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.keepFactory,
          title: 'NUMART',
          initialBinding: BaseBindings(),
          getPages: AppPages.pages,
          theme: lightTheme,
          themeMode: ThemeMode.light,
          initialRoute: Routes.splash,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        ));
  }
}
