import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';

class SocialSettingsScreen extends StatelessWidget {
  const SocialSettingsScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold();
      },
    );
  }
}
