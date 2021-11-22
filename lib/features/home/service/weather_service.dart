import 'package:chopper/chopper.dart';
import 'package:weather_app/features/home/service/http_interceptor/header_interceptor.dart';

part 'weather_service.chopper.dart';

@ChopperApi()
abstract class WeatherService extends ChopperService {
  @Get(path: '/onecall')
  Future<Response> getOneCallWeather(
    @Query('lat') double lat,
    @Query('lon') double lon,
  );

  @Get(path: '/weather')
  Future<Response> getCurrentWeatherByPlaceName(@Query('q') String query);

  static WeatherService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      services: [
        _$WeatherService(),
      ],
      interceptors: [
        HeaderInterceptor(),
      ],
    );

    return _$WeatherService(client);
  }
}
