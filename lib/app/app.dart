import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/blocs/card/cards_bloc.dart';
import 'package:mobile_banking/blocs/tab/tab_bloc.dart';
import 'package:mobile_banking/blocs/transaction/transaction_bloc.dart';
import 'package:mobile_banking/data/repositories/auht_repository.dart';
import 'package:mobile_banking/data/repositories/cards_repository.dart';
import 'package:mobile_banking/data/repositories/profile_repository.dart';
import 'package:mobile_banking/services/local_notification_service.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/connectivity/connectivity_bloc.dart';
import '../blocs/connectivity/connectivity_event.dart';
import '../blocs/profile/profile_bloc.dart';
import '../screens/routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (_) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (_) => CardsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(CheckAuthenticationEvent()),
          ),
          BlocProvider(
            create: (context) => ConnectivityBloc()..add(CheckConnectivity()),
          ),
          BlocProvider(
            create: (context) => BottomBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(context.read<ProfileRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                UserCardsBloc(cardsRepository: context.read<CardsRepository>()),
          ),
          BlocProvider(
            create: (context) => TransactionBloc(
                cardsRepository: context.read<CardsRepository>()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false, scaffoldBackgroundColor: Colors.white),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}
