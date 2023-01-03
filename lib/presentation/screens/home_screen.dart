import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_fetching_api_bloc/logic/blocs/bloc/jokes_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Jokes'),
      ),
      body: BlocConsumer<JokesBloc, JokesState>(
        listener: (context, state) {
          if (state is JokesLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (() {
                  if (state is JokesSuccessState) {
                    return Column(
                      children: [
                        Text(
                          state.jokesSuccessState.setup,
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          state.jokesSuccessState.punchline,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    );
                  }
                  if (state is JokesFailedState) {
                    return Text(
                      state.jokesFailedState,
                      style: const TextStyle(color: Colors.black),
                    );
                  }
                  if (state is JokesInitialState) {
                    return Text(state.initialValue);
                  }

                  return Container();
                }()),
                const SizedBox(height: 20),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<JokesBloc>(context).add(JokesLoad());
                  },
                  child: const Text('Get Random Jokes'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
