import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(title: 'WORDLE ES'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstChar = TextEditingController();
  TextEditingController secondChar = TextEditingController();
  TextEditingController thirdChar = TextEditingController();
  TextEditingController forthChar = TextEditingController();
  TextEditingController fifthtChar = TextEditingController();
  String currentWord = "";
  List<Widget> notCorrectWords = [];
  ConfettiController controllerConfetti =
      ConfettiController(duration: const Duration(seconds: 2));
  List<String> valores = [
    "salir",
    "tener",
    "tocar",
    "golpe",
    "hacer",
    "nuevo",
    "deseo",
    "apoyo",
    "unico",
    "valor",
    "poder",
    "crear",
    "segun",
    "miedo",
    "perro",
    "subir",
    "orden",
    "mucho",
    "saber",
    "comer",
    "tomar",
    "largo",
    "pedir",
    "sacar",
    "poner",
    "causa",
    "amigo",
    "bajar",
    "mujer",
    "vacio",
    "karma",
    "armar",
    "parte",
    "mundo",
    "nivel",
    "mejor",
    "grupo",
    "feliz",
    "donde",
    "hecho",
    "jugar",
    "decir",
    "carta",
    "dulce",
    "bella",
    "claro",
    "final",
    "mayor",
    "luego",
    "snack",
    "bueno",
    "regla",
    "lugar",
    "etapa",
    "sabio",
    "antes",
    "forma",
    "dejar",
    "mirar",
    "exito",
    "tenaz",
    "soñar",
    "coger",
    "tarea",
    "calma",
    "ayuda",
    "ahora",
    "viaje",
    "deber",
    "cerca",
    "ideal",
    "norma",
    "falta",
    "dicha",
    "lleno",
    "hueco",
    "tanto",
    "campo",
    "nunca",
    "papel",
    "girar",
    "habil",
    "frase",
    "suave",
    "punto",
    "libro",
    "volar",
    "dueño",
    "señal",
    "union",
    "otoño",
    "lento",
    "salud",
    "dotar",
    "tarde",
    "debil",
    "libre",
    "arbol",
    "facil",
    "culpa",
    "comun",
    "pasar",
    "dolor",
    "breve",
    "animo",
    "friki",
    "yerno",
    "flujo",
    "lindo",
    "capaz",
    "venta",
    "cielo",
    "ojala",
    "haber",
    "traer",
    "pluma",
    "abrir",
    "viejo",
    "matar",
    "banal",
    "local",
    "icono",
    "flaco",
    "oveja",
    "epoca",
    "labor",
    "rumbo",
    "globo",
    "total",
    "grito",
    "spray",
    "ebano",
    "firme",
    "denso",
    "pobre",
    "copia",
    "señor",
    "estar",
    "igual",
    "mania",
    "osado",
    "vivir",
    "gordo",
    "senda",
    "chico",
    "futil",
    "ciego",
    "vasto",
    "clase",
    "temor",
    "parar",
    "pagar",
    "creer",
    "serio",
    "veloz",
    "lejos",
    "mismo",
    "honor",
    "optar",
    "etica",
    "sobre",
    "basar",
    "morir",
    "razon",
    "medio",
    "audaz",
    "jamas",
    "ufano",
    "error",
    "color",
    "motor",
    "curar",
    "joven",
    "ocaso",
    "parco",
    "dieta",
    "suelo",
    "justo",
    "corte",
    "plano",
    "burdo",
    "ganar",
    "echar",
    "grave",
    "grato",
    "broma",
    "gente",
    "pieza",
    "acido",
    "sucio",
    "visto",
    "ajeno",
    "gozar",
    "texto",
    "culto",
    "donar",
    "furor",
    "queja",
    "corto",
    "clave",
    "durar",
    "sueño",
    "usted",
    "brisa",
    "valla",
    "hogar",
    "fondo",
    "obvio",
    "gusto",
    "bello",
    "meter",
    "nacer",
    "cauto",
    "listo",
    "sello",
    "medir",
    "mover",
    "guapa",
    "hasta",
    "arido",
    "fluir",
    "rueda",
    "pausa",
    "lecho",
    "tonto",
    "celos",
    "legal",
    "casta",
    "aroma",
    "stock",
    "pegar",
    "punta",
    "dicho",
    "cinta",
    "pasto",
    "beber",
    "ciclo",
    "regar",
    "padre",
    "turno",
    "noche",
    "playa",
    "danza",
    "calor",
    "juego",
    "andar",
    "logro",
    "lucha",
    "bingo",
    "oasis",
    "robar",
    "niños",
    "tejer",
    "recto",
    "azada",
    "madre",
    "negro",
    "grado",
    "verde",
    "sumar",
    "agrio",
    "resta",
    "lider",
    "voraz",
    "enojo",
    "vicio",
    "pesar",
    "pelea",
    "fruto",
    "epico",
    "cerdo",
    "burla",
    "falso",
    "cifra",
    "actor",
    "fijar",
    "burro",
    "dudar",
    "junto",
    "carro",
    "monte",
    "deuda",
    "huevo",
    "signo",
    "tapar",
    "tenue",
    "sutil",
    "mente",
    "cargo",
    "pisar",
    "rubro",
    "pista",
    "clima",
    "clara",
    "algun",
    "motin",
    "costa",
    "trama",
    "movil",
    "fauna",
    "linda",
    "trato",
    "notar",
    "marco",
    "axial",
    "zorro",
    "pulso",
    "noble",
    "obrar",
    "rigor",
    "obeso",
    "linea",
    "regir",
    "vital",
    "calle",
    "ruido",
    "serie",
    "iluso",
    "favor",
    "topar",
    "autor",
    "guiar",
    "veraz",
    "tirar",
    "ancho",
    "sagaz",
    "shock",
    "dosis",
    "drama",
    "ceder",
    "barco",
    "curso",
    "busca",
    "rogar",
    "guapo",
    "fuera",
    "dañar",
    "elite",
    "prado",
    "marca",
    "cruel",
    "ritmo",
    "avaro",
    "docto",
    "staff",
    "idolo",
    "omiso",
    "chica",
    "curva",
    "jaula",
    "llama",
    "velar",
    "ojota",
    "bahia",
    "avido",
    "ebrio",
    "urdir",
    "baile",
    "nueva",
    "yacer",
    "tenia",
    "stand",
    "gesto",
    "citar",
    "valle",
    "ahito",
    "nicho",
    "silla",
    "ganas",
    "sitio",
    "ceñir",
    "negar",
    "vigor",
    "vuelo",
    "docil",
    "bravo",
    "lista",
    "vista",
    "chapa",
    "cueva",
    "cesar",
    "firma",
    "fuego",
    "usado",
    "pacto",
    "letal",
    "flojo",
    "usual",
    "ameno",
    "lucir",
    "buena",
    "pilar",
    "necio",
    "habla",
    "hacia",
    "huida",
    "tumba",
    "duelo",
    "astro",
    "venir",
    "lapiz",
    "canon",
    "jalar",
    "avion",
    "magia",
    "unido",
    "banco",
    "pompa",
    "aquel",
    "agudo",
    "moral",
    "torpe",
    "furia",
    "hobby",
    "aviso",
    "apice",
    "tesis",
    "arduo",
    "digno",
    "rabia",
    "obito",
    "abuso",
    "norte",
    "rival",
    "ojear",
    "genio",
    "faena",
    "raudo",
    "ozono",
    "trozo",
    "valer",
    "ijada",
    "herir",
    "temer",
    "paseo",
    "tapia",
    "apego",
    "salon",
    "coche",
    "fallo",
    "vejez",
    "hielo",
    "socio",
    "rural",
    "resto",
    "sanar",
    "cerro",
    "carga",
    "techo",
    "parca",
    "horda",
    "mando",
    "ileso",
    "legar",
    "ligar",
    "rasgo",
    "yerro",
    "humor",
    "terco",
    "mojar",
    "tosco",
    "opaco",
    "sabor",
    "lobby",
    "cagar",
    "leche",
    "pleno",
    "heroe",
    "senil",
    "yermo",
    "cabal",
    "pared",
    "feroz",
    "alzar",
    "pavor",
    "poeta",
    "ojera",
    "gasto",
    "otear",
    "ansia",
    "venia",
    "canal",
    "soler",
    "mitad",
    "atrio",
    "bruto",
    "caida",
    "pauta",
    "beodo",
    "etnia",
    "bogar",
    "cutre",
    "metal",
    "lucro",
    "droga",
    "borde",
    "surco",
    "harto",
    "dogma",
    "susto",
    "pulir",
    "nieve",
    "menos",
    "raspa",
    "costo",
    "rezar",
    "falaz",
    "sudar",
    "parra",
    "ganso",
    "novio",
    "tedio",
    "presa",
    "toque",
    "lapso",
    "cajon",
    "salto",
    "koala",
    "fosil",
    "amado",
    "media",
    "santo",
    "relax",
    "lavar",
    "menor",
    "ninfa",
    "molde",
    "doble",
    "simil",
    "chino",
    "catar",
    "falla",
    "jerga",
    "alado",
    "navio",
    "rayar",
    "bruja",
    "ruina",
    "raton",
    "radio",
    "errar",
    "rozar",
    "barro",
    "letra",
    "super",
    "lycra",
    "diosa",
    "regio",
    "quedo",
    "verbo",
    "aunar",
    "tenso",
    "balon",
    "prisa",
    "obice",
    "rumor",
    "plazo",
    "zurdo",
    "Jesus",
    "carne",
    "rango",
    "poema",
    "secar",
    "besar",
    "odiar",
    "angel",
    "picar",
    "idear",
    "jiron",
    "reino",
    "niñez",
    "llave",
    "plato",
    "nuera",
    "tumor",
    "anexo",
    "basto",
    "fatal",
    "caber",
    "hilar",
    "ayuno",
    "atroz",
    "ideas",
    "truco",
    "rocio",
    "banda",
    "ardid",
    "boton",
    "turba",
    "circo",
    "envio",
    "plaza",
    "gruta",
    "vapor",
    "hueso",
    "hurto",
    "mutuo",
    "cisma",
    "junta",
    "enano",
    "semen",
    "bolso",
    "selva",
    "rampa",
    "atras",
    "garbo",
    "oeste",
    "virus",
    "matiz",
    "reves",
    "rodar",
    "catre",
    "extra",
    "ejote",
    "acero",
    "llano",
    "porte",
    "fugaz",
    "mitin",
    "rollo",
    "vagar",
    "botar",
    "salvo",
    "feria",
    "multa",
    "teñir",
    "timon",
    "fatuo",
    "callo",
    "torre",
    "impar",
    "otero",
    "flora",
    "untar",
    "cavar",
    "vedar",
    "ujier",
    "pugna",
    "gesta",
    "batir",
    "zafio",
    "tacto",
    "urgir",
    "nimio",
    "heces",
    "probo",
    "manso",
    "short",
    "telar",
    "mueca",
    "fibra",
    "vetar",
    "ronda",
    "traje",
    "vivaz",
    "casar",
    "peste",
    "coste",
    "aovar",
    "trino",
    "nadar",
    "abajo",
    "treta",
    "verso",
    "bolsa",
    "traba",
    "polvo",
    "coser",
    "bulto",
    "barra",
    "quiza",
    "disco",
    "pasta",
    "tañer",
    "arena",
    "plaga",
    "yelmo",
    "aereo",
    "bulla",
    "pudor",
    "reina",
    "hosco",
    "coito",
    "mimar",
    "novel",
    "votar",
    "monje",
    "atajo",
    "vacuo",
    "fecha",
    "hedor",
    "azote",
    "atado",
    "berma",
    "cuota",
    "espia",
    "curvo",
    "vejar",
    "oxear",
    "ruego",
    "orate",
    "haren",
    "malla",
    "mixto",
    "parir",
    "cirio",
    "choza",
    "kefir",
    "indio",
    "rubio",
    "barca",
    "manar",
    "brazo",
    "patio",
    "sesgo",
    "nariz",
    "mamar",
    "atril",
    "golfo",
    "grano",
    "ajado",
    "yerba",
    "exodo",
    "pasmo",
    "cruce",
    "gueto",
    "tribu",
    "ataud",
    "tutor",
    "cegar",
    "sobra",
    "impio",
    "trazo",
    "cazar",
    "prosa",
    "pillo",
    "valia",
    "crudo",
    "gemir",
    "rugir",
    "morro",
    "panel",
    "himno",
    "asear",
    "ardor",
    "bañar",
    "perla",
    "istmo",
    "cauce",
    "utero",
    "pinta",
    "barba",
    "helar",
    "okupa",
    "buque",
    "tenis",
    "dardo",
    "arder",
    "tabla",
    "brote",
    "censo",
    "lanza",
    "finca",
    "fruta",
    "trago",
    "bando",
    "torta",
    "rodeo",
    "quema",
    "pecho",
    "sopor",
    "araña",
    "tieso",
    "sudor",
    "vario",
    "civil",
    "yogur",
    "funda",
    "latir",
    "reñir",
    "cenit",
    "manta",
    "gnomo",
    "falda",
    "raido",
    "hebra",
    "ocupa",
    "recio",
    "musgo",
    "bruma",
    "minar",
    "oreja",
    "zanja",
    "preso",
    "apodo",
    "tasar",
    "timar",
    "macho",
    "gorra",
    "rapto",
    "coral",
    "asilo",
    "plata",
    "saldo",
    "savia",
    "casto",
    "canto",
    "nylon",
    "prole",
    "colar",
    "robot",
    "calvo",
    "moler",
    "uvula",
    "rehen",
    "temas",
    "hondo",
    "cariz",
    "cesta",
    "persa",
    "nimbo",
    "farsa",
    "falto",
    "bomba",
    "pañal",
    "peaje",
    "tropa",
    "bicho",
    "laico",
    "saeta",
    "grasa",
    "perra",
    "placa",
    "brezo",
    "clavo",
    "lerdo",
    "terso",
    "halar",
    "acoso",
    "abono",
    "aliar",
    "etico",
    "rotar",
    "añejo",
    "buril",
    "ducha",
    "efebo",
    "yerto",
    "jaleo",
    "cuero",
    "chulo",
    "tallo",
    "canoa",
    "monto",
    "porno",
    "yunta",
    "celda",
    "agape",
    "porra",
    "primo",
    "yegua",
    "acaso",
    "casco",
    "farol",
    "frito",
    "galan",
    "guisa",
    "fuero",
    "desde",
    "trapo",
    "labio",
    "mareo",
    "zafar",
    "trono",
    "judio",
    "ganga",
    "usura",
    "calar",
    "soplo",
    "naipe",
    "zaino",
    "penar",
    "cable",
    "aleta",
    "mecha",
    "emulo",
    "domar",
    "fiera",
    "aojar",
    "monja",
    "fardo",
    "junco",
    "viril",
    "axila",
    "cubil",
    "pollo",
    "llaga",
    "talud",
    "solaz",
    "pardo",
    "colmo",
    "limar",
    "oidor",
    "tibia",
    "cuate",
    "sorna",
    "ultra",
    "halla",
    "beato",
    "cursi",
    "quita",
    "sonda",
    "guion",
    "honra",
    "limbo",
    "brasa",
    "segar",
    "mudar",
    "gorro",
    "podar",
    "ñandu",
    "justa",
    "orgia",
    "rubor",
    "plebe",
    "ornar",
    "egida",
    "talla",
    "bazar",
    "tapon",
    "titan",
    "esmog",
    "rizar",
    "labia",
    "cebar",
    "doler",
    "cerco",
    "renta",
    "caido",
    "dueto",
    "nevar",
    "hiato",
    "alero",
    "ixtle",
    "lloro",
    "kepis",
    "gramo",
    "ovalo",
    "talar",
    "apero",
    "vagon",
    "pizca",
    "jabon",
    "vulva",
    "marea",
    "pecar",
    "cabra",
    "blusa",
    "asado",
    "lamer",
    "dorso",
    "glosa",
    "bardo",
    "aforo",
    "aldea",
    "pesca",
    "lente",
    "flota",
    "jadeo",
    "apuro",
    "garra",
    "credo",
    "cobro",
    "cutis",
    "vulgo",
    "tinte",
    "felon",
    "crema",
    "argot",
    "gallo",
    "fisco",
    "arabe",
    "freno",
    "hipar",
    "natal",
    "hucha",
    "varon",
    "ungir",
    "joder",
    "bedel",
    "video",
    "caqui",
    "palma",
    "secta",
    "prior",
    "magro",
    "water",
    "ambos",
    "brujo",
    "anima"
  ];

  @override
  void initState() {
    super.initState();
    controllerConfetti =
        ConfettiController(duration: const Duration(seconds: 2));
    asignNewWord();
  }

  void checkWord(String word) {
    String winningMessage = "Has adivinado la palabra! (" + currentWord + ")";
    String notWinningMessage =
        "Que poco! La palabra que buscabas era " + currentWord + "";
    if (word == currentWord || notCorrectWords.length > 4) {
      if (word == currentWord) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Enhorabuena'),
                  content: Text(winningMessage),
                ));
        controllerConfetti.play();
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Casi!'),
                  content: Text(notWinningMessage),
                ));
      }
      restartAttempts();
      asignNewWord();
    } else {
      addAttempt(firstChar.text, secondChar.text, thirdChar.text,
          forthChar.text, fifthtChar.text);
    }
    clearTextFields();
  }

  clearTextFields() {
    firstChar.clear();
    secondChar.clear();
    thirdChar.clear();
    forthChar.clear();
    fifthtChar.clear();
  }

  void asignNewWord() {
    var random = Random();
    var number = random.nextInt(valores.length + 1);
    setState(() {
      currentWord = valores[number];
    });
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: const Size(2, 2),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 10,
        minBlastForce: 5,
        emissionFrequency: 1,
        numberOfParticles: 2,
        gravity: 0,
      ),
    );
  }

  bool notEmpty(
      TextEditingController one,
      TextEditingController two,
      TextEditingController three,
      TextEditingController four,
      TextEditingController five) {
    return one.text.isNotEmpty &&
        two.text.isNotEmpty &&
        three.text.isNotEmpty &&
        four.text.isNotEmpty &&
        five.text.isNotEmpty;
  }

  Widget attempts(String fisrtChar, String secondChar, String thirdChar,
      String forthChar, String fifthtChar) {
    return Center(
        child: Stack(
      children: [
        RichText(
            text: TextSpan(children: <TextSpan>[
          singleWordPainted(firstChar.text, 0),
          singleWordPainted(this.secondChar.text, 1),
          singleWordPainted(this.thirdChar.text, 2),
          singleWordPainted(this.forthChar.text, 3),
          singleWordPainted(this.fifthtChar.text, 4),
        ]))
      ],
    ));
  }

  TextSpan singleWordPainted(String char, int index) {
    //Returns every single char printed depending if its on the word, its in the correct position or is not in the word
    Color color;
    if (currentWord.split("").asMap()[index] == char) {
      color = Colors.green;
    } else if (currentWord.contains(char)) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return TextSpan(
        text: char,
        style: TextStyle(
            color: Colors.black, backgroundColor: color, fontSize: 30));
  }

  void addAttempt(String fisrtChar, String secondChar, String thirdChar,
      String forthChar, String fifthtChar) {
    setState(() {
      notCorrectWords.add(
          attempts(fisrtChar, secondChar, thirdChar, forthChar, fifthtChar));
    });
  }

  void restartAttempts() {
    setState(() {
      notCorrectWords.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildConfettiWidget(controllerConfetti, pi),
          buildConfettiWidget(controllerConfetti, pi / 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: notCorrectWords.length,
                  itemBuilder: (context, index) {
                    return notCorrectWords[index];
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextField(
                          inputFormatters: [
                            // only accept letters from a to z
                            FilteringTextInputFormatter(RegExp(r'[a-z]'),
                                allow: true)
                          ],
                          maxLength: 1,
                          textInputAction: TextInputAction.next,
                          controller: firstChar,
                        ),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextField(
                          inputFormatters: [
                            // only accept letters from a to z
                            FilteringTextInputFormatter(RegExp(r'[a-z]'),
                                allow: true)
                          ],
                          maxLength: 1,
                          textInputAction: TextInputAction.next,
                          controller: secondChar,
                        ),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextField(
                          inputFormatters: [
                            // only accept letters from a to z
                            FilteringTextInputFormatter(RegExp(r'[a-z]'),
                                allow: true)
                          ],
                          maxLength: 1,
                          textInputAction: TextInputAction.next,
                          controller: thirdChar,
                        ),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextField(
                          inputFormatters: [
                            // only accept letters from a to z
                            FilteringTextInputFormatter(RegExp(r'[a-z]'),
                                allow: true)
                          ],
                          maxLength: 1,
                          textInputAction: TextInputAction.next,
                          controller: forthChar,
                        ),
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextField(
                          inputFormatters: [
                            // only accept letters from a to z
                            FilteringTextInputFormatter(RegExp(r'[a-z]'),
                                allow: true)
                          ],
                          maxLength: 1,
                          controller: fifthtChar,
                          onSubmitted: (value) {
                            if (notEmpty(firstChar, secondChar, thirdChar,
                                forthChar, fifthtChar)) {
                              String formedWord = firstChar.text +
                                  secondChar.text +
                                  thirdChar.text +
                                  forthChar.text +
                                  fifthtChar.text;
                              checkWord(formedWord);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) => const AlertDialog(
                                        title: Text('Error'),
                                        content:
                                            Text('Faltan letras por poner'),
                                      ));
                            }
                          },
                        ),
                        width: 30,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
