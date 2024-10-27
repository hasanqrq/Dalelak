class TouristPlace {
  /// The name of the tourist place.
  final String name;

  /// A brief description of the tourist place.
  final String description;

  /// The URL to the image representing the place.
  final String imageUrl;

  /// A list of user reviews about the place.
  final List<String> reviews;

  /// Opening hours for the place, formatted as a string.
  final String openingHours;

  /// Latitude coordinate for the place location.
  final double latitude;

  /// Longitude coordinate for the place location.
  final double longitude;

  /// The region (e.g., North, Middle, South) where the place is located.
  final String region;

  /// Constructor for the TouristPlace model.
  TouristPlace({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.reviews,
    required this.openingHours,
    required this.latitude,
    required this.longitude,
    required this.region,
  });

  // Optional: Factory constructor for creating an instance from JSON.
  // factory TouristPlace.fromJson(Map<String, dynamic> json) {
  //   return TouristPlace(
  //     name: json['name'],
  //     description: json['description'],
  //     imageUrl: json['imageUrl'],
  //     reviews: List<String>.from(json['reviews']),
  //     openingHours: json['openingHours'],
  //     latitude: json['latitude'],
  //     longitude: json['longitude'],
  //     region: json['region'],
  //   );
  // }
}
