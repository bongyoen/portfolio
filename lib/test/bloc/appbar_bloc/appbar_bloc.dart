import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/test/bloc/appbar_bloc/appbar_event.dart';
import 'package:portfolio/test/bloc/appbar_bloc/appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc(): super(AppbarInitial()){}
}