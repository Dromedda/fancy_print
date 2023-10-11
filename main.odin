package main

import "core:fmt"
import "core:strings"
import "core:strconv"

// Ansi Color codes
colors := map[string]string{
  "BLACK" = "30",
  "RED" = "31",
  "GREEN" = "32",
  "YELLOW " = "33",
  "BLUE" = "34",
  "MAGENTA" = "35",
  "CYAN" = "36",
  "WHITE" = "37", 
  "DEFAULT" = "39",
  "RESET" = "0",
}


decor := map[string]string{
  "BOLD" = "1",
  "UNDERLINE" = "4",
  "BLINK" = "5",
  "NORMAL" = "22",
}

Ansi_String :: struct {
  str: string,
  color: string,
  decor: string,
}

main :: proc() {
  ansi_print("Hello World\n", colors["DEFAULT"], decor["NORMAL"]);
  ansi_print("THE WORLD IS DYING LOL\n", colors["RED"], decor["UNDERLINE"]);

  s :[]string = {
   "THIS IS INDEX 1\n",
   "THIS IS INDEX 2\n",
  };

  ansi_print(s, colors["CYAN"], decor["BOLD"]);
}

// Takes either a string or an array of strings
ansi_print :: proc {
  ansi_print_solo,
  ansi_print_arr,
  ansi_print_as,
}

ansi_print_arr :: proc(str: []string, color: string, decor: string) -> string {
  cstr := strings.concatenate(str[:]);
  s := [?]string{"\x1b[",decor,";", color, "m", cstr, "\x1b[0m"};
  ret := strings.concatenate(s[:]);
  fmt.print(ret); 
  return ret
}

ansi_print_solo :: proc(str: string, color: string, decor: string) -> string {
  s := [?]string{"\x1b[",decor,";", color, "m", str, "\x1b[0m"};
  ret := strings.concatenate(s[:]);
  fmt.print(ret); 
  return ret
}

// @TODO IMPLEMENT
ansi_print_as :: proc(ents : [] Ansi_String) -> string {
  assert(false, "Not Implemented yet...")
  str := "Not Implemented"
  color := colors["DEFAULT"]
  decor := decor["NORMAL"]
  s := [?]string{"\x1b[",decor,";", color, "m", str, "\x1b[0m"};
  ret := strings.concatenate(s[:]);
  fmt.print(ret); 
  return ret
}
