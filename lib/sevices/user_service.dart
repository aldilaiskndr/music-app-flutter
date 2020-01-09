import 'package:http/http.dart' as http;
import 'package:music_app/constant/data_source_constant.dart';

class UserService{

  static Map<String, String> headers = {};
  http.Response response;

  fetchLogin(credential)async{
    response = await http.post(DataSourceConstant.LOGIN_API, body: credential);
    updateCookie(response);
    return response;
  }
  fetchLogout()async{
    response =  await http.get(DataSourceConstant.LOGOUT_API, headers: headers);
    updateCookie(response);
    return(response);
  }

  updateCookie(http.Response response){
    String rawCookie = response.headers['set-cookie'];
    if(rawCookie!=null){
      int index = rawCookie.indexOf(';');
      headers['cookie'] = (index == -1)? rawCookie : rawCookie.substring(0, index);
      print(headers);
    }
  }
}