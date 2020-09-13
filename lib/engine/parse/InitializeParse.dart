import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> initializeParse() async {
  await Parse().initialize(
    'wBdXvgaffgmDGLh0RoJDZIcEc0m50RVqa1QygldB',
    'https://parseapi.back4app.com/',
    clientKey: 'wLchgiXQgLb7sp3aQSGRZMF3l16kmU0CaDGv397F',
    autoSendSessionId: true,
    debug: true,
  );
}
