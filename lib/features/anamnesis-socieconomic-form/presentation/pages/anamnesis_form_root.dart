import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/ui/button_app.dart';
import 'package:petct/core/utils/animation_slide_transition.dart';
import 'package:petct/features/anamnesis-socieconomic-form/presentation/pages/anamnesis_socioeconomic_finish_page.dart';
import 'package:petct/features/anamnesis-socieconomic-form/presentation/pages/physical_shape_form.dart';
import 'package:petct/features/anamnesis-socieconomic-form/presentation/widgets/carousel_slider_widget.dart';

class AnamnesisFormRoot extends StatefulWidget {
  @override
  _AnamnesisFormRootState createState() => _AnamnesisFormRootState();
}

class _AnamnesisFormRootState extends State<AnamnesisFormRoot> {
  List<Widget> _formsList;
  int _currentForm;
  double _weight;
  double _heigth;

  @override
  void initState() {
    super.initState();
    _currentForm = 0;
    _formsList = [
      PhysicalShapeForm(),
      PhysicalShapeForm(),
      PhysicalShapeForm(),
      PhysicalShapeForm(),
      PhysicalShapeForm(),
    ];
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: Dimensions.getEdgeInsetsSymetric(context,
          vertical: 100, horizontal: 45),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: _formsList[_currentForm],
          ),
          Column(
            children: [
              CarouselSliderWidget(
                currentIndex: _currentForm,
                totalIndex: _formsList.length,
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(context, 15),
              ),
              Row(
                children: [
                  _currentForm > 0
                      ? Expanded(
                          child: ButtonApp(
                            title: 'Voltar',
                            onPressed: () {
                              setState(() {
                                if (_currentForm > 0) {
                                  _currentForm--;
                                }
                              });
                            },
                            type: ButtonType.BUTTON_WHITE,
                          ),
                        )
                      : Container(),
                  _currentForm < _formsList.length
                      ? Expanded(
                          child: ButtonApp(
                            title: 'Próximo',
                            onPressed: () {
                              setState(() {
                                if (_currentForm < _formsList.length - 1) {
                                  _currentForm++;
                                } else {
                                  Route route = AnimationSlideTransistion(
                                    widget: AnamnesisSocioeconomicFinishPage(),
                                  );
                                  Navigator.push(context, route);
                                }
                              });
                            },
                            type: ButtonType.BUTTON_GREEN,
                          ),
                        )
                      : Container()
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  bool _isValid() {
    if (_currentForm == 0 && (_weight != null && _heigth != null)) {
      print("true");
      return true;
    } else {
      print("false");
      return false;
    }
  }
}
