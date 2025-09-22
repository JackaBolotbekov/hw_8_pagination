import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_8_pagination/rick/cubit/rick_cubit.dart';

class RickScreen extends StatefulWidget {
  const RickScreen({super.key});

  @override
  State<RickScreen> createState() => _RickScreenState();
}

class _RickScreenState extends State<RickScreen> {
  final cubit = RickCubit()..requestCharacters();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    log("$_isBottom");
  }

  void _onScroll() {
    if (_isBottom) {
      cubit.requestCharacters(page: 2);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RickCubit, RickState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is Loading) {
              return buildLoader();
            }
            if (state is Error) {
              return Center(child: Text("Error"));
            }
            if (state is Success) {
              final list = state.characterModel.results;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final item = list[index];
                  return Column(
                    children: [
                      Text(item.name),
                      Text(item.status),
                      Image.network(item.image),
                    ],
                  );
                },
                itemCount: list.length,
              );
            }
            return buildLoader();
          },
        ),
      ),
    );
  }

  Center buildLoader() {
    return Center(child: CircularProgressIndicator());
  }
}
