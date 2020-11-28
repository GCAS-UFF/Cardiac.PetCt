import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:petct/core/resources/colors.dart';
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
                height: Dimensions.getConvertedHeightSize(context, 200),
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
                            style: GoogleFonts.montserrat(
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
      pw.Page(build: (c) {
        return pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          children: <pw.Widget>[
            pw.Container(
              margin: pw.EdgeInsets.only(bottom: 20),
              padding: pw.EdgeInsets.only(bottom: 10),
              decoration: pw.BoxDecoration(
                border: pw.BoxBorder(
                  width: 2,
                  bottom: true,
                  color: PdfColor.fromInt(ColorsApp.greenApp.value),
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Text(
                    Strings(context).shoppingListPdfTitle,
                    style: pw.TextStyle(
                      fontSize: Dimensions.getTextSize(context, 22),
                    ),
                  ),
                ],
              ),
            ),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: <pw.Widget>[
                pw.Container(
                  width: 220,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            margin: pw.EdgeInsets.only(bottom: 10),
                            padding: pw.EdgeInsets.only(bottom: 5),
                            width: 220,
                            decoration: pw.BoxDecoration(
                              border: pw.BoxBorder(
                                width: 2,
                                bottom: true,
                                color:
                                    PdfColor.fromInt(ColorsApp.greenApp.value),
                              ),
                            ),
                            child: pw.Text(
                              Strings(context).shoppingListPdfEggAndMeat,
                              style: pw.TextStyle(
                                fontSize: Dimensions.getTextSize(context, 20),
                              ),
                            ),
                          ),
                          for (int i = 0; i < daysMenu[0].meals.length; i++)
                            for (int j = 0;
                                j < daysMenu[0].meals[i].mealItens.length;
                                j++)
                              pw.Container(
                                width: 220,
                                padding: pw.EdgeInsets.only(bottom: 3),
                                margin: pw.EdgeInsets.only(bottom: 5),
                                decoration: pw.BoxDecoration(
                                  border: pw.BoxBorder(
                                    width: 2,
                                    bottom: true,
                                    color: PdfColor.fromInt(Colors.grey.value),
                                  ),
                                ),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      daysMenu[0].meals[i].mealItens[j].name,
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                    pw.Text(
                                      daysMenu[0]
                                          .meals[i]
                                          .mealItens[j]
                                          .maximumQuantity
                                          .toString(),
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      pw.SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 10),
                      ),
                      pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            margin: pw.EdgeInsets.only(bottom: 10),
                            padding: pw.EdgeInsets.only(bottom: 5),
                            width: 220,
                            decoration: pw.BoxDecoration(
                              border: pw.BoxBorder(
                                width: 2,
                                bottom: true,
                                color:
                                    PdfColor.fromInt(ColorsApp.greenApp.value),
                              ),
                            ),
                            child: pw.Text(
                              Strings(context).shoppingListPdfVegetables,
                              style: pw.TextStyle(
                                fontSize: Dimensions.getTextSize(context, 20),
                              ),
                            ),
                          ),
                          for (int i = 0; i < daysMenu[0].meals.length; i++)
                            for (int j = 0;
                                j < daysMenu[0].meals[i].mealItens.length;
                                j++)
                              pw.Container(
                                width: 220,
                                padding: pw.EdgeInsets.only(bottom: 3),
                                margin: pw.EdgeInsets.only(bottom: 5),
                                decoration: pw.BoxDecoration(
                                  border: pw.BoxBorder(
                                    width: 2,
                                    bottom: true,
                                    color: PdfColor.fromInt(Colors.grey.value),
                                  ),
                                ),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      daysMenu[0].meals[i].mealItens[j].name,
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                    pw.Text(
                                      daysMenu[0]
                                          .meals[i]
                                          .mealItens[j]
                                          .maximumQuantity
                                          .toString(),
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  width: 220,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: <pw.Widget>[
                      pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            margin: pw.EdgeInsets.only(bottom: 10),
                            padding: pw.EdgeInsets.only(bottom: 5),
                            width: 220,
                            decoration: pw.BoxDecoration(
                              border: pw.BoxBorder(
                                width: 2,
                                bottom: true,
                                color:
                                    PdfColor.fromInt(ColorsApp.greenApp.value),
                              ),
                            ),
                            child: pw.Text(
                              Strings(context).shoppingListPdfOils,
                              style: pw.TextStyle(
                                fontSize: Dimensions.getTextSize(context, 20),
                              ),
                            ),
                          ),
                          for (int i = 0; i < daysMenu[0].meals.length; i++)
                            for (int j = 0;
                                j < daysMenu[0].meals[i].mealItens.length;
                                j++)
                              pw.Container(
                                width: 220,
                                padding: pw.EdgeInsets.only(bottom: 3),
                                margin: pw.EdgeInsets.only(bottom: 5),
                                decoration: pw.BoxDecoration(
                                  border: pw.BoxBorder(
                                    width: 2,
                                    bottom: true,
                                    color: PdfColor.fromInt(Colors.grey.value),
                                  ),
                                ),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      daysMenu[0].meals[i].mealItens[j].name,
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                    pw.Text(
                                      daysMenu[0]
                                          .meals[i]
                                          .mealItens[j]
                                          .maximumQuantity
                                          .toString(),
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      pw.SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 10),
                      ),
                      pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            margin: pw.EdgeInsets.only(bottom: 10),
                            padding: pw.EdgeInsets.only(bottom: 5),
                            width: 220,
                            decoration: pw.BoxDecoration(
                              border: pw.BoxBorder(
                                width: 2,
                                bottom: true,
                                color:
                                    PdfColor.fromInt(ColorsApp.greenApp.value),
                              ),
                            ),
                            child: pw.Text(
                              Strings(context).shoppingListPdfOilSeeds,
                              style: pw.TextStyle(
                                fontSize: Dimensions.getTextSize(context, 20),
                              ),
                            ),
                          ),
                          for (int i = 0; i < daysMenu[0].meals.length; i++)
                            for (int j = 0;
                                j < daysMenu[0].meals[i].mealItens.length;
                                j++)
                              pw.Container(
                                width: 220,
                                padding: pw.EdgeInsets.only(bottom: 3),
                                margin: pw.EdgeInsets.only(bottom: 5),
                                decoration: pw.BoxDecoration(
                                  border: pw.BoxBorder(
                                    width: 2,
                                    bottom: true,
                                    color: PdfColor.fromInt(Colors.grey.value),
                                  ),
                                ),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      daysMenu[0].meals[i].mealItens[j].name,
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                    pw.Text(
                                      daysMenu[0]
                                          .meals[i]
                                          .mealItens[j]
                                          .maximumQuantity
                                          .toString(),
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                      pw.SizedBox(
                        height: Dimensions.getConvertedHeightSize(context, 10),
                      ),
                      pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            margin: pw.EdgeInsets.only(bottom: 10),
                            padding: pw.EdgeInsets.only(bottom: 5),
                            width: 220,
                            decoration: pw.BoxDecoration(
                              border: pw.BoxBorder(
                                width: 2,
                                bottom: true,
                                color:
                                    PdfColor.fromInt(ColorsApp.greenApp.value),
                              ),
                            ),
                            child: pw.Text(
                              Strings(context).shoppingListPdfLiquids,
                              style: pw.TextStyle(
                                fontSize: Dimensions.getTextSize(context, 20),
                              ),
                            ),
                          ),
                          for (int i = 0; i < daysMenu[0].meals.length; i++)
                            for (int j = 0;
                                j < daysMenu[0].meals[i].mealItens.length;
                                j++)
                              pw.Container(
                                width: 220,
                                padding: pw.EdgeInsets.only(bottom: 3),
                                margin: pw.EdgeInsets.only(bottom: 5),
                                decoration: pw.BoxDecoration(
                                  border: pw.BoxBorder(
                                    width: 2,
                                    bottom: true,
                                    color: PdfColor.fromInt(Colors.grey.value),
                                  ),
                                ),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      daysMenu[0].meals[i].mealItens[j].name,
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                    pw.Text(
                                      daysMenu[0]
                                          .meals[i]
                                          .mealItens[j]
                                          .maximumQuantity
                                          .toString(),
                                      style: pw.TextStyle(
                                        fontSize:
                                            Dimensions.getTextSize(context, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
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
