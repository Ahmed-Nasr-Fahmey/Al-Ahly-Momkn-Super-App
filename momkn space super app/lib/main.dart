
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/manager/auth_cubit.dart';
import 'package:super_app/modules/OCR_QR_AUTH/features/auth/presentation/views/splash_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/presentation/bloc/bloc/notification_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/presentation/bloc/bloc/ordering_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/bloc/bloc/products_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/service_booking_history/presentation/bloc/bloc/service_booking_history_bloc.dart';
import 'package:super_app/modules/services/domain/useCase/getServicesCategories_useCase.dart';
import 'package:super_app/modules/services/domain/useCase/serviceProvider_useCase.dart';
import 'package:super_app/modules/services/screens/AgentService/agentServiceDetails.dart';
import 'package:super_app/modules/services/screens/AgentService/generalServices.dart';
import 'package:super_app/modules/services/screens/AgentService/setaSchedule.dart';
import 'package:super_app/modules/services/screens/Home/ServiceProviders.dart';
import 'package:super_app/modules/services/screens/Home/ViewAllService.dart';
import 'package:super_app/modules/services/screens/Home/cubit/home_view_model.dart';
import 'package:super_app/modules/services/screens/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:super_app/shared/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await AppConstants.initAppConstants();
  // await TokenGetter.getToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => ServiceBookingHistoryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => OrderingBloc(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) =>
              HomeScreenViewModel(categoryUseCase: injectCategoryServiceUseCase(), providerUseCase: injectServiceProviderUseCase()),
        ),
      ],
      child: MaterialApp(
        routes: {
          serviceAgentDetailsRoute: (context) => const AgentServiceDetailsScreen(),
          serviceProviderRoute: (context) => const ServiceProvidersScreen(),
          serviceRoute: (context) => const ServiceScreen(),
          agentCalenderRoute: (context) => const ServiceCalendarScreen(),
          ViewAllServiceScreenRouter:(context)=>const ViewAllServiceScreen()
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "IBMPlexSansArabic",
          colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryGreenColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
