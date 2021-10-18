import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/bloc/profile_bloc.dart';

class ProfilePageViewModel extends BaseViewModel {
  initial() async {
    await profileBloc.fetchProfileData();
  }

  @override
  void dispose() {
    super.dispose();
    profileBloc.dispose();
  }
}
