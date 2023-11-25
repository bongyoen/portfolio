import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable {


  @override
  List<Object> get props {
    return [];
  }
}

class TestAction extends TestEvent {

}
