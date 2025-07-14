import 'package:cubit_counter_app/cubit/search/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerInitialState(allPlayers));

  void filterPlayer(String name) {
    if (name.isEmpty) {
      emit(PlayerInitialState(allPlayers));
    } else {
      final filteredPlayers = allPlayers
          .where(
            (player) => player['name'].toString().toLowerCase().contains(
              name.toLowerCase(),
            ),
          )
          .toList();

      emit(PlayerFilteredState(filteredPlayers));
    }
  }
}
