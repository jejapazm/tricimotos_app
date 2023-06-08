import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mototaxis_app/blocs/blocs.dart';
import 'package:mototaxis_app/constants/palette.dart';
import 'package:mototaxis_app/ui/drawer.dart';
import 'package:mototaxis_app/view/views.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    // locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null)
            return const Center(child: Text('Espere por favor...'));
          // return Center(child: Text('${ state.lastKnownLocation?.latitude}, ${state.lastKnownLocation?.latitude}'),);

          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(
                  initialLocation: state.lastKnownLocation!,
                ),
                Positioned(
                  left: 10,
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Palette().cCinereous,
                    radius: 22,
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon:
                          const Icon(Icons.menu, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
