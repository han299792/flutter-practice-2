import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '/counter_bloc.freezed.dart';

@Injectable()
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(_Count(0)) {
    on<_Increase>((event, emit) => emit(_Count(state.value + 1)));
    on<_Decrease>(
        (event, emit) => emit(_Count(state.value - 1))); //emit 상태를 업데이트
  }
}

@freezed // freezed 객채화 불변객체
class CounterEvent {
  const factory CounterEvent.increase() = _Increase;
  const factory CounterEvent.decrease() = _Decrease;
}

@freezed
class CounterState with _$CounterState {
  //확장성을 위해
  const factory CounterState.count(int value) = _Count; // state가 값을 가지기 위해
}
