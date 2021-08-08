import 'package:clean_architecture_getx/data/network/exceptions/custom_exception.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class BaseUserRepositoryRemoteImpl {

  dynamic handleError(Response response) {
    switch (response.statusCode) {
      case 200:
        return;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}