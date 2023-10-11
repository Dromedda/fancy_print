package main

import fp"./fp"

main :: proc() {
  fp.ansi_print("Hello World\n", fp.colors["DEFAULT"], fp.decor["NORMAL"]);
  fp.ansi_print("THE WORLD IS DYING LOL\n", fp.colors["RED"], fp.decor["UNDERLINE"]);

  s :[]string = {
   "THIS IS INDEX 1\n",
   "THIS IS INDEX 2\n",
  };

  fp.ansi_print(s, fp.colors["CYAN"], fp.decor["BOLD"]);
}

