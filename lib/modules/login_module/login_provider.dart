import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesa_news/modules/login_module/blocs/login_bloc_states.dart';
import 'package:mesa_news/modules/login_module/pages/login_initial.page.dart';

import 'blocs/login_bloc.dart';

class LoginProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginBlocState>(
      listener: (BuildContext context, LoginBlocState state) {},
      builder: (BuildContext context, LoginBlocState state) {
        print('state: $state');
        return LoginInitialPage(bloc: context.read<LoginBloc>());
      },
    );
  }
}
