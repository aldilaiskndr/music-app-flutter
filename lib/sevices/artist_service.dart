import 'package:http/http.dart' as http;
import 'package:music_app/constant/data_source_constant.dart';
import 'package:music_app/sevices/user_service.dart';
class ArtistService{

  fetchArtistsByGenreId(id) async{
    return await http.get(DataSourceConstant.ARTIST_API+id, headers: UserService.headers);
  }
}