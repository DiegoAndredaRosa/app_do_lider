import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/core/app_radio_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import '/core/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_btn_componente_model.dart';
export 'radio_btn_componente_model.dart';

class RadioBtnComponenteWidget extends StatefulWidget {
  const RadioBtnComponenteWidget({
    super.key,
    required this.recebeMembroId,
  });

  final VwGrMembrosRow? recebeMembroId;

  @override
  State<RadioBtnComponenteWidget> createState() =>
      _RadioBtnComponenteWidgetState();
}

class _RadioBtnComponenteWidgetState extends State<RadioBtnComponenteWidget> {
  late RadioBtnComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => RadioBtnComponenteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        color: AppTheme.of(context).alternate,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppRadioButton(
            options: ['Ausente', 'Presente'].toList(),
            onChanged: (val) async {
              safeSetState(() {});
              AppState().removeFromListaMembrosState(DTlistaMembrosStruct(
                nome: widget!.recebeMembroId?.nome,
                idMembro: widget!.recebeMembroId?.membroId,
                radioBtnState: 'Ausente',
                radioBtnmarcado: false,
              ));
              safeSetState(() {});
              AppState().removeFromListaMembrosState(DTlistaMembrosStruct(
                nome: widget!.recebeMembroId?.nome,
                idMembro: widget!.recebeMembroId?.membroId,
                radioBtnState: 'Ausente',
                radioBtnmarcado: true,
              ));
              safeSetState(() {});
              AppState().removeFromListaMembrosState(DTlistaMembrosStruct(
                nome: widget!.recebeMembroId?.nome,
                idMembro: widget!.recebeMembroId?.membroId,
                radioBtnState: 'Presente',
                radioBtnmarcado: true,
              ));
              safeSetState(() {});
              AppState().addToListaMembrosState(DTlistaMembrosStruct(
                nome: widget!.recebeMembroId?.nome,
                idMembro: widget!.recebeMembroId?.membroId,
                radioBtnState: _model.radioBtnPresencaCompValue,
                radioBtnmarcado: true,
              ));
              safeSetState(() {});
            },
            controller: _model.radioBtnPresencaCompValueController ??=
                FormFieldController<String>('Ausente'),
            textStyle: AppTheme.of(context).labelMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: AppTheme.of(context).labelMedium.fontWeight,
                    fontStyle: AppTheme.of(context).labelMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: AppTheme.of(context).labelMedium.fontWeight,
                  fontStyle: AppTheme.of(context).labelMedium.fontStyle,
                ),
            selectedTextStyle: AppTheme.of(context).titleSmall.override(
                  font: GoogleFonts.interTight(
                    fontWeight: AppTheme.of(context).titleSmall.fontWeight,
                    fontStyle: AppTheme.of(context).titleSmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: AppTheme.of(context).titleSmall.fontWeight,
                  fontStyle: AppTheme.of(context).titleSmall.fontStyle,
                ),
            buttonPosition: RadioButtonPosition.left,
            direction: Axis.vertical,
            radioButtonColor: AppTheme.of(context).primary,
            inactiveRadioButtonColor: AppTheme.of(context).secondaryText,
            toggleable: false,
            horizontalAlignment: WrapAlignment.start,
            verticalAlignment: WrapCrossAlignment.start,
          ),
        ],
      ),
    );
  }
}
