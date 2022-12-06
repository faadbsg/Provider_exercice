// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'provider_ex_state.dart';

class ProviderExCubit extends Cubit<ProviderExState> {
  ProviderExCubit() : super(ProviderExInitialState());

  Future<void> changeBackground(bool val) async {
    if (val == true) {
      emit(ProviderExGreyState());
    } else {
      emit(ProviderExWhiteState());
    }
  }
}
