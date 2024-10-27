import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'details_bloc.dart';
import 'tourist_place_model.dart';

class DetailsPage extends StatelessWidget {
  final TouristPlace place;

  const DetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc()..add(LoadPlaceDetails(place)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(place.name),
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display place image
                    Image.asset(
                      state.place.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16.0),
                    // Display place name and description
                    Text(
                      state.place.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      state.place.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16.0),
                    // Display opening hours
                    Text(
                      'Opening Hours: ${state.place.openingHours}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Display Google Map
                    const Text(
                      'Location on Map',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 300,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              state.place.latitude, state.place.longitude),
                          zoom: 14,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId('placeLocation'),
                            position: LatLng(
                                state.place.latitude, state.place.longitude),
                            infoWindow: InfoWindow(title: state.place.name),
                          ),
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Display reviews
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ...state.place.reviews.map((review) => ListTile(
                          leading: const Icon(
                            Icons.comment,
                            color: Colors.blueAccent,
                          ),
                          title: Text(review),
                        )),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
