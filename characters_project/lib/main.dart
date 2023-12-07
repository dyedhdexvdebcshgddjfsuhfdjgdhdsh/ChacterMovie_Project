import 'package:characters_project/bloc_layer/cubit.dart';
import 'package:characters_project/data_layer/repository.dart';
import 'package:characters_project/data_layer/webservies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presenation_layer/screens/characters.dart';

void main() {
  runApp(BreakingBadApp());
}

class BreakingBadApp extends StatelessWidget {
  BreakingBadApp({Key? key}) : super(key: key);

  //final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    // AppRouter generateRoute = AppRouter();
    ChactersCubit chactersCubit =
        ChactersCubit(CharactersRepoSitory(CharactersWebservices()));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ChactersCubit>(
          create: (context) => chactersCubit, child: CharactersScreen()),
      // onGenerateRoute: generateRoute.appRoute,
      // home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          Icon(
            Icons.no_adult_content,
            size: 20,
          ),
          Text('This Page is Not Found'),
        ],
      ),
    );
  }
}
