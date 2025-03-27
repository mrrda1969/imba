import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:imba/data/repositories/property_repository.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
import 'property_repository_test.mocks.dart';

void main() {
  late PropertyRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = PropertyRepository(
      dio: mockDio,
      baseUrl: 'https://imba.durihub.co.zw',
    );
  });

  group('PropertyRepository', () {
    test('getAllProperties returns list of properties', () async {
      when(mockDio.get(any)).thenAnswer((_) async => Response(
            data: {
              'message': [
                {
                  'name': 'test-property',
                  'listingName': 'Test Property',
                  'location': 'Test Location',
                  'price': '100',
                  'agent': 'Test Agent',
                  'propertyOwner': 'Test Owner',
                  'service': 'rent',
                  'description': 'Test Description',
                }
              ]
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await repository.getAllProperties();
      expect(result.length, 1);
      expect(result.first.name, 'test-property');
    });
  });
}