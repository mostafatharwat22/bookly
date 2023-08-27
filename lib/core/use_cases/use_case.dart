import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<type, parameter>{
  Future <Either<Failure, type>> call([parameter param]);
}

class NoParameter{}
