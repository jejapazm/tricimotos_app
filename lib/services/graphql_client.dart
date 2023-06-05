import 'package:graphql/client.dart';



GraphQLClient getGraphQLClient() {
  final Link link = HttpLink(
    'http://192.168.1.2:3000/graphql',
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}

