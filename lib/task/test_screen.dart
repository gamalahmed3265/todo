import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/bloc.dart';
import 'package:todo/controller/events.dart';
import 'package:todo/controller/state.dart';
import 'package:todo/model/service_app.dart';
import 'package:todo/services/service.dart';
import 'package:todo/task/theme.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (ctx, state) {
      return Scaffold(
          appBar: _appbar(ctx, state),
          body: Column(
            children: [],
          ));
    });
  }

  _appbar(BuildContext ctx, bool state) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          // print("change theme ${ThemeType.light.theme}");
          // ServiceSettings serviceSettings = ServiceSettings();

          // serviceSettings.addSevice(
          //     ServiceApp(theme: ThemeType.light.theme, language: "ar"));
          // serviceSettings.deleteAllSevice();
          // print("theme is ${serviceSettings.getSevice().theme} work 😋😋");
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
        Switch(
            value: state,
            onChanged: (value) {
              BlocProvider.of<ThemeCubit>(ctx).toggle(value: value);
            }),
        // SizedBox(
        //   width: 20,
        // )
      ],
    );
  }
}
