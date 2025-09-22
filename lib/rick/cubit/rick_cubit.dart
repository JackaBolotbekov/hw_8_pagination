import 'package:bloc/bloc.dart';
import 'package:hw_8_pagination/api_service.dart';
import 'package:hw_8_pagination/character_model.dart';

part 'rick_state.dart';

class RickCubit extends Cubit<RickState> {
  RickCubit() : super(RickInitial());

  void requestCharacters({int page = 1}) async {
    emit(Loading());
    final apiService = ApiService();
    final result = await apiService.getCharacters(page: page);
    emit(Success(characterModel: result));
  }
}
