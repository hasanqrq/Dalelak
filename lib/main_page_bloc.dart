// main_page_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tourist_place_model.dart';

// Events
abstract class MainPageEvent {}

class LoadPlaces extends MainPageEvent {}

class FilterPlacesByRegion extends MainPageEvent {
  final String region;

  FilterPlacesByRegion(this.region);
}

// States
abstract class MainPageState {}

class MainPageInitial extends MainPageState {}

class PlacesLoaded extends MainPageState {
  final List<TouristPlace> places;

  PlacesLoaded(this.places);
}

// Bloc
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final List<TouristPlace> allPlaces;

  MainPageBloc()
      : allPlaces = [
          // Sample places in the South
          TouristPlace(
            name: 'Petra',
            description:
                'Ancient rock-cut architecture, a wonder of the world.',
            imageUrl: 'assets/images/petra_background.jpg.jpeg',
            reviews: ['Amazing!', 'A must-see place!'],
            openingHours: '6:00 AM - 6:00 PM',
            latitude: 30.3285,
            longitude: 35.4444,
            region: 'South',
          ),
          // Sample places in the North
          TouristPlace(
            name: 'Jerash',
            description: 'Ancient ruins of the Greco-Roman city in Jordan.',
            imageUrl: 'assets/images/jerash.jpg',
            reviews: ['Historic!', 'Beautiful ruins.'],
            openingHours: '8:00 AM - 5:00 PM',
            latitude: 32.2722,
            longitude: 35.8914,
            region: 'North',
          ),
          // Sample places in the Middle
          TouristPlace(
            name: 'Roman Amphitheater',
            description:
                'An ancient Roman theater in Amman, Jordan, built in the 2nd century AD.',
            imageUrl: 'assets/images/roman.jpg',
            reviews: ['Incredible history!', 'A must-see in Amman.'],
            openingHours: '8:00 AM - 6:00 PM',
            latitude: 31.9515,
            longitude: 35.9382,
            region: 'Middle',
          ),
          TouristPlace(
            name: 'King Abdullah I Mosque',
            description:
                'A grand mosque in Amman known for its striking blue dome.',
            imageUrl: 'assets/images/king_abd_mosque.jpg',
            reviews: ['Stunning architecture!', 'Peaceful and beautiful.'],
            openingHours: '8:00 AM - 8:00 PM',
            latitude: 31.9632,
            longitude: 35.9113,
            region: 'Middle',
          ),
          TouristPlace(
            name: 'Rainbow Street',
            description:
                'A lively street in Amman known for its shops, cafes, and cultural atmosphere.',
            imageUrl: 'assets/images/rainbow_street.jpg',
            reviews: ['Great atmosphere!', 'Loved the shops and cafes.'],
            openingHours: 'Open 24 hours',
            latitude: 31.9539,
            longitude: 35.9314,
            region: 'Middle',
          ),
          TouristPlace(
            name: 'Jordan Museum',
            description:
                'Jordan’s national museum featuring exhibits on history and archaeology.',
            imageUrl: 'assets/images/jordan_museum.jpg',
            reviews: ['Very informative!', 'A well-curated museum.'],
            openingHours: '9:00 AM - 5:00 PM',
            latitude: 31.9454,
            longitude: 35.9185,
            region: 'Middle',
          ),
        ],
        super(MainPageInitial()) {
    on<LoadPlaces>((event, emit) {
      // Emit all places when LoadPlaces is triggered
      emit(PlacesLoaded(allPlaces));
    });
    on<FilterPlacesByRegion>((event, emit) {
      // Filter places based on region when FilterPlacesByRegion is triggered
      final filteredPlaces =
          allPlaces.where((place) => place.region == event.region).toList();
      emit(PlacesLoaded(filteredPlaces));
    });
  }
}
