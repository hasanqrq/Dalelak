import 'package:flutter_bloc/flutter_bloc.dart';

// Events
/// Represents an event in the WelcomeBloc where a region is selected.
abstract class WelcomeEvent {}

/// Event to select a specific region.
class SelectRegion extends WelcomeEvent {
  final String region;

  SelectRegion(this.region);
}

// States
/// Represents the state of the WelcomeBloc.
abstract class WelcomeState {}

/// Initial state when no region has been selected yet.
class WelcomeInitial extends WelcomeState {}

/// State representing a selected region.
class RegionSelected extends WelcomeState {
  final String region;

  RegionSelected(this.region);
}

// Bloc
/// Bloc that manages the state of the Welcome page, handling region selection.
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    // Register the event handler for SelectRegion
    on<SelectRegion>((event, emit) {
      // Emit a RegionSelected state with the selected region
      emit(RegionSelected(event.region));
    });
  }
}
