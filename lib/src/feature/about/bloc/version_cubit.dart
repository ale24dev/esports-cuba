import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'version_state.dart';

class VersionCubit extends Cubit<VersionState> {
  VersionCubit() : super(VersionInitial());

  void loadVersion(String version) {
    emit(VersionLoaded(version: version));
  }
}
