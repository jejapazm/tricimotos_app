import 'package:graphql/client.dart';



GraphQLClient getGraphQLClient() {

  final link = HttpLink('http://192.168.1.9:3000/graphql');

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

}
