part of 'rick_cubit.dart';

abstract class RickState {
  const RickState();
}

class RickInitial extends RickState {
  const RickInitial();
}

class Loading extends RickState {
  const Loading();
}

class Success extends RickState {
  final List<Result> characters;
  const Success(this.characters);
}

class Error extends RickState {
  final String message;
  const Error(this.message);
}
