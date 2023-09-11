import 'package:allay/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'changelog.g.dart';

@riverpod
Future<String> changelog(ChangelogRef ref) async {
  Response response = await Dio().get(
    Allay.changelog,
    options: Options(responseType: ResponseType.plain),
  );
  return response.data;
}
