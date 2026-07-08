import 'package:bokly_app/constants.dart';
import 'package:bokly_app/core/utils/app_router.dart';
import 'package:bokly_app/core/utils/service_locator.dart';
import 'package:bokly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:bokly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bokly_app/features/home/presentation/manager/newest_books_cubit.dart/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  setupServiceLocator();
  runApp(const BooklyApp());

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFuturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
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
