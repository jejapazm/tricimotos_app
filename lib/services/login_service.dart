import 'package:graphql/client.dart';
import 'package:mototaxis_app/services/graphql_client.dart';

import '../global/shared_preferences.dart';

class Response {
  bool ok;
  String message;

  Response(this.ok, this.message);
}

Future<Response> login(username, password) async {
  final GraphQLClient client = getGraphQLClient();

  final options = MutationOptions(
    document: gql(
      r'''
        mutation Login($loginInput: LoginInput!) {
          login(loginInput: $loginInput) {
            id
            names
            surnames
            rol
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'loginInput': {"username": username, "password": password},
    },
  );
  

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('${result.exception?.raw?[0]?["extensions"]["response"]["message"]}');
    return Response(false, "Usuario o contraseña incorrectos");
  } else {
    if (result.data != null) {
      if (result.data?["login"]["id"] != null) {
        Prefs.name = (result.data?["login"]["names"] ?? "") + " " + (result.data?["login"]["surnames"] ?? "");
        //     (result.data?["login"]["user"]["surnames"] ?? "");
        // Prefs.username = result.data?["login"]["user"]["username"] ?? username;
        Prefs.rol = result.data?["login"]["rol"];
        return Response(true, "Ingreso exitoso");
      }
    }
  }
  return Response(false, "");
}
