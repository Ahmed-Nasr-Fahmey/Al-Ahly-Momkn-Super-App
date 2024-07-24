part of 'user_cubit.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

// stories

class StoriesLoadingState extends UserState {}

class StoriesSuccessState extends UserState {}

class StoriesFailureState extends UserState {
  final String erorrMessage;
  StoriesFailureState({required this.erorrMessage});
}

// posts

class PostsLoadingState extends UserState {}

class PostsSuccessState extends UserState {}

class PostsFailureState extends UserState {
  final String erorrMessage;
  PostsFailureState({required this.erorrMessage});
}

// Cities

class CitiesLoadingState extends UserState {}

class CitiesSuccessState extends UserState {}

class CitiesFailureState extends UserState {
  final String erorrMessage;
  CitiesFailureState({required this.erorrMessage});
}

// Restaurants

class RestaurantsLoadingState extends UserState {}

class RestaurantsSuccessState extends UserState {}

class RestaurantsFailureState extends UserState {
  final String erorrMessage;
  RestaurantsFailureState({required this.erorrMessage});
}

// Restaurants

class CafesLoadingState extends UserState {}

class CafesSuccessState extends UserState {}

class CafesFailureState extends UserState {
  final String erorrMessage;
  CafesFailureState({required this.erorrMessage});
}


// Shoppings

class ShoppingsLoadingState extends UserState {}

class ShoppingsSuccessState extends UserState {}

class ShoppingsFailureState extends UserState {
  final String erorrMessage;
  ShoppingsFailureState({required this.erorrMessage});
}


// Parks

class ParksLoadingState extends UserState {}

class ParksSuccessState extends UserState {}

class ParksFailureState extends UserState {
  final String erorrMessage;
  ParksFailureState({required this.erorrMessage});
}

// Emergency

class EmergencyLoadingState extends UserState {}

class EmergencySuccessState extends UserState {}

class EmergencyFailureState extends UserState {
  final String erorrMessage;
  EmergencyFailureState({required this.erorrMessage});
}

// Parks

class TourismsLoadingState extends UserState {}

class TourismsSuccessState extends UserState {}

class TourismsFailureState extends UserState {
  final String erorrMessage;
  TourismsFailureState({required this.erorrMessage});
}

// Search

class SearchLoadingState extends UserState {}

class SearchSuccessState extends UserState {}

class SearchFailureState extends UserState {
  final String erorrMessage;
  SearchFailureState({required this.erorrMessage});
}