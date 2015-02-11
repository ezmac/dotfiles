var awesome_words = [
  "Outstanding",
  "Astounding",
  "Staggering",
  "Kryptonian",
  "Dang",
  "Groovy",
  "Stupenous",
  "Righteous",
  "Wicked",
  "Superb",
  "Sublime",
  "Indomitable",
  "Transcenent",
  "Marvelous",
  "Resplenent",
  "Phenomenal",
  "Decent",
  "Funkaelic",
  "Magnificent",
  "Chill",
  "Sick",
  "Flawless",
  "Phony",
  "Splendiferous",
  "Badass",
  "Kickass",
  "Legendary"
  ];
  word =String(awesome_words[Math.floor(Math.random()*awesome_words.length)]);
  word += Array(13 + 1 - word.length).join(' ');
  console.log(word);
