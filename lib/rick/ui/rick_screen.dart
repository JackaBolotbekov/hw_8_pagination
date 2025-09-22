import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/rick_cubit.dart';
import '../data/api_service.dart';
import '../../model/character_model.dart';

class RickScreen extends StatefulWidget {
  const RickScreen({super.key});

  @override
  State<RickScreen> createState() => _RickScreenState();
}

class _RickScreenState extends State<RickScreen> {
  late final RickCubit cubit;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = RickCubit(ApiService())..requestCharacters();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !cubit.isFetching && cubit.hasMore) {
      cubit.requestCharacters();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final max = _scrollController.position.maxScrollExtent;
    final cur = _scrollController.position.pixels;
    return cur >= max * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Rick & Morty')),
        body: BlocBuilder<RickCubit, RickState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is Error) {
              return Center(child: Text('Error: ${state.message}'));
            }

            final items = state is Success ? state.characters : <Result>[];

            return ListView.builder(
              controller: _scrollController,
              itemCount: items.length + (cubit.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= items.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final item = items[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.image,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.status),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
