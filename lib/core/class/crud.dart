import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Map<String, String> _myheaders = {};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File image,
      [String? nameRequest]) async {
    if (nameRequest == null) {
      nameRequest = "files";
    }
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);
    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(nameRequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
