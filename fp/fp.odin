package fp

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

// fs is short for Fancy String
fs :: struct {
  str: string,
  color: string,
  decor: string,
}

// Takes either a string or an array of strings
ansi_print :: proc {
  ansi_print_solo,
  ansi_print_arr,
  ansi_print_asarr,
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

ansi_print_as :: proc(ents: fs) -> string {
  str := ents.str
  color := ents.color
  decor := ents.decor
  s := [?]string{"\x1b[",decor,";", color, "m", str, "\x1b[0m"};
  ret := strings.concatenate(s[:]);
  fmt.print(ret); 
  return ret
}

ansi_print_asarr :: proc(ents: []fs) -> string {
  ret : [dynamic]string
  for s, k in ents {
    str := s.str
    color := s.color
    decor := s.decor
    s := [?]string{"\x1b[",decor,";", color, "m", str, "\x1b[0m"};
    append(&ret, strings.concatenate(s[:]))
    fmt.println(ret[k])
  }
  return strings.concatenate(ret[:])

}
