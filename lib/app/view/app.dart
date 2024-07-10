import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/generate_historia/view/generate_historia_page.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/cubit/bottom_nav_bar_cubit.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/gestao_historia.dart';
import 'package:historias_a_medida/global_widgets/global_bottom_nav_bar.dart';
import 'package:historias_a_medida/l10n/l10n.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomNavBarCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green[700]!,
            brightness: Brightness.dark,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const _App(),
      ),
    );
  }
}

class _App extends StatefulWidget {
  const _App();

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final List<Widget> _screens = [
    const GenerateHistoriaPage(),
    const GestaoHistoriaPage(),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      bloc: getIt<BottomNavBarCubit>(),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const GlobalBottomNavBar(),
          body: IndexedStack(
            index: state.index,
            children: _screens,
          ),
        );
      },
    );
  }
}
