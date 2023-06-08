import 'package:graphql/client.dart';
import 'package:mototaxis_app/services/graphql_client.dart';

// import '../global/shared_preferences.dart';

class Response {
  bool ok;
  String message;
  Response(this.ok, this.message);
}

Future<Response> createUser({username, password, names, surnames, rol,
    identification, contactNumber}) async {
  final GraphQLClient client = getGraphQLClient();

  final options = MutationOptions(
    document: gql(
      r'''
        mutation CreateUser($createUserInput: CreateUserInput!) {
          createUser(createUserInput: $createUserInput) {
            id
            username
            names
            surnames
            identification
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'createUserInput': {
        'username': username,
        'password': password,
        'names': names,
        'surnames': surnames,
        'rol': rol,
        'identification': identification,
        'contactNumber': contactNumber
      }
    },
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print('${result.exception?.raw?[0]?["extensions"]["response"]["message"]}');
    return Response(false, "Usuario o contraseña incorrectos");
  } else {
    if (result.data != null) {
      if (result.data?["createUser"]["id"] != null) {
        print('OOOOOOOOOOOO');
        // Prefs.name = (result.data?["login"]["names"] ?? "") +
        //     " " +
        //     (result.data?["login"]["surnames"] ?? "");
        // //     (result.data?["login"]["user"]["surnames"] ?? "");
        // // Prefs.username = result.data?["login"]["user"]["username"] ?? username;
        // Prefs.rol = result.data?["login"]["rol"];
        return Response(true, "Ingreso exitoso");
      }
    }
  }
  return Response(false, "");
}
