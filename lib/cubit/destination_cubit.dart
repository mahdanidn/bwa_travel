import 'package:bloc/bloc.dart';
import 'package:bwa_travel/models/destination_model.dart';
import 'package:bwa_travel/services/destination_service.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destination =
          await DestinationService().fetchDestinations();

      emit(DestinationSuccess(destination));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
