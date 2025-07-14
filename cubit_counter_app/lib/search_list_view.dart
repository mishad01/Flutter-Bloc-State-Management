import 'package:cubit_counter_app/cubit/search/player_cubit.dart';
import 'package:cubit_counter_app/cubit/search/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Search ListView"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  context.read<PlayerCubit>().filterPlayer(value);
                },
                decoration: InputDecoration(
                  label: Text("Search"),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<PlayerCubit, PlayerState>(
                  builder: (context, state) {
                    if (state is PlayerInitialState) {
                      return buildPlayerList(state.players);
                    } else if (state is PlayerFilteredState) {
                      return buildPlayerList(state.filteredPlayers);
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlayerList(List<Map<String, dynamic>> players) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          title: Text(player['name']),
          subtitle: Text(player['country']),
        );
      },
    );
  }
}
