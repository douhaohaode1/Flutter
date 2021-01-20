
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'decontamintaion_model.dart';
import 'decontamintaion_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) =>
      DecontamintaionViewModel(
        DecontamintaionModle(
            upn:'',
            description: '',
            serial: '',
            unitTypeCode: "",
            statusCode: "",
            reasonCode: "",
            comment: '',
        ),
      ),
  )
];