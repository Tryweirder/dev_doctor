import 'package:dev_doctor/courses/part/item.dart';
import 'package:dev_doctor/courses/part/layout.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc.dart';

class CoursePartModule extends Module {
  static Inject get to => Inject<CoursePartModule>();
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/item', child: (_, args) => PartItemLayout(), children: [
          ChildRoute('',
              child: (_, args) =>
                  PartItemPage(itemId: int.parse(args?.queryParams['itemId'] ?? '0')))
        ]),
      ];

  @override
  List<Bind<Object>> get binds => [Bind.singleton((i) => CoursePartBloc())];
}
