import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_page_bloc.dart';
import 'tourist_place_model.dart';
import 'place_card_widget.dart';

class MainPage extends StatelessWidget {
  final String? region;

  const MainPage({Key? key, this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc()
        ..add(
          (region == null || region == 'All')
              ? LoadPlaces()
              : FilterPlacesByRegion(region!),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tourist Places in Jordan'),
        ),
        body: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (context, state) {
            if (state is PlacesLoaded) {
              if (state.places.isEmpty) {
                return const Center(
                  child: Text('No places available for the selected region.'),
                );
              }
              return ListView.builder(
                itemCount: state.places.length,
                itemBuilder: (context, index) {
                  final place = state.places[index];
                  return PlaceCardWidget(
                    place: place,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: place,
                      );
                    },
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
