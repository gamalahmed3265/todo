import 'package:flutter/material.dart';
import 'package:todo/services/requrst_state.dart';

Widget screenSwatich(ReuestState state, Widget body) {
  switch (state) {
    case ReuestState.loading:
      return const Center(child: CircularProgressIndicator());

    case ReuestState.loaded:
      return body;

    case ReuestState.error:
      return const Center(child: Text("error"));
  }
}
