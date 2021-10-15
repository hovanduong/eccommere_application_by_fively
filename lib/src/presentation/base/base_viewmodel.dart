import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? _context;

  BuildContext get context => _context!;

  setContext(BuildContext value) {
    _context = value;
  }

  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
    if (loading) {
      EasyLoading.show(status: "loading".tr);
    } else {
      EasyLoading.dismiss();
    }
  }

  bool get isLoading => loadingSubject.value;

  void showError(String message) {
    EasyLoading.showError(message);
  }

  void showSuccessNotifi(String message) {
    EasyLoading.showSuccess(message);
  }

  void setError(String message) {
    errorSubject.add(message);
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void dispose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.dispose();
  }

  void unFocus() {
    FocusScope.of(context).unfocus();
  }
}
