part of 'location_bloc.dart';

class LocationState extends Equatable {


  final bool followingUser;
  // TODO
  // ULTIMO GEOLOCATION
  // HISTORIA 


  const LocationState({
    this.followingUser = false
  });
  
  @override
  List<Object> get props => [ followingUser ];
}