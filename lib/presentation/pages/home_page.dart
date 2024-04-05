import 'package:dummy/data/model/state_city_model.dart';
import 'package:dummy/presentation/bloc/bloc_event.dart';
import 'package:dummy/presentation/bloc/bloc_state.dart';
import 'package:dummy/presentation/bloc/state_cities_bloc.dart';
import 'package:dummy/presentation/pages/city_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StateCitiesBloc>().add(FetchData());
    return Scaffold(
      appBar: AppBar(
        title: const Text("State-City Selection"),
      ),
      body: BlocBuilder<StateCitiesBloc, BlocState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return ListView.builder(
              itemCount: state.stateCitiesList.length,
              itemBuilder: (context, index) {
                final stateCity = state.stateCitiesList[index];
                return _buildSateTile(stateCity, context);

              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.msg));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildSateTile(StateCity stateCity, BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(
          stateCity.state,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CityPage(stateCity: stateCity)));
        },
      ),
    );
  }
}
