enum Pll {
  ua("Ua", "FFFRBRBLBLRL"),
  ub("Ub", "FFFRLRBRBLBL"),
  h("H", "FBFRLRBFBLRL"),
  aa("Aa", "FFBLRFRBRBLL"),
  ab("Ab", "FFRBRBLBFRLL"),
  z("Z", "FLFRBRBRBLFL"),
  ja("Ja", "FFRBBFRRBLLL"),
  jb("Jb", "FRRBFFRBBLLL"),
  f("F", "FBRBRFRFBLLL"),
  ra("Ra", "FFRBRFRLBLBL"),
  rb("Rb", "FLRBRFRBBLFL"),
  t("T", "FFRBLFRBBLRL"),
  na("Na", "BFFRLLFBBLRR"),
  nb("Nb", "BBFRRLFFBLLR"),
  y("Y", "FFBLRRBLFRBL"),
  ga("Ga", "FRRBLFRFBLBL"),
  gb("Gb", "FBRBFFRLBLRL"),
  v("V", "FFBLBRBRFRLL"),
  gc("Gc", "FBRBLFRRBLFL"),
  gd("Gd", "FLRBBFRFBLRL"),
  e("E", "LFRBRFRBLFLB");

  const Pll(this.label, this.permutation);

  final String label;
  final String permutation;

  get assetName => 'assets/pll_svg/pll_$name.svg';
}
