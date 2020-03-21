
//1
import 'package:covid19lk/networking/network.dart';

const String healthAPIURL = 'https://www.hpb.health.gov.lk/api/get-current-statistical';

class HealthAPI {
    Future<dynamic> getHealthStat() async {
     // 6
    Network network = Network('$healthAPIURL');
    // 7
    var healthData = await network.getData();
    return healthData;
  }
}