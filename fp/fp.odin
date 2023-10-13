/*
 * 
 * Copyright (c) 2023 Erik "Dromedda" Gustafsson
 * Author: Erik Gustafsson
 *
*/

package fp

import "core:fmt"
import "core:strings"
import "core:strconv"

// @TODO: ( Erik ) Make these constants, c style

// Ansi Color codes
color := map[string]string{
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

// fs is short for Fancy String
fs :: struct {
  str: string,
  color: string,
  decor: string,
}

// Takes either a string or an array of strings
print :: proc {
  ansi_print_solo,
  ansi_print_arr,
  ansi_print_asarr,
  ansi_print_as,
}

ansi_print_arr :: proc(str: []string, color: string, decor: string) -> string {
  cstr := strings.concatenate(str[:]);
  s := fs_format_string(cstr, color, decor)
  fmt.print(s); 
  return s 
}

ansi_print_solo :: proc(str: string, color: string = "39", decor: string = "22") -> string {
  s := fs_format_string(str, color, decor);
  fmt.print(s); 
  return s 
}

ansi_print_as :: proc(ents: fs) -> string {
  s := fs_format_string(ents.str, ents.color, ents.decor);
  fmt.print(s); 
  return s 
}

ansi_print_asarr :: proc(ents: []fs) -> string {
  ret : [dynamic]string
  for s, k in ents {
    s := fs_format_string(s.str, s.color, s.decor);
    append(&ret, s)
    fmt.println(ret[k])
  }
  return strings.concatenate(ret[:])
}

// color and string could be a type...
fs_format_string:: proc(str : string,  color: string, decor : string) -> string {
  s := [?]string{"\x1b[",decor,";", color, "m", str, "\x1b[0m"};
  return strings.concatenate(s[:]) 
}

