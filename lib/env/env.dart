import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'TMDB_KEY', obfuscate: true)
  static String tmdbKey = _Env.tmdbKey;
}
