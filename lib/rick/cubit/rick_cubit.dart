import 'package:bloc/bloc.dart';
import '../../model/character_model.dart';
import '../data/api_service.dart';

part 'rick_state.dart';

class RickCubit extends Cubit<RickState> {
  RickCubit(this._api) : super(const RickInitial());

  final ApiService _api;

  int _page = 1;
  bool _isFetching = false;
  bool _hasMore = true;
  final List<Result> _items = [];

  bool get isFetching => _isFetching;
  bool get hasMore => _hasMore;

  Future<void> requestCharacters() async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;

    if (_items.isEmpty) {
      emit(const Loading());
    }

    try {
      final model = await _api.getCharacters(page: _page);
      final next = model.results;

      if (next.isEmpty) {
        _hasMore = false;
      } else {
        _page++;
        _items.addAll(next);
        emit(Success(List<Result>.unmodifiable(_items)));
      }
    } catch (e) {
      emit(Error(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> refresh() async {
    _page = 1;
    _isFetching = false;
    _hasMore = true;
    _items.clear();
    await requestCharacters();
  }
}
