import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/blocks/auth/auth_bloc.dart';
import 'package:mobile_banking/data/repositories/auht_repository.dart';
import 'package:mobile_banking/services/local_notification_service.dart';

import '../blocks/connectivity/connectivity_bloc.dart';
import '../blocks/connectivity/connectivity_event.dart';
import '../screens/routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_)=> AuthRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(
            create: (_) =>
            ConnectivityBloc()
              ..add(CheckConnectivity()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          navigatorKey: navigatorKey,
        )
      ),
    );
  }
}
