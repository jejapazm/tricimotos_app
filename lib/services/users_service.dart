import 'package:graphql/client.dart';
import 'package:mototaxis_app/models/user_model.dart';
import 'package:mototaxis_app/services/graphql_client.dart';

const _getUsersByRol = r'''
query Users($rol: String) {
  users(rol: $rol) {
    id
    identification
    username
    names
    surnames
    contactNumber
  }
}
''';

const _getUserById = r'''
query User($userId: ID!) {
  user(id: $userId) {
    id
    identification
    username
    names
    surnames
    contactNumber
  }
}
''';

Future<List<User>> getUsersByRol({rol}) async {

  try {

    final GraphQLClient client = getGraphQLClient();

    final options = QueryOptions(
      document: gql(_getUsersByRol),
      variables: <String, dynamic>{"rol": rol},
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      throw Error();
    } else {
      var json = result.data!["users"];
      List<User> users = [];
      for (var res in json) {
        var country = User.fromJson(res);
        users.add(country);
      }
      return users;
    }
  } catch (e) {
    return [];
  }
}

Future<User> getUsersById({id}) async {
  final GraphQLClient client = getGraphQLClient();

  final options = QueryOptions(
    document: gql(_getUserById),
    variables: <String, dynamic>{"userId": id},
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    print(result);
    return throw Error();
  } else {
    var json = result.data!["user"];
    var country = User.fromJson(json);
    print(country);
    return country;
  }
}
