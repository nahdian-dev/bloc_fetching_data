// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:practice_fetching_api_bloc/data/models/jokes_model.dart';
import 'package:practice_fetching_api_bloc/data/repositories/jokes_repositories.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  JokesBloc() : super(const JokesInitialState(initialValue: 'PUSH BUTTON')) {
    on<JokesLoad>(_mapJokesLoadToState);
  }

  void _mapJokesLoadToState(JokesLoad event, Emitter<JokesState> emit) async {
    try {
      JokesModel jokesModel = await JokesRepositories().fetchRandomJokes();

      emit(JokesSuccessState(jokesSuccessState: jokesModel));
    } catch (e) {
      emit(
        const JokesFailedState(jokesFailedState: "Failed to Retrive data"),
      );
    }
  }
}
