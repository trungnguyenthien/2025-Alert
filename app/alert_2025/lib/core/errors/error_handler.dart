import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handleException(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is NoInternetException) {
      return NoInternetFailure();
    } else if (exception is DatabaseException) {
      return DatabaseFailure(exception.message);
    } else {
      return UnknownFailure();
    }
  }
}


// try {
//   final user = await fetchUserFromApi(id);
//   return Right(user);
// } catch (e) {
//   return Left(ErrorHandler.handleException(e));
// }
