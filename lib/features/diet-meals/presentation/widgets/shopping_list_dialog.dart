import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:petct/features/diet-meals/presentation/models/menu_day_model.dart';
import 'package:petct/features/diet-meals/presentation/pages/pdf_preview_screen.dart';

import 'package:share_extend/share_extend.dart';


class ShoppingListDialog extends StatelessWidget {
  final List<MenuDayModel> daysMenu;

  ShoppingListDialog({Key key, this.daysMenu}) : super(key: key);
  final pdf = pw.Document(deflate: zlib.encode);
  Directory externalDir;
  List<List<String>> list = [
    ["Dia 1", "blalba", "bla"],
    ["Dia 1", "blalba", "bla"],
    ["Dia 1", "blalba", "bla"],
  ];
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double scale, Widget widget) {
        return Transform.scale(
          scale: scale,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                height: Dimensions.getConvertedHeightSize(context, 250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.getConvertedWidthSize(context, 10),
                  ),
                ),
                padding: Dimensions.getEdgeInsets(context,
                    top: 25, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:
                              // Dialog title
                              Text(
                            Strings(context).shoppingList,
                            style: TextStyle(
                              fontSize: Dimensions.getTextSize(context, 22),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // Close dialog icon
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: Dimensions.getConvertedWidthSize(context, 25),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Share button
                        ButtonApp(
                          title: Strings(context).shareTitle,
                          onPressed: () async => _generatePdf(context),
                          type: ButtonType.BUTTON_GREEN,
                          suffixIcon: Icons.share,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Generate Pdf and Share
  _generatePdf(BuildContext context) async {
    pdf.addPage(
      pw.MultiPage(
          build: (c) => [
                pw.Header(text: "Header PetCT"),
                pw.Table.fromTextArray(context: c, data: <List<String>>[
                  <String>["Primeiro dia", "Segundo dia", "Terceiro dia"],
                  ...list.map((item) => [item[0], item[1], item[2]])
                ])
              ]),
    );
    String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/pdf.pdf';
    final File file = File(path);
    file.writeAsBytes(pdf.save());
    ShareExtend.share(path, "file");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfPreviewScreen(path: path),
      ),
    );
  }
}
