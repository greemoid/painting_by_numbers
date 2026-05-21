import 'package:dio/dio.dart';
import 'package:paiting_by_numbers/features/home/data/models/painting_response.dart';
import 'package:retrofit/retrofit.dart';

part 'paintings_api.g.dart';

@RestApi()
abstract class PaintingsApi {
  factory PaintingsApi(Dio dio, {String baseUrl}) = _PaintingsApi;

  @GET('artworks/')
  Future<PaintingResponse> getHighlightedPaintings({
    @Query('highlight') int highlight = 1,
    @Query('has_image') int hasImage = 1,
    @Query('skip') int skip = 0,
    @Query('limit') int limit = 20,
  });
}
