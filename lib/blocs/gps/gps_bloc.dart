import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? GpsServiceSubscription;
  GpsBloc()
      : super(
          const GpsState(
            isGpsEnable: false,
            isGpsPermissionGranted: false,
          ),
        ) {
    on<GpsAndPermissionEvent>(
      (event, emit) => emit(
        state.copyWith(
            isGpsEnable: event.isGpsEnable,
            isGpsPermissionGranted: event.isGpsPermissionGranted),
      ),
    );
    _init();
  }

  Future<void> _init() async {

    final gpsInitStatus = await Future.wait({
      _checkGpsStatus(),
      _isPermissionGranted()
    });

    add(
      GpsAndPermissionEvent(
        isGpsEnable: gpsInitStatus[0],
        isGpsPermissionGranted: gpsInitStatus[1],
      ),
    );
  }


  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    GpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      add(
        GpsAndPermissionEvent(
          isGpsEnable: isEnabled,
          isGpsPermissionGranted: state.isGpsPermissionGranted,
        ),
      );
    });
    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();

    switch (status) {
      case PermissionStatus.granted:
        add(
          GpsAndPermissionEvent(
              isGpsEnable: state.isGpsEnable,
              isGpsPermissionGranted: true),
        );
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        add(
          GpsAndPermissionEvent(
              isGpsEnable: state.isGpsEnable,
              isGpsPermissionGranted: false),
        );
        break;
      case PermissionStatus.permanentlyDenied:
        await openAppSettings();
        break;

    }
  }

  @override
  Future<void> close() {
    GpsServiceSubscription?.cancel();
    return super.close();
  }
}
