import 'package:flutterappdemo/utils/constants.dart';
import 'package:http/http.dart' as http;

/// Serves data to several data repositories.
/// Makes http calls to several services
class ApiService {
  final _client = http.Client();

  Future<http.Response> getDashBoardData() async {
    return _client.get(AppConstants.ROOT_URL);
  }
}
