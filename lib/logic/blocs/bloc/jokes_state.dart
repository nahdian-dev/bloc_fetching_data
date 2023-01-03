part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class JokesInitialState extends JokesState {
  final String initialValue;
  const JokesInitialState({required this.initialValue});
}

class JokesLoadingState extends JokesState {}

class JokesSuccessState extends JokesState {
  final JokesModel jokesSuccessState;

  const JokesSuccessState({required this.jokesSuccessState});

  @override
  List<Object> get props => [jokesSuccessState];
}

class JokesFailedState extends JokesState {
  final String jokesFailedState;

  const JokesFailedState({required this.jokesFailedState});

  @override
  List<Object> get props => [jokesFailedState];
}
