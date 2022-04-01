import 'dart:async';
import 'package:esayapp/blocs/device_bloc.dart';
import 'package:esayapp/blocs/device_states.dart';
import 'package:esayapp/models/device.dart';
import 'package:esayapp/widgets/card_small.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:esayapp/constants/Theme.dart';
import 'package:esayapp/constants/language.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/device_event.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _backPressedCount = 0;
  var timeout = const Duration(seconds: 5);

  late DeviceBloc deviceBloc;

  @override
  void initState() {
    super.initState();
    deviceBloc = DeviceBloc();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (context) => DeviceBloc()..add(const LoadDevices()))],
          child: BlocConsumer<DeviceBloc, DeviceState>(
            listener: (context, state){
              if(state is DeviceChange){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is DeviceFetching) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                ));
              } else if (state is DeviceFetched) {
                return _drawListView(state.devices);
              } else if (state is DeviceError) {
                return Center(
                  child: Text("Error: ${state.error}"),
                );
              } else if (state is DeviceChange) {
                return _drawListView(state.devices);
              } else {
                return const Center(
                  child: Text('No device yet'),
                );
              }
            },
          ),
        ),
        onWillPop: _monitorBackPress);
  }

  Future<bool> _monitorBackPress() async {
    ++_backPressedCount;
    if (_backPressedCount == 1) {
      Fluttertoast.showToast(
          msg: Language.SWIPE_AGAIN_TXT,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.black,
          textColor: Colors.white,
          fontSize: 16.0);

      startTimeout();
    }

    if (_backPressedCount == 2) {
      return true;
    } else {
      return false;
    }
  }

  Timer startTimeout() {
    return Timer(timeout, handleTimeout);
  }

  void handleTimeout() {
    _backPressedCount = 0;
  }

  Widget _drawListView(List<Device> devices) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (devices.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: Text(Language.NO_CATEGORY_AVAIL_TXT),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: width > 500.0 ? 3 : 2,
        itemCount: devices.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Row(
              children: [
                CardSmall(
                  stateText: devices[i].status,
                  title: devices[i].name,
                  onTurnOff: () {
                    context.read<DeviceBloc>().add(TurnOffDevice(devices[i]));
                  },
                  onTurnOn: () {
                    context.read<DeviceBloc>().add(TurnOnDevice(devices[i]));
                  },
                ),
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 2.0,
      ),
    );
  }
}
