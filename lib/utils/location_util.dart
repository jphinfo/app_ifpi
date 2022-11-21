const GOOGLE_API_KEY = 'AIzaSyDBuNOxMlNNmmjNm22FNj0rqkE37BbPAhI';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
