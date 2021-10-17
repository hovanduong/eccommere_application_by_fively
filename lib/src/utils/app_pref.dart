import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

class AppPref {
  AppPref._();

  static final GetStorage _box = GetStorage('AppPref');

  static final BehaviorSubject _userBehavior = BehaviorSubject<dynamic>();

  static initListener() async {
    await GetStorage.init("AppPref");
    _box.writeIfNull("appTheme", 0);
    _box.listenKey('user', (user) {
      _userBehavior.add(user);
    });
  }

  static set accessToken(String? token) => _box.write('accessToken', token);
  static String? get accessToken => _box.read('accessToken');

  static set firstInstallApp(int time) => _box.write('firstInstall', time);
  static int get firstInstallApp => _box.read('firstInstall');

  static set firstName(String firstName) => _box.write("firstName", firstName);
  static String get firstName => _box.read("firstName");

  static set lastName(String firstName) => _box.write("lastName", firstName);
  static String get lastName => _box.read("lastName");

  static set themeValue(int theme) => _box.write("appTheme", theme);
  static int get themeValue => _box.read("appTheme");

  static Stream get watchUser => _userBehavior.stream;
}
