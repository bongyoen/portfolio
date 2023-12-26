import 'package:flutter_bloc/flutter_bloc.dart';

import 'body_event.dart';
import 'body_state.dart';


class BodyBloc extends Bloc<BodyEvent, BodyState> {
  BodyBloc() : super(BodyInitialState()) {}
}
