List<String> url = [
  "https://i.hizliresim.com/P1lgVQ.gif",
  "https://i.hizliresim.com/jgyoOn.gif",
  "https://i.hizliresim.com/V9rbqB.gif",
  "https://i.hizliresim.com/6aJ0g9.gif",
  "https://i.hizliresim.com/aYz47Q.gif",
  "https://i.hizliresim.com/VLBmEZ.gif",
  "https://i.hizliresim.com/ngyZzM.gif",
  "https://i.hizliresim.com/vLy9vD.gif",
];
List<String> explanation = [
  "Kardio Isınma- Sağ ayak- 30 saniye + 10 saniye dinlenme ve Sol ayak- 30 saniye",
  "Medikal Top Silkme – 30 saniye",
  "İp atlama -30 saniye",
  "Squat ve ayak dokundurma – (Çömelme) -30 saniye",
  "Çizgide atlama – Line Jumps -30 saniye",
  "Jumping Jacks – (Jacks Atlama) – 60 saniye – Sonra 20 s dinlenme",
  "Titreme tekme squat -Flutter kick squats –  60 saniye – Sonra 20 saniye dinlenme",
  "Burpees -Eğilme Geriye squat, Kalkma – 60 saniye",
];
List<bool> isFavourite = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class Favourites {
  final String url;
  final String explanation;
  Favourites({
    required this.url,
    required this.explanation,
  });
}

List<Favourites> favourites = [];
