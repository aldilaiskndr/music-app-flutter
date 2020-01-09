import 'package:http/http.dart' as http;
import 'package:music_app/constant/data_source_constant.dart';
import 'package:music_app/sevices/user_service.dart';
class GenreService{

  fetchAllGenre() async{
    return await http.get(DataSourceConstant.GENRE_API, headers: UserService.headers);
  }
}