import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> uploadImageToCloudinary(File imageFile) async {
  String cloudName = 'dup0vzih4';
  String presetName = 'se7ety';
  // 1. Create the upload URL
  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
  );

  // 2. Create a new multipart request
  final request = http.MultipartRequest('POST', url);

  // 3. Add the upload preset
  request.fields['upload_preset'] = presetName;

  // 4. Add the file to the request
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  try {
    // 5. Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      // 6. Read and decode the response
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);

      // 7. Return the secure URL
      return responseData['secure_url'];
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}