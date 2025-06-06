import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'config/dependencies/dependency_injection.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/route_generator.dart';
import 'config/themes/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'presentation/shared/viewmodels/user_viewmodel.dart';
import 'presentation/shared/bloc/bloc_observer.dart';
import 'presentation/pages/counter/bloc/counter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(AppTheme.darkSystemUiOverlayStyle);
  
  // Setup BLoC observer for debugging
  Bloc.observer = MyBlocObserver();
  
  // Setup dependency injection
  await setupDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BLoC providers
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        // Add more BLoC providers here as needed
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => getIt<UserViewModel>(),
          ),
          // Keep existing providers for gradual migration
        ],
        child: MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.darkTheme,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: AppRoutes.main,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
