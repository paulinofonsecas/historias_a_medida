import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/bloc/bloc.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/cubit/text_zoom_cubit.dart';
import 'package:historias_a_medida/features/Historia/presentation/read_historia/widgets/read_historia_body.dart';
import 'package:historias_a_medida/utils/dependencies.dart';

/// {@template read_historia_page}
/// A description for ReadHistoriaPage
/// {@endtemplate}
class ReadHistoriaPage extends StatelessWidget {
  /// {@macro read_historia_page}
  const ReadHistoriaPage({required this.historia, super.key});

  final HistoriaEntity historia;

  static Route<dynamic> route(HistoriaEntity historia) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ReadHistoriaPage(historia: historia),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadHistoriaBloc(),
        ),
        BlocProvider(
          create: (context) => TextZoomCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<TextZoomCubit>().zoomIn();
                  },
                  icon: const Icon(Icons.add),
                ),
                const Gutter(),
                IconButton(
                  onPressed: () {
                    context.read<TextZoomCubit>().zoomOut();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Gutter(),
              ],
            ),
            body: ReadHistoriaView(
              historia: historia,
            ),
          );
        },
      ),
    );
  }
}

class ReadHistoriaView extends StatefulWidget {
  /// {@macro read_historia_view}
  const ReadHistoriaView({required this.historia, super.key});

  final HistoriaEntity historia;

  @override
  State<ReadHistoriaView> createState() => _ReadHistoriaViewState();
}

class _ReadHistoriaViewState extends State<ReadHistoriaView> {
  @override
  void initState() {
    getIt.pushNewScope();

    if (getIt.isRegistered<HistoriaEntity>()) {
      getIt.unregister<HistoriaEntity>();
    }

    getIt.registerSingleton<HistoriaEntity>(widget.historia);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ReadHistoriaBody();
  }
}
