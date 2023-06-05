import 'package:graphql/client.dart';
import 'package:mototaxis_app/services/graphql_client.dart';

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
        // Prefs.name = (result.data?["login"]["user"]["names"] ?? "") + " " +
        //     (result.data?["login"]["user"]["surnames"] ?? "");
        // Prefs.username = result.data?["login"]["user"]["username"] ?? username;
        // Prefs.roles = ((result.data?["login"]["user"]["roles"]).toString()).replaceAll('[', '').replaceAll(']', '').split('');
        return Response(true, "Ingreso exitoso");
      }
    }
  }
  return Response(false, "");
}
