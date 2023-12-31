package main

import fp"./fp" // < Use the path to the folder of the package here >

main :: proc() {
  // Use default values
  fp.print("Hello World!\n"); 

  // Use custom values
  fp.print("ALL YOUR BASE BELONGS TO US!\n", fp.color["RED"], fp.decor["BOLD"]);

  s :[]string = {
   "Text, With Index :: 1\n",
   "Text, With Index :: 2\n",
  };

  ents : []fp.fs = {
    fp.fs{"This is Index 1 in the array of fancy strings", fp.color["GREEN"], fp.decor["BOLD"]},
    fp.fs{"This is Index 2 in the array of fancy strings", fp.color["RED"], fp.decor["UNDERLINE"]},
  };

  // Print an array of strings
  fp.print(s, fp.color["CYAN"], fp.decor["BOLD"]);

  // Fancy print the array of fancy strings
  fp.print(ents);

  // Print a solo fancy string
  fp.print(fp.fs{"Hello World", fp.color["DEFAULT"], fp.decor["NORMAL"]});
}

