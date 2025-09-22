part of 'rick_cubit.dart';

sealed class RickState {}

final class RickInitial extends RickState {}

final class Loading extends RickState {}

final class Success extends RickState {
  final CharacterModel characterModel;

  Success({required this.characterModel});
}

final class Error extends RickState {}
