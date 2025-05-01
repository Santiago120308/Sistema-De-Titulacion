class NombreMes {
  static String mesEnTexto(int numMes){
    switch (numMes) {
      case 1:
        return 'ENERO';

      case 2:
        return 'FEBRERO';

      case 3:
        return 'MARZO';

      case 4:
        return 'ABRIL';

      case 5:
        return 'MAYO';

      case 6:
        return 'JUNIO';

      case 7:
        return 'JULIO';

      case 8:
        return 'AGOSTO';

      case 9:
        return 'SEPTIEMBRE';

      case 10:
        return 'OCTUBRE';

      case 11:
        return 'NOVIEMBRE';

      case 12:
        return 'DICIEMBRE';

      default: return '';
    }
  }
}