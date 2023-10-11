package main

import fp"./fp"

main :: proc() {
  fp.print("Hello World\n", fp.colors["DEFAULT"], fp.decor["NORMAL"]);
  fp.print("THE WORLD IS DYING LOL\n", fp.colors["RED"], fp.decor["UNDERLINE"]);

  s :[]string = {
   "THIS IS INDEX 1\n",
   "THIS IS INDEX 2\n",
  };

  ents : []fp.fs = {
    fp.fs{"This is index 1 AS", fp.colors["GREEN"], fp.decor["BOLD"]},
    fp.fs{"this is index 2 AS", fp.colors["RED"], fp.decor["UNDERLINE"]},
  };

  fp.print(ents);

  fp.print(s, fp.colors["CYAN"], fp.decor["BOLD"]);
  fp.print(fp.fs{"Hello World", fp.colors["DEFAULT"], fp.decor["NORMAL"]});
}

