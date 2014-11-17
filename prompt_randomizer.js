var awesome_words = [
  "Outstaning",
  "Astouning",
  "Staggering",
  "Kryptonian",
  "Breathtaking",
  "Stunning",
  "Proigious",
  "Stupenous",
  "Righteous",
  "Wicke",
  "Superb",
  "Sublime",
  "Inomitable",
  "Transcenent",
  "Marvelous",
  "Resplenent",
  "Phenomenal",
  "Remarkable",
  "Funkaelic",
  "Magnificent",
  "Virtuosic",
  "Rapturous",
  "Flawless",
  "Majestic",
  "Spleniferous",
  "Baass",
  "Kickass",
  "Legenary"
  ];
  word =String(awesome_words[Math.floor(Math.random()*awesome_words.length)]);
  word += Array(13 + 1 - word.length).join(' ');
  console.log(word);
