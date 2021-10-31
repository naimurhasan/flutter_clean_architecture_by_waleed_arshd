import 'package:waleed_clean_arch_1/abstractions/user_repository.dart';
import 'package:waleed_clean_arch_1/entities/user_domain.dart';

class FirebaseUserRepository implements UserRepository{
  @override
  Future<List<UserDomain>> getUsers() async{
    return Future.value(<UserDomain>[
      UserDomain(id: 1, name: 'Fire1', email: 'fire1@email.com'),
    ]);
  }

}