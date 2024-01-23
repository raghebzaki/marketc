
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketc/core/router/router.dart';
import 'package:marketc/core/utils/extensions.dart';
import 'package:marketc/features/customer/payment/map/presentation/manager/maps_cubit.dart';

import '../../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/shared/widgets/custom_button.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../data/models/maps_model.dart';
import '../widgets/google_map_builder.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // final Address address = Address();
  // final HiveDatabase hiveDatabase = HiveDatabase();

  List<MapsModel> markersList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsCubit()
        ..addMarker(markersList)
        ..setCustomMarker(),
      child: BlocConsumer<MapsCubit, MapsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MapsCubit mapsCubit = MapsCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(title: S.of(context).choose_address),
            body: SafeArea(
              child: Stack(
                children: [
                  GoogleMapBuilder(
                    onGoogleMapCreated: mapsCubit.mapController,
                    markers: mapsCubit.markers.map((e) => e).toSet(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: CustomBtn(
                        label: S.current.add_new_address,
                        onPressed: () async {
                          context.pushNamed(addNewAddressPageRoute);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
