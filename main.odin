package main

import fp"./fp"

main :: proc() {
  fp.ansi_print("Hello World\n", fp.colors["DEFAULT"], fp.decor["NORMAL"]);
  fp.ansi_print("THE WORLD IS DYING LOL\n", fp.colors["RED"], fp.decor["UNDERLINE"]);

  s :[]string = {
   "THIS IS INDEX 1\n",
   "THIS IS INDEX 2\n",
  };

  ents : []fp.Ansi_String = {
    fp.Ansi_String{"This is index 1 AS", fp.colors["GREEN"], fp.decor["BOLD"]},
    fp.Ansi_String{"this is index 2 AS", fp.colors["RED"], fp.decor["UNDERLINE"]},
  };

  fp.ansi_print(ents);

  fp.ansi_print(s, fp.colors["CYAN"], fp.decor["BOLD"]);
  fp.ansi_print(fp.Ansi_String{"Hello World", fp.colors["DEFAULT"], fp.decor["NORMAL"]});

}

