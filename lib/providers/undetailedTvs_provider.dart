import 'package:movie_app/data/models/undetailedTv.dart';
import 'package:movie_app/providers/UndetailedData_provider.dart';

class UnDetailedTvs extends UnDetailedData{
  @override
  void getData(result) {
    dataList = result["results"]
        .map((md) => UnDetailedTv.fromJson(md))
        .toList();
  }
}
class PopularTvs extends UnDetailedTvs{}