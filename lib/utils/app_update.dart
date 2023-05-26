import 'package:in_app_update/in_app_update.dart';

void checkForUpdate() {
  InAppUpdate.checkForUpdate().then((info) {
    _startFlexibleUpdate(info);
  }).catchError((e) {});
}

void _startFlexibleUpdate(AppUpdateInfo info) {
  if (info.updateAvailability == UpdateAvailability.updateAvailable) {
    InAppUpdate.startFlexibleUpdate().then((_) {
      InAppUpdate.completeFlexibleUpdate();
    }).catchError((e) {});
  }
}

Future<bool> isUpdateAvailable() {
  return InAppUpdate.checkForUpdate().then(
    (value) => value.updateAvailability == UpdateAvailability.updateAvailable,
  );
}

void startImmediateUpdate() {
  InAppUpdate.performImmediateUpdate();
}
