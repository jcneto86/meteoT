import 'package:Meteo/transacoes/getClima.dart';
import 'package:Meteo/transacoes/mudarCidade.dart';
import 'package:flutter/material.dart';
import 'package:Meteo/util/util.dart' as util;

class MeteoT extends StatefulWidget {
  MeteoT({Key key}) : super(key: key);

  @override
  _MeteoTState createState() => _MeteoTState();
}

class _MeteoTState extends State<MeteoT> {
  String _cidadeIncerida = util.minhaCidade;

  Future _abrirNovaTela(BuildContext context) async {
    Map resultado = await Navigator.of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new MudarCidade();
    }));
    if (resultado != null && resultado.containsKey("cidade")) {
      setState(() {
        _cidadeIncerida = resultado["cidade"];
      });
      debugPrint("Cidade $_cidadeIncerida");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MétéoT"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => _abrirNovaTela(context))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/1406.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _cidadeIncerida,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(140.0),
            child: Container(
              alignment: Alignment.center,
              height: 140.0,
              child: Image.asset("assets/icons/rain.png"),
            ),
          ),
          atualizarTempWidget(_cidadeIncerida)
        ],
      ),
    );
  }

  Widget atualizarTempWidget(String cidade) {
    return FutureBuilder(
      future: getClima(util.appID, cidade == null ? util.minhaCidade : cidade),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map conteudo = snapshot.data;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    "Temperatura: ${conteudo["main"]["temp"].toString()} C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  subtitle: ListTile(
                    title: Text(
                      "Humidade: ${conteudo["main"]["humidity"].toString()} % \n"
                      "Máxima de: ${conteudo["main"]["temp_max"].toString()} C \n"
                      "Minima de: ${conteudo["main"]["temp_min"].toString()} C \n",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            child: Text("Falhou"),
          );
        }
      },
    );
  }
}
