import 'package:local_auth/local_auth.dart';

class TouchIdUtil {
  final LocalAuthentication _auth = LocalAuthentication();
  Future<bool> isActive() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;

    if (!canCheckBiometrics) {
      return false;
    }

    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    return availableBiometrics.contains(BiometricType.fingerprint);
  }

  Future<bool> auth() async {
    try {
      return await _auth.authenticateWithBiometrics(
        localizedReason: 'Scan Your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on Exception catch (e) {
      return false;
    }
  }
}
