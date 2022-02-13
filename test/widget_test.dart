import 'package:dio/dio.dart';
import 'package:farm_setu_assignment/blocs/initial_bloc/initial_bloc.dart';
import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:farm_setu_assignment/shared/models/weather_daily.dart';
import 'package:farm_setu_assignment/shared/models/weather_model.dart';
import 'package:farm_setu_assignment/utils/constants.dart';
import 'package:farm_setu_assignment/utils/helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

import 'data.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';

//MOKITO FOR MOCKING API CALLS
class MockDioClient extends Mock implements Dio {}

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  dio.httpClientAdapter = dioAdapter;

  const path = 'https://$BASEURL';

//MOCKING WEATHER API CALL AND SENDING SAVED DATA
  dioAdapter.onGet(
      path,
      (request) async => Response(
          data: weatherTestData.weatherdata,
          statusCode: 200,
          requestOptions: RequestOptions(path: path + "/weather")));

//MOCKING DAILY FORECAST API CALL AND SENDING SAVED DATA
  dioAdapter.onGet(
      path,
      (request) async => Response(
          data: weatherTestData.weatherDailyData,
          statusCode: 200,
          requestOptions: RequestOptions(path: path + "/onecall")));

  // .reply(200, {'message': 'Successfully mocked GET!'})
  // .onPost(path)
  // .reply(200, {'message': 'Successfully mocked POST!'});

  final onGetResponse = await dio.get(path);
  print(onGetResponse.data); // {message: Successfully mocked GET!}

  final onPostResponse = await dio.post(path);
  print(onPostResponse.data);

  group('helper function test', () {
    test('test getDateFromString', () {
      //input
      var date = parseTimeStamp(1644769619);

      //assert
      expect(date, '13 Feb');
    });

    test('test getDateFromString', () {
      DateTime s = DateTime(2022, 2, 13);
      var date = parseTimeStampToLinux(s);

      expect(date, 1644690600);
    });
  });

  group('PODO Model Test', () {
    //load model

    test('Weather Daily Model Parsing Test', () {
      WeatherModel x = WeatherModel.fromJson(weatherTestData.weatherdata);

      expect(x.name, "Mandlā");
      expect(x.weather?[0].main, "Clear");
      expect(x.weather?[0].description, "clear sky");

      expect(x.base, 'stations');
      expect(x.main?.feelsLike, 14.58);
      expect(x.main?.humidity, 23);
      expect(x.sys?.country, 'IN');
      expect(x.dt, 1644770537);
    });

    test('Weather Forcast Model Parsing Test', () {
      WeatherDailyModel x =
          WeatherDailyModel.fromJson(weatherTestData.weatherDailyData);

      expect(x.timezone, "Asia/Kolkata");
      expect(x.daily?[0].temp?.day, 24.91);
      expect(x.daily?[1].feelsLike?.day, 26.62);
      expect(x.daily?[2].pressure, 1012);
      expect(x.daily?[2].weather?[0].main, 'Clear');
      expect(x.daily?[2].pressure, 1012);
      expect(x.daily?[2].uvi, 7.54);
      expect(x.daily?[2].pop, 0);
    });

// INIT BLOC STATE TEST
    group('Init Bloc Testing', () async {
      test('Initial Loading should be true in starting', () async {
        // initialBloc

        expect(initialBloc.loadingController.value, true);

        // await initialBloc.checkForData();
        // expect(initialBloc.loadingController.value, false);
      });
    });
  });

  // WEATHER BLOC STATE TEST
  group('Weather Bloc Testing', () {
    test('Weather Loading and history loading should be true in starting', () {
      expect(weatherBloc.loadingController.value, true);
      expect(weatherBloc.historyLoadingController.value, true);
      expect(weatherBloc.latestWeather, null);
      expect(weatherBloc.weatherDaily, null);
    });
  });

//widget testing

  // testWidgets('Widget Testing', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  //TEARDOWN FOR DIO

  tearDown(() {
    dio.clear();
    dio.close();
    // dioAdapterMock.close(force: true);
  });
}
