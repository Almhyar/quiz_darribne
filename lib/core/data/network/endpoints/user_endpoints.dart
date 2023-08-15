import 'package:quiz/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFulApiUrl('login');
  static String register = NetworkConfig.getFulApiUrl('register');
  static String profile = NetworkConfig.getFulApiUrl('profile/show');

}
