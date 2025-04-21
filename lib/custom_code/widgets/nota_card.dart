// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NotaCard extends StatefulWidget {
  const NotaCard({
    super.key,
    this.width,
    this.height,
    this.titulo,
    this.conteudo,
    this.onTap,
  });

  final double? width;
  final double? height;
  final String? titulo;
  final String? conteudo;
  final Future Function()? onTap;

  @override
  State<NotaCard> createState() => _NotaCardState();
}

class _NotaCardState extends State<NotaCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
