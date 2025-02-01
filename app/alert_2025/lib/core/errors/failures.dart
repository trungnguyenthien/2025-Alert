import 'package:equatable/equatable.dart';

// Lớp trừu tượng cho tất cả các lỗi
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Lỗi từ server (API)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// Lỗi khi không có kết nối Internet
class NoInternetFailure extends Failure {
  const NoInternetFailure() : super("No internet connection");
}

// Lỗi khi thao tác với database (SQLite, Hive, v.v.)
class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

// Lỗi không xác định
class UnknownFailure extends Failure {
  const UnknownFailure() : super("An unknown error occurred");
}

// Future<Either<Failure, User>> getUser(String id) async {
//   try {
//     final response = await api.getUserById(id);
//     return Right(response);
//   } on DioError catch (e) {
//     return Left(ServerFailure(e.message));
//   } catch (e) {
//     return Left(UnknownFailure());
//   }
// }
