import '/flutter_flow/flutter_flow_util.dart';
import 'cadastrese_widget.dart' show CadastreseWidget;
import 'package:flutter/material.dart';

class CadastreseModel extends FlutterFlowModel<CadastreseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoController;
  String? Function(BuildContext, String?)? enderecoControllerValidator;
  // State field(s) for emai widget.
  FocusNode? emaiFocusNode;
  TextEditingController? emaiController;
  String? Function(BuildContext, String?)? emaiControllerValidator;
  // State field(s) for senh widget.
  FocusNode? senhFocusNode;
  TextEditingController? senhController;
  late bool senhVisibility;
  String? Function(BuildContext, String?)? senhControllerValidator;
  // State field(s) for confirmarsenha widget.
  FocusNode? confirmarsenhaFocusNode;
  TextEditingController? confirmarsenhaController;
  late bool confirmarsenhaVisibility;
  String? Function(BuildContext, String?)? confirmarsenhaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    senhVisibility = false;
    confirmarsenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoController?.dispose();

    emaiFocusNode?.dispose();
    emaiController?.dispose();

    senhFocusNode?.dispose();
    senhController?.dispose();

    confirmarsenhaFocusNode?.dispose();
    confirmarsenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
