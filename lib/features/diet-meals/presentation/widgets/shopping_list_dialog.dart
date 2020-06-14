import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:petct/features/diet-meals/presentation/models/menu_day_model.dart';
import 'package:petct/features/diet-meals/presentation/pages/pdf_preview_screen.dart';

class ShoppingListDialog extends StatelessWidget {
  final List<MenuDayModel> daysMenu;

  final pdf = pw.Document();

  ShoppingListDialog({Key key, this.daysMenu}) : super(key: key);

  writeOnPdf() {
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(
                level: 0,
                child: pw.Text("Lista de compras"),
              ),
              pw.Paragraph(text: "Dia 1 compre tudo isso")
            ];
          }),
    );
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/petCT_shopping_list.pdf");
    file.writeAsBytes(pdf.save());
  }

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
                          onPressed: () {},
                          type: ButtonType.BUTTON_GREEN,
                          suffixIcon: Icons.share,
                        ),
                        // Download button
                        ButtonApp(
                          title: Strings(context).downloadTitle,
                          onPressed: () async {
                            writeOnPdf();
                            await savePdf();
                            Directory documentDirectory =
                                await getApplicationDocumentsDirectory();

                            String documentPath = documentDirectory.path;
                            String fullPath =
                                "$documentPath/petCT_shopping_list.pdf";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PdfPreviewScreen(path: fullPath),
                              ),
                            );
                          },
                          type: ButtonType.BUTTON_ROUNDED,
                          suffixIcon: Icons.file_download,
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
}
