import 'package:waleed_clean_arch_1/entities/user_domain.dart';

abstract class UserRepository{
  Future<List<UserDomain>> getUsers();
}