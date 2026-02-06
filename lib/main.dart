import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kuzco_app/kuzco_init_information.dart';
import 'package:kuzco_app/module/config/provider/config_provider.dart';
import 'package:kuzco_app/provider/client_provider.dart';
import 'package:kuzco_app/provider/settings_provider.dart';
import '/routes.dart';

Future<ProviderContainer> bootstrap() async {
  final container = ProviderContainer();
  await Future.wait([container.read(clientProvider.future), container.read(configProvider.future), container.read(settingsProvider.future)]);
  return container;
}

class KuzcoApp extends StatelessWidget {
  final String title;
  final ProviderContainer container;
  const KuzcoApp({super.key, required this.container, required this.title});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("es_419");
    return UncontrolledProviderScope(
      container: container,
      child: AppContainer(title: title),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, this.title = 'Kuzco app Test'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(settingsProvider);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: MaterialApp(
            title: title,
            locale: const Locale('es', 'ES'),
            supportedLocales: const [Locale('es', 'ES')],
            localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
            themeMode: theme.value?.themeMode ?? ThemeMode.dark,
            darkTheme: KuzcoInitInformation.get!.darkTheme,
            theme: KuzcoInitInformation.get!.lightTheme,
            onGenerateRoute: LocalRoutes.get,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
