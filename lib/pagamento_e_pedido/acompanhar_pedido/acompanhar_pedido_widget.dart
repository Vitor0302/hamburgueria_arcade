import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'acompanhar_pedido_model.dart';
export 'acompanhar_pedido_model.dart';

class AcompanharPedidoWidget extends StatefulWidget {
  const AcompanharPedidoWidget({super.key});

  @override
  State<AcompanharPedidoWidget> createState() => _AcompanharPedidoWidgetState();
}

class _AcompanharPedidoWidgetState extends State<AcompanharPedidoWidget> {
  late AcompanharPedidoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcompanharPedidoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Sanduiches');
            },
          ),
          title: Text(
            'Acompanhar Pedido',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.7, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: Text(
                    'Status do Pedido:',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: 350.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(14.0),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -0.7),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Review:',
                        hintText:
                            'Conte-nos como foi a sua experiência pedindo conosco...',
                        hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                    child: StreamBuilder<List<ProdutoRecord>>(
                      stream: queryProdutoRecord(
                        queryBuilder: (produtoRecord) => produtoRecord.where(
                          'comprado',
                          isEqualTo: true,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ProdutoRecord> buttonProdutoRecordList =
                            snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                            await buttonProdutoRecordList
                                .take(15)
                                .toList()
                                .first
                                .reference
                                .delete();
                          },
                          text: 'Confirmar Entrega',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 53.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
