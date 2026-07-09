import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/app_router.dart';
import 'package:bokly_app/core/utils/service_locator.dart';
import 'package:bokly_app/core/utils/simple_bloc_observer.dart';
import 'package:bokly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:bokly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bokly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bokly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/manager/newest_books_cubit.dart/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
