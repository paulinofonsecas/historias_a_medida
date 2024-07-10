import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/cubit/bottom_nav_bar_cubit.dart';
import 'package:historias_a_medida/features/Historia/presentation/gestao_historia/gestao_historia.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

class GlobalBottomNavBar extends StatefulWidget {
  const GlobalBottomNavBar({super.key});

  @override
  State<GlobalBottomNavBar> createState() => _GlobalBottomNavBarState();
}

class _GlobalBottomNavBarState extends State<GlobalBottomNavBar>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      bloc: getIt<BottomNavBarCubit>(),
      builder: (context, state) {
        return ConvexAppBar(
          backgroundColor: const Color(0xff0175C2),
          initialActiveIndex: state.index,
          controller: controller,
          items: const [
            TabItem(icon: Icons.create, title: 'Criar'),
            TabItem(icon: Icons.book, title: 'Historias'),
            TabItem(icon: Icons.settings, title: 'Configurações'),
          ],
          // ignore: avoid_print
          onTap: (int i) => getIt<BottomNavBarCubit>().onBottomNavBarChanged(i),
        );
      },
    );
  }
}
