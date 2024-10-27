// details_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tourist_place_model.dart';

// Events
abstract class DetailsEvent {}

class LoadPlaceDetails extends DetailsEvent {
  final TouristPlace place;

  LoadPlaceDetails(this.place);
}

// States
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final TouristPlace place;

  DetailsLoaded(this.place);
}

// Bloc
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<LoadPlaceDetails>((event, emit) {
      emit(DetailsLoaded(event.place));
    });
  }
}
