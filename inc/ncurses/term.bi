#pragma once

#include once "termios.bi"

'' The following symbols have been renamed:
''     #define TERMIOS => TERMIOS__
''     typedef TERMTYPE => TERMTYPE_

extern "C"

type termios as termios_

#define NCURSES_TERM_H_incl 1
#define NCURSES_VERSION "5.9"
#define NCURSES_DLL_H_incl 1
#define NCURSES_SBOOL byte
#define NCURSES_XNAMES 1
#define TERMIOS__ 1
#define TTY termios
#define GET_TTY(fd, buf) tcgetattr(fd, buf)
#define SET_TTY(fd, buf) tcsetattr(fd, TCSADRAIN, buf)
#define NAMESIZE 256

'' TODO: unrecognized construct:
'' #define CUR cur_term->type.
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(154): expected expression but found '
'' '
''     #define CUR cur_term->type.
''                                ^
'' context as seen by fbfrog:
''     # define CUR cur_term -> type . 
''                                     ^

'' TODO: unrecognized construct:
'' #define auto_left_margin CUR Booleans[0]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(156): failed to parse full #define body
''     #define auto_left_margin               CUR Booleans[0]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define auto_left_margin CUR Booleans [ 0 ] 
''                                   ^~~~~~~~

'' TODO: unrecognized construct:
'' #define auto_right_margin CUR Booleans[1]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(157): failed to parse full #define body
''     #define auto_right_margin              CUR Booleans[1]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define auto_right_margin CUR Booleans [ 1 ] 
''                                    ^~~~~~~~

'' TODO: unrecognized construct:
'' #define no_esc_ctlc CUR Booleans[2]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(158): failed to parse full #define body
''     #define no_esc_ctlc                    CUR Booleans[2]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define no_esc_ctlc CUR Booleans [ 2 ] 
''                              ^~~~~~~~

'' TODO: unrecognized construct:
'' #define ceol_standout_glitch CUR Booleans[3]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(159): failed to parse full #define body
''     #define ceol_standout_glitch           CUR Booleans[3]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define ceol_standout_glitch CUR Booleans [ 3 ] 
''                                       ^~~~~~~~

'' TODO: unrecognized construct:
'' #define eat_newline_glitch CUR Booleans[4]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(160): failed to parse full #define body
''     #define eat_newline_glitch             CUR Booleans[4]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define eat_newline_glitch CUR Booleans [ 4 ] 
''                                     ^~~~~~~~

'' TODO: unrecognized construct:
'' #define erase_overstrike CUR Booleans[5]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(161): failed to parse full #define body
''     #define erase_overstrike               CUR Booleans[5]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define erase_overstrike CUR Booleans [ 5 ] 
''                                   ^~~~~~~~

'' TODO: unrecognized construct:
'' #define generic_type CUR Booleans[6]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(162): failed to parse full #define body
''     #define generic_type                   CUR Booleans[6]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define generic_type CUR Booleans [ 6 ] 
''                               ^~~~~~~~

'' TODO: unrecognized construct:
'' #define hard_copy CUR Booleans[7]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(163): failed to parse full #define body
''     #define hard_copy                      CUR Booleans[7]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define hard_copy CUR Booleans [ 7 ] 
''                            ^~~~~~~~

'' TODO: unrecognized construct:
'' #define has_meta_key CUR Booleans[8]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(164): failed to parse full #define body
''     #define has_meta_key                   CUR Booleans[8]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define has_meta_key CUR Booleans [ 8 ] 
''                               ^~~~~~~~

'' TODO: unrecognized construct:
'' #define has_status_line CUR Booleans[9]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(165): failed to parse full #define body
''     #define has_status_line                CUR Booleans[9]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define has_status_line CUR Booleans [ 9 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define insert_null_glitch CUR Booleans[10]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(166): failed to parse full #define body
''     #define insert_null_glitch             CUR Booleans[10]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define insert_null_glitch CUR Booleans [ 10 ] 
''                                     ^~~~~~~~

'' TODO: unrecognized construct:
'' #define memory_above CUR Booleans[11]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(167): failed to parse full #define body
''     #define memory_above                   CUR Booleans[11]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define memory_above CUR Booleans [ 11 ] 
''                               ^~~~~~~~

'' TODO: unrecognized construct:
'' #define memory_below CUR Booleans[12]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(168): failed to parse full #define body
''     #define memory_below                   CUR Booleans[12]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define memory_below CUR Booleans [ 12 ] 
''                               ^~~~~~~~

'' TODO: unrecognized construct:
'' #define move_insert_mode CUR Booleans[13]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(169): failed to parse full #define body
''     #define move_insert_mode               CUR Booleans[13]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define move_insert_mode CUR Booleans [ 13 ] 
''                                   ^~~~~~~~

'' TODO: unrecognized construct:
'' #define move_standout_mode CUR Booleans[14]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(170): failed to parse full #define body
''     #define move_standout_mode             CUR Booleans[14]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define move_standout_mode CUR Booleans [ 14 ] 
''                                     ^~~~~~~~

'' TODO: unrecognized construct:
'' #define over_strike CUR Booleans[15]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(171): failed to parse full #define body
''     #define over_strike                    CUR Booleans[15]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define over_strike CUR Booleans [ 15 ] 
''                              ^~~~~~~~

'' TODO: unrecognized construct:
'' #define status_line_esc_ok CUR Booleans[16]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(172): failed to parse full #define body
''     #define status_line_esc_ok             CUR Booleans[16]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define status_line_esc_ok CUR Booleans [ 16 ] 
''                                     ^~~~~~~~

'' TODO: unrecognized construct:
'' #define dest_tabs_magic_smso CUR Booleans[17]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(173): failed to parse full #define body
''     #define dest_tabs_magic_smso           CUR Booleans[17]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define dest_tabs_magic_smso CUR Booleans [ 17 ] 
''                                       ^~~~~~~~

'' TODO: unrecognized construct:
'' #define tilde_glitch CUR Booleans[18]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(174): failed to parse full #define body
''     #define tilde_glitch                   CUR Booleans[18]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define tilde_glitch CUR Booleans [ 18 ] 
''                               ^~~~~~~~

'' TODO: unrecognized construct:
'' #define transparent_underline CUR Booleans[19]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(175): failed to parse full #define body
''     #define transparent_underline          CUR Booleans[19]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define transparent_underline CUR Booleans [ 19 ] 
''                                        ^~~~~~~~

'' TODO: unrecognized construct:
'' #define xon_xoff CUR Booleans[20]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(176): failed to parse full #define body
''     #define xon_xoff                       CUR Booleans[20]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define xon_xoff CUR Booleans [ 20 ] 
''                           ^~~~~~~~

'' TODO: unrecognized construct:
'' #define needs_xon_xoff CUR Booleans[21]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(177): failed to parse full #define body
''     #define needs_xon_xoff                 CUR Booleans[21]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define needs_xon_xoff CUR Booleans [ 21 ] 
''                                 ^~~~~~~~

'' TODO: unrecognized construct:
'' #define prtr_silent CUR Booleans[22]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(178): failed to parse full #define body
''     #define prtr_silent                    CUR Booleans[22]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define prtr_silent CUR Booleans [ 22 ] 
''                              ^~~~~~~~

'' TODO: unrecognized construct:
'' #define hard_cursor CUR Booleans[23]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(179): failed to parse full #define body
''     #define hard_cursor                    CUR Booleans[23]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define hard_cursor CUR Booleans [ 23 ] 
''                              ^~~~~~~~

'' TODO: unrecognized construct:
'' #define non_rev_rmcup CUR Booleans[24]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(180): failed to parse full #define body
''     #define non_rev_rmcup                  CUR Booleans[24]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define non_rev_rmcup CUR Booleans [ 24 ] 
''                                ^~~~~~~~

'' TODO: unrecognized construct:
'' #define no_pad_char CUR Booleans[25]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(181): failed to parse full #define body
''     #define no_pad_char                    CUR Booleans[25]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define no_pad_char CUR Booleans [ 25 ] 
''                              ^~~~~~~~

'' TODO: unrecognized construct:
'' #define non_dest_scroll_region CUR Booleans[26]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(182): failed to parse full #define body
''     #define non_dest_scroll_region         CUR Booleans[26]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define non_dest_scroll_region CUR Booleans [ 26 ] 
''                                         ^~~~~~~~

'' TODO: unrecognized construct:
'' #define can_change CUR Booleans[27]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(183): failed to parse full #define body
''     #define can_change                     CUR Booleans[27]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define can_change CUR Booleans [ 27 ] 
''                             ^~~~~~~~

'' TODO: unrecognized construct:
'' #define back_color_erase CUR Booleans[28]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(184): failed to parse full #define body
''     #define back_color_erase               CUR Booleans[28]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define back_color_erase CUR Booleans [ 28 ] 
''                                   ^~~~~~~~

'' TODO: unrecognized construct:
'' #define hue_lightness_saturation CUR Booleans[29]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(185): failed to parse full #define body
''     #define hue_lightness_saturation       CUR Booleans[29]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define hue_lightness_saturation CUR Booleans [ 29 ] 
''                                           ^~~~~~~~

'' TODO: unrecognized construct:
'' #define col_addr_glitch CUR Booleans[30]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(186): failed to parse full #define body
''     #define col_addr_glitch                CUR Booleans[30]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define col_addr_glitch CUR Booleans [ 30 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define cr_cancels_micro_mode CUR Booleans[31]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(187): failed to parse full #define body
''     #define cr_cancels_micro_mode          CUR Booleans[31]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define cr_cancels_micro_mode CUR Booleans [ 31 ] 
''                                        ^~~~~~~~

'' TODO: unrecognized construct:
'' #define has_print_wheel CUR Booleans[32]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(188): failed to parse full #define body
''     #define has_print_wheel                CUR Booleans[32]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define has_print_wheel CUR Booleans [ 32 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define row_addr_glitch CUR Booleans[33]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(189): failed to parse full #define body
''     #define row_addr_glitch                CUR Booleans[33]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define row_addr_glitch CUR Booleans [ 33 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define semi_auto_right_margin CUR Booleans[34]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(190): failed to parse full #define body
''     #define semi_auto_right_margin         CUR Booleans[34]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define semi_auto_right_margin CUR Booleans [ 34 ] 
''                                         ^~~~~~~~

'' TODO: unrecognized construct:
'' #define cpi_changes_res CUR Booleans[35]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(191): failed to parse full #define body
''     #define cpi_changes_res                CUR Booleans[35]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define cpi_changes_res CUR Booleans [ 35 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define lpi_changes_res CUR Booleans[36]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(192): failed to parse full #define body
''     #define lpi_changes_res                CUR Booleans[36]
''                                                ^~~~~~~~
'' context as seen by fbfrog:
''     # define lpi_changes_res CUR Booleans [ 36 ] 
''                                  ^~~~~~~~

'' TODO: unrecognized construct:
'' #define columns CUR Numbers[0]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(193): failed to parse full #define body
''     #define columns                        CUR Numbers[0]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define columns CUR Numbers [ 0 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_tabs CUR Numbers[1]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(194): failed to parse full #define body
''     #define init_tabs                      CUR Numbers[1]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_tabs CUR Numbers [ 1 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define lines CUR Numbers[2]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(195): failed to parse full #define body
''     #define lines                          CUR Numbers[2]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lines CUR Numbers [ 2 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define lines_of_memory CUR Numbers[3]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(196): failed to parse full #define body
''     #define lines_of_memory                CUR Numbers[3]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lines_of_memory CUR Numbers [ 3 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define magic_cookie_glitch CUR Numbers[4]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(197): failed to parse full #define body
''     #define magic_cookie_glitch            CUR Numbers[4]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define magic_cookie_glitch CUR Numbers [ 4 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define padding_baud_rate CUR Numbers[5]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(198): failed to parse full #define body
''     #define padding_baud_rate              CUR Numbers[5]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define padding_baud_rate CUR Numbers [ 5 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define virtual_terminal CUR Numbers[6]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(199): failed to parse full #define body
''     #define virtual_terminal               CUR Numbers[6]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define virtual_terminal CUR Numbers [ 6 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define width_status_line CUR Numbers[7]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(200): failed to parse full #define body
''     #define width_status_line              CUR Numbers[7]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define width_status_line CUR Numbers [ 7 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define num_labels CUR Numbers[8]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(201): failed to parse full #define body
''     #define num_labels                     CUR Numbers[8]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define num_labels CUR Numbers [ 8 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define label_height CUR Numbers[9]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(202): failed to parse full #define body
''     #define label_height                   CUR Numbers[9]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define label_height CUR Numbers [ 9 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define label_width CUR Numbers[10]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(203): failed to parse full #define body
''     #define label_width                    CUR Numbers[10]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define label_width CUR Numbers [ 10 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define max_attributes CUR Numbers[11]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(204): failed to parse full #define body
''     #define max_attributes                 CUR Numbers[11]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define max_attributes CUR Numbers [ 11 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define maximum_windows CUR Numbers[12]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(205): failed to parse full #define body
''     #define maximum_windows                CUR Numbers[12]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define maximum_windows CUR Numbers [ 12 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define max_colors CUR Numbers[13]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(206): failed to parse full #define body
''     #define max_colors                     CUR Numbers[13]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define max_colors CUR Numbers [ 13 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define max_pairs CUR Numbers[14]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(207): failed to parse full #define body
''     #define max_pairs                      CUR Numbers[14]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define max_pairs CUR Numbers [ 14 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define no_color_video CUR Numbers[15]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(208): failed to parse full #define body
''     #define no_color_video                 CUR Numbers[15]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define no_color_video CUR Numbers [ 15 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define buffer_capacity CUR Numbers[16]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(209): failed to parse full #define body
''     #define buffer_capacity                CUR Numbers[16]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define buffer_capacity CUR Numbers [ 16 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define dot_vert_spacing CUR Numbers[17]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(210): failed to parse full #define body
''     #define dot_vert_spacing               CUR Numbers[17]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define dot_vert_spacing CUR Numbers [ 17 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define dot_horz_spacing CUR Numbers[18]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(211): failed to parse full #define body
''     #define dot_horz_spacing               CUR Numbers[18]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define dot_horz_spacing CUR Numbers [ 18 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define max_micro_address CUR Numbers[19]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(212): failed to parse full #define body
''     #define max_micro_address              CUR Numbers[19]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define max_micro_address CUR Numbers [ 19 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define max_micro_jump CUR Numbers[20]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(213): failed to parse full #define body
''     #define max_micro_jump                 CUR Numbers[20]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define max_micro_jump CUR Numbers [ 20 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_col_size CUR Numbers[21]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(214): failed to parse full #define body
''     #define micro_col_size                 CUR Numbers[21]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_col_size CUR Numbers [ 21 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_line_size CUR Numbers[22]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(215): failed to parse full #define body
''     #define micro_line_size                CUR Numbers[22]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_line_size CUR Numbers [ 22 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define number_of_pins CUR Numbers[23]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(216): failed to parse full #define body
''     #define number_of_pins                 CUR Numbers[23]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define number_of_pins CUR Numbers [ 23 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define output_res_char CUR Numbers[24]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(217): failed to parse full #define body
''     #define output_res_char                CUR Numbers[24]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define output_res_char CUR Numbers [ 24 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define output_res_line CUR Numbers[25]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(218): failed to parse full #define body
''     #define output_res_line                CUR Numbers[25]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define output_res_line CUR Numbers [ 25 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define output_res_horz_inch CUR Numbers[26]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(219): failed to parse full #define body
''     #define output_res_horz_inch           CUR Numbers[26]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define output_res_horz_inch CUR Numbers [ 26 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define output_res_vert_inch CUR Numbers[27]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(220): failed to parse full #define body
''     #define output_res_vert_inch           CUR Numbers[27]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define output_res_vert_inch CUR Numbers [ 27 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define print_rate CUR Numbers[28]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(221): failed to parse full #define body
''     #define print_rate                     CUR Numbers[28]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define print_rate CUR Numbers [ 28 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define wide_char_size CUR Numbers[29]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(222): failed to parse full #define body
''     #define wide_char_size                 CUR Numbers[29]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define wide_char_size CUR Numbers [ 29 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define buttons CUR Numbers[30]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(223): failed to parse full #define body
''     #define buttons                        CUR Numbers[30]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define buttons CUR Numbers [ 30 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define bit_image_entwining CUR Numbers[31]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(224): failed to parse full #define body
''     #define bit_image_entwining            CUR Numbers[31]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bit_image_entwining CUR Numbers [ 31 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define bit_image_type CUR Numbers[32]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(225): failed to parse full #define body
''     #define bit_image_type                 CUR Numbers[32]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bit_image_type CUR Numbers [ 32 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define back_tab CUR Strings[0]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(226): failed to parse full #define body
''     #define back_tab                       CUR Strings[0]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define back_tab CUR Strings [ 0 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define bell CUR Strings[1]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(227): failed to parse full #define body
''     #define bell                           CUR Strings[1]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bell CUR Strings [ 1 ] 
''                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define carriage_return CUR Strings[2]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(228): failed to parse full #define body
''     #define carriage_return                CUR Strings[2]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define carriage_return CUR Strings [ 2 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define change_scroll_region CUR Strings[3]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(229): failed to parse full #define body
''     #define change_scroll_region           CUR Strings[3]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define change_scroll_region CUR Strings [ 3 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define clear_all_tabs CUR Strings[4]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(230): failed to parse full #define body
''     #define clear_all_tabs                 CUR Strings[4]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clear_all_tabs CUR Strings [ 4 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define clear_screen CUR Strings[5]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(231): failed to parse full #define body
''     #define clear_screen                   CUR Strings[5]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clear_screen CUR Strings [ 5 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define clr_eol CUR Strings[6]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(232): failed to parse full #define body
''     #define clr_eol                        CUR Strings[6]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clr_eol CUR Strings [ 6 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define clr_eos CUR Strings[7]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(233): failed to parse full #define body
''     #define clr_eos                        CUR Strings[7]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clr_eos CUR Strings [ 7 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define column_address CUR Strings[8]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(234): failed to parse full #define body
''     #define column_address                 CUR Strings[8]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define column_address CUR Strings [ 8 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define command_character CUR Strings[9]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(235): failed to parse full #define body
''     #define command_character              CUR Strings[9]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define command_character CUR Strings [ 9 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_address CUR Strings[10]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(236): failed to parse full #define body
''     #define cursor_address                 CUR Strings[10]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_address CUR Strings [ 10 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_down CUR Strings[11]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(237): failed to parse full #define body
''     #define cursor_down                    CUR Strings[11]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_down CUR Strings [ 11 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_home CUR Strings[12]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(238): failed to parse full #define body
''     #define cursor_home                    CUR Strings[12]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_home CUR Strings [ 12 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_invisible CUR Strings[13]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(239): failed to parse full #define body
''     #define cursor_invisible               CUR Strings[13]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_invisible CUR Strings [ 13 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_left CUR Strings[14]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(240): failed to parse full #define body
''     #define cursor_left                    CUR Strings[14]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_left CUR Strings [ 14 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_mem_address CUR Strings[15]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(241): failed to parse full #define body
''     #define cursor_mem_address             CUR Strings[15]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_mem_address CUR Strings [ 15 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_normal CUR Strings[16]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(242): failed to parse full #define body
''     #define cursor_normal                  CUR Strings[16]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_normal CUR Strings [ 16 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_right CUR Strings[17]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(243): failed to parse full #define body
''     #define cursor_right                   CUR Strings[17]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_right CUR Strings [ 17 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_to_ll CUR Strings[18]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(244): failed to parse full #define body
''     #define cursor_to_ll                   CUR Strings[18]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_to_ll CUR Strings [ 18 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_up CUR Strings[19]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(245): failed to parse full #define body
''     #define cursor_up                      CUR Strings[19]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_up CUR Strings [ 19 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define cursor_visible CUR Strings[20]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(246): failed to parse full #define body
''     #define cursor_visible                 CUR Strings[20]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define cursor_visible CUR Strings [ 20 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define delete_character CUR Strings[21]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(247): failed to parse full #define body
''     #define delete_character               CUR Strings[21]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define delete_character CUR Strings [ 21 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define delete_line CUR Strings[22]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(248): failed to parse full #define body
''     #define delete_line                    CUR Strings[22]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define delete_line CUR Strings [ 22 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define dis_status_line CUR Strings[23]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(249): failed to parse full #define body
''     #define dis_status_line                CUR Strings[23]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define dis_status_line CUR Strings [ 23 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define down_half_line CUR Strings[24]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(250): failed to parse full #define body
''     #define down_half_line                 CUR Strings[24]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define down_half_line CUR Strings [ 24 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_alt_charset_mode CUR Strings[25]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(251): failed to parse full #define body
''     #define enter_alt_charset_mode         CUR Strings[25]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_alt_charset_mode CUR Strings [ 25 ] 
''                                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_blink_mode CUR Strings[26]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(252): failed to parse full #define body
''     #define enter_blink_mode               CUR Strings[26]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_blink_mode CUR Strings [ 26 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_bold_mode CUR Strings[27]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(253): failed to parse full #define body
''     #define enter_bold_mode                CUR Strings[27]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_bold_mode CUR Strings [ 27 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_ca_mode CUR Strings[28]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(254): failed to parse full #define body
''     #define enter_ca_mode                  CUR Strings[28]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_ca_mode CUR Strings [ 28 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_delete_mode CUR Strings[29]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(255): failed to parse full #define body
''     #define enter_delete_mode              CUR Strings[29]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_delete_mode CUR Strings [ 29 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_dim_mode CUR Strings[30]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(256): failed to parse full #define body
''     #define enter_dim_mode                 CUR Strings[30]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_dim_mode CUR Strings [ 30 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_insert_mode CUR Strings[31]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(257): failed to parse full #define body
''     #define enter_insert_mode              CUR Strings[31]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_insert_mode CUR Strings [ 31 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_secure_mode CUR Strings[32]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(258): failed to parse full #define body
''     #define enter_secure_mode              CUR Strings[32]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_secure_mode CUR Strings [ 32 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_protected_mode CUR Strings[33]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(259): failed to parse full #define body
''     #define enter_protected_mode           CUR Strings[33]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_protected_mode CUR Strings [ 33 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_reverse_mode CUR Strings[34]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(260): failed to parse full #define body
''     #define enter_reverse_mode             CUR Strings[34]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_reverse_mode CUR Strings [ 34 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_standout_mode CUR Strings[35]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(261): failed to parse full #define body
''     #define enter_standout_mode            CUR Strings[35]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_standout_mode CUR Strings [ 35 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_underline_mode CUR Strings[36]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(262): failed to parse full #define body
''     #define enter_underline_mode           CUR Strings[36]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_underline_mode CUR Strings [ 36 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define erase_chars CUR Strings[37]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(263): failed to parse full #define body
''     #define erase_chars                    CUR Strings[37]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define erase_chars CUR Strings [ 37 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_alt_charset_mode CUR Strings[38]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(264): failed to parse full #define body
''     #define exit_alt_charset_mode          CUR Strings[38]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_alt_charset_mode CUR Strings [ 38 ] 
''                                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_attribute_mode CUR Strings[39]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(265): failed to parse full #define body
''     #define exit_attribute_mode            CUR Strings[39]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_attribute_mode CUR Strings [ 39 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_ca_mode CUR Strings[40]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(266): failed to parse full #define body
''     #define exit_ca_mode                   CUR Strings[40]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_ca_mode CUR Strings [ 40 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_delete_mode CUR Strings[41]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(267): failed to parse full #define body
''     #define exit_delete_mode               CUR Strings[41]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_delete_mode CUR Strings [ 41 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_insert_mode CUR Strings[42]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(268): failed to parse full #define body
''     #define exit_insert_mode               CUR Strings[42]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_insert_mode CUR Strings [ 42 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_standout_mode CUR Strings[43]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(269): failed to parse full #define body
''     #define exit_standout_mode             CUR Strings[43]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_standout_mode CUR Strings [ 43 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_underline_mode CUR Strings[44]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(270): failed to parse full #define body
''     #define exit_underline_mode            CUR Strings[44]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_underline_mode CUR Strings [ 44 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define flash_screen CUR Strings[45]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(271): failed to parse full #define body
''     #define flash_screen                   CUR Strings[45]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define flash_screen CUR Strings [ 45 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define form_feed CUR Strings[46]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(272): failed to parse full #define body
''     #define form_feed                      CUR Strings[46]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define form_feed CUR Strings [ 46 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define from_status_line CUR Strings[47]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(273): failed to parse full #define body
''     #define from_status_line               CUR Strings[47]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define from_status_line CUR Strings [ 47 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_1string CUR Strings[48]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(274): failed to parse full #define body
''     #define init_1string                   CUR Strings[48]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_1string CUR Strings [ 48 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_2string CUR Strings[49]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(275): failed to parse full #define body
''     #define init_2string                   CUR Strings[49]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_2string CUR Strings [ 49 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_3string CUR Strings[50]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(276): failed to parse full #define body
''     #define init_3string                   CUR Strings[50]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_3string CUR Strings [ 50 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_file CUR Strings[51]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(277): failed to parse full #define body
''     #define init_file                      CUR Strings[51]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_file CUR Strings [ 51 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define insert_character CUR Strings[52]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(278): failed to parse full #define body
''     #define insert_character               CUR Strings[52]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define insert_character CUR Strings [ 52 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define insert_line CUR Strings[53]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(279): failed to parse full #define body
''     #define insert_line                    CUR Strings[53]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define insert_line CUR Strings [ 53 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define insert_padding CUR Strings[54]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(280): failed to parse full #define body
''     #define insert_padding                 CUR Strings[54]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define insert_padding CUR Strings [ 54 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_backspace CUR Strings[55]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(281): failed to parse full #define body
''     #define key_backspace                  CUR Strings[55]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_backspace CUR Strings [ 55 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_catab CUR Strings[56]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(282): failed to parse full #define body
''     #define key_catab                      CUR Strings[56]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_catab CUR Strings [ 56 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_clear CUR Strings[57]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(283): failed to parse full #define body
''     #define key_clear                      CUR Strings[57]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_clear CUR Strings [ 57 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ctab CUR Strings[58]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(284): failed to parse full #define body
''     #define key_ctab                       CUR Strings[58]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ctab CUR Strings [ 58 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_dc CUR Strings[59]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(285): failed to parse full #define body
''     #define key_dc                         CUR Strings[59]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_dc CUR Strings [ 59 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_dl CUR Strings[60]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(286): failed to parse full #define body
''     #define key_dl                         CUR Strings[60]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_dl CUR Strings [ 60 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_down CUR Strings[61]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(287): failed to parse full #define body
''     #define key_down                       CUR Strings[61]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_down CUR Strings [ 61 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_eic CUR Strings[62]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(288): failed to parse full #define body
''     #define key_eic                        CUR Strings[62]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_eic CUR Strings [ 62 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_eol CUR Strings[63]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(289): failed to parse full #define body
''     #define key_eol                        CUR Strings[63]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_eol CUR Strings [ 63 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_eos CUR Strings[64]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(290): failed to parse full #define body
''     #define key_eos                        CUR Strings[64]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_eos CUR Strings [ 64 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f0 CUR Strings[65]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(291): failed to parse full #define body
''     #define key_f0                         CUR Strings[65]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f0 CUR Strings [ 65 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f1 CUR Strings[66]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(292): failed to parse full #define body
''     #define key_f1                         CUR Strings[66]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f1 CUR Strings [ 66 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f10 CUR Strings[67]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(293): failed to parse full #define body
''     #define key_f10                        CUR Strings[67]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f10 CUR Strings [ 67 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f2 CUR Strings[68]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(294): failed to parse full #define body
''     #define key_f2                         CUR Strings[68]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f2 CUR Strings [ 68 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f3 CUR Strings[69]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(295): failed to parse full #define body
''     #define key_f3                         CUR Strings[69]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f3 CUR Strings [ 69 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f4 CUR Strings[70]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(296): failed to parse full #define body
''     #define key_f4                         CUR Strings[70]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f4 CUR Strings [ 70 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f5 CUR Strings[71]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(297): failed to parse full #define body
''     #define key_f5                         CUR Strings[71]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f5 CUR Strings [ 71 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f6 CUR Strings[72]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(298): failed to parse full #define body
''     #define key_f6                         CUR Strings[72]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f6 CUR Strings [ 72 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f7 CUR Strings[73]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(299): failed to parse full #define body
''     #define key_f7                         CUR Strings[73]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f7 CUR Strings [ 73 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f8 CUR Strings[74]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(300): failed to parse full #define body
''     #define key_f8                         CUR Strings[74]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f8 CUR Strings [ 74 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f9 CUR Strings[75]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(301): failed to parse full #define body
''     #define key_f9                         CUR Strings[75]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f9 CUR Strings [ 75 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_home CUR Strings[76]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(302): failed to parse full #define body
''     #define key_home                       CUR Strings[76]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_home CUR Strings [ 76 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ic CUR Strings[77]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(303): failed to parse full #define body
''     #define key_ic                         CUR Strings[77]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ic CUR Strings [ 77 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_il CUR Strings[78]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(304): failed to parse full #define body
''     #define key_il                         CUR Strings[78]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_il CUR Strings [ 78 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_left CUR Strings[79]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(305): failed to parse full #define body
''     #define key_left                       CUR Strings[79]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_left CUR Strings [ 79 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ll CUR Strings[80]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(306): failed to parse full #define body
''     #define key_ll                         CUR Strings[80]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ll CUR Strings [ 80 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_npage CUR Strings[81]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(307): failed to parse full #define body
''     #define key_npage                      CUR Strings[81]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_npage CUR Strings [ 81 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ppage CUR Strings[82]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(308): failed to parse full #define body
''     #define key_ppage                      CUR Strings[82]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ppage CUR Strings [ 82 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_right CUR Strings[83]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(309): failed to parse full #define body
''     #define key_right                      CUR Strings[83]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_right CUR Strings [ 83 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sf CUR Strings[84]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(310): failed to parse full #define body
''     #define key_sf                         CUR Strings[84]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sf CUR Strings [ 84 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sr CUR Strings[85]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(311): failed to parse full #define body
''     #define key_sr                         CUR Strings[85]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sr CUR Strings [ 85 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_stab CUR Strings[86]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(312): failed to parse full #define body
''     #define key_stab                       CUR Strings[86]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_stab CUR Strings [ 86 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_up CUR Strings[87]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(313): failed to parse full #define body
''     #define key_up                         CUR Strings[87]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_up CUR Strings [ 87 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define keypad_local CUR Strings[88]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(314): failed to parse full #define body
''     #define keypad_local                   CUR Strings[88]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define keypad_local CUR Strings [ 88 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define keypad_xmit CUR Strings[89]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(315): failed to parse full #define body
''     #define keypad_xmit                    CUR Strings[89]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define keypad_xmit CUR Strings [ 89 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f0 CUR Strings[90]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(316): failed to parse full #define body
''     #define lab_f0                         CUR Strings[90]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f0 CUR Strings [ 90 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f1 CUR Strings[91]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(317): failed to parse full #define body
''     #define lab_f1                         CUR Strings[91]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f1 CUR Strings [ 91 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f10 CUR Strings[92]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(318): failed to parse full #define body
''     #define lab_f10                        CUR Strings[92]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f10 CUR Strings [ 92 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f2 CUR Strings[93]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(319): failed to parse full #define body
''     #define lab_f2                         CUR Strings[93]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f2 CUR Strings [ 93 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f3 CUR Strings[94]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(320): failed to parse full #define body
''     #define lab_f3                         CUR Strings[94]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f3 CUR Strings [ 94 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f4 CUR Strings[95]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(321): failed to parse full #define body
''     #define lab_f4                         CUR Strings[95]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f4 CUR Strings [ 95 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f5 CUR Strings[96]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(322): failed to parse full #define body
''     #define lab_f5                         CUR Strings[96]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f5 CUR Strings [ 96 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f6 CUR Strings[97]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(323): failed to parse full #define body
''     #define lab_f6                         CUR Strings[97]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f6 CUR Strings [ 97 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f7 CUR Strings[98]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(324): failed to parse full #define body
''     #define lab_f7                         CUR Strings[98]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f7 CUR Strings [ 98 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f8 CUR Strings[99]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(325): failed to parse full #define body
''     #define lab_f8                         CUR Strings[99]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f8 CUR Strings [ 99 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define lab_f9 CUR Strings[100]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(326): failed to parse full #define body
''     #define lab_f9                         CUR Strings[100]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define lab_f9 CUR Strings [ 100 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define meta_off CUR Strings[101]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(327): failed to parse full #define body
''     #define meta_off                       CUR Strings[101]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define meta_off CUR Strings [ 101 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define meta_on CUR Strings[102]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(328): failed to parse full #define body
''     #define meta_on                        CUR Strings[102]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define meta_on CUR Strings [ 102 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define newline CUR Strings[103]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(329): failed to parse full #define body
''     #define newline                        CUR Strings[103]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define newline CUR Strings [ 103 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define pad_char CUR Strings[104]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(330): failed to parse full #define body
''     #define pad_char                       CUR Strings[104]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pad_char CUR Strings [ 104 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_dch CUR Strings[105]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(331): failed to parse full #define body
''     #define parm_dch                       CUR Strings[105]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_dch CUR Strings [ 105 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_delete_line CUR Strings[106]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(332): failed to parse full #define body
''     #define parm_delete_line               CUR Strings[106]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_delete_line CUR Strings [ 106 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_down_cursor CUR Strings[107]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(333): failed to parse full #define body
''     #define parm_down_cursor               CUR Strings[107]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_down_cursor CUR Strings [ 107 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_ich CUR Strings[108]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(334): failed to parse full #define body
''     #define parm_ich                       CUR Strings[108]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_ich CUR Strings [ 108 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_index CUR Strings[109]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(335): failed to parse full #define body
''     #define parm_index                     CUR Strings[109]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_index CUR Strings [ 109 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_insert_line CUR Strings[110]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(336): failed to parse full #define body
''     #define parm_insert_line               CUR Strings[110]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_insert_line CUR Strings [ 110 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_left_cursor CUR Strings[111]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(337): failed to parse full #define body
''     #define parm_left_cursor               CUR Strings[111]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_left_cursor CUR Strings [ 111 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_right_cursor CUR Strings[112]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(338): failed to parse full #define body
''     #define parm_right_cursor              CUR Strings[112]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_right_cursor CUR Strings [ 112 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_rindex CUR Strings[113]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(339): failed to parse full #define body
''     #define parm_rindex                    CUR Strings[113]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_rindex CUR Strings [ 113 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_up_cursor CUR Strings[114]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(340): failed to parse full #define body
''     #define parm_up_cursor                 CUR Strings[114]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_up_cursor CUR Strings [ 114 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define pkey_key CUR Strings[115]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(341): failed to parse full #define body
''     #define pkey_key                       CUR Strings[115]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pkey_key CUR Strings [ 115 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define pkey_local CUR Strings[116]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(342): failed to parse full #define body
''     #define pkey_local                     CUR Strings[116]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pkey_local CUR Strings [ 116 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define pkey_xmit CUR Strings[117]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(343): failed to parse full #define body
''     #define pkey_xmit                      CUR Strings[117]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pkey_xmit CUR Strings [ 117 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define print_screen CUR Strings[118]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(344): failed to parse full #define body
''     #define print_screen                   CUR Strings[118]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define print_screen CUR Strings [ 118 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define prtr_off CUR Strings[119]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(345): failed to parse full #define body
''     #define prtr_off                       CUR Strings[119]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define prtr_off CUR Strings [ 119 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define prtr_on CUR Strings[120]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(346): failed to parse full #define body
''     #define prtr_on                        CUR Strings[120]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define prtr_on CUR Strings [ 120 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define repeat_char CUR Strings[121]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(347): failed to parse full #define body
''     #define repeat_char                    CUR Strings[121]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define repeat_char CUR Strings [ 121 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define reset_1string CUR Strings[122]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(348): failed to parse full #define body
''     #define reset_1string                  CUR Strings[122]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define reset_1string CUR Strings [ 122 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define reset_2string CUR Strings[123]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(349): failed to parse full #define body
''     #define reset_2string                  CUR Strings[123]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define reset_2string CUR Strings [ 123 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define reset_3string CUR Strings[124]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(350): failed to parse full #define body
''     #define reset_3string                  CUR Strings[124]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define reset_3string CUR Strings [ 124 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define reset_file CUR Strings[125]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(351): failed to parse full #define body
''     #define reset_file                     CUR Strings[125]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define reset_file CUR Strings [ 125 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define restore_cursor CUR Strings[126]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(352): failed to parse full #define body
''     #define restore_cursor                 CUR Strings[126]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define restore_cursor CUR Strings [ 126 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define row_address CUR Strings[127]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(353): failed to parse full #define body
''     #define row_address                    CUR Strings[127]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define row_address CUR Strings [ 127 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define save_cursor CUR Strings[128]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(354): failed to parse full #define body
''     #define save_cursor                    CUR Strings[128]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define save_cursor CUR Strings [ 128 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define scroll_forward CUR Strings[129]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(355): failed to parse full #define body
''     #define scroll_forward                 CUR Strings[129]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define scroll_forward CUR Strings [ 129 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define scroll_reverse CUR Strings[130]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(356): failed to parse full #define body
''     #define scroll_reverse                 CUR Strings[130]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define scroll_reverse CUR Strings [ 130 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_attributes CUR Strings[131]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(357): failed to parse full #define body
''     #define set_attributes                 CUR Strings[131]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_attributes CUR Strings [ 131 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_tab CUR Strings[132]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(358): failed to parse full #define body
''     #define set_tab                        CUR Strings[132]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_tab CUR Strings [ 132 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_window CUR Strings[133]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(359): failed to parse full #define body
''     #define set_window                     CUR Strings[133]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_window CUR Strings [ 133 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define tab CUR Strings[134]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(360): failed to parse full #define body
''     #define tab                            CUR Strings[134]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define tab CUR Strings [ 134 ] 
''                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define to_status_line CUR Strings[135]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(361): failed to parse full #define body
''     #define to_status_line                 CUR Strings[135]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define to_status_line CUR Strings [ 135 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define underline_char CUR Strings[136]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(362): failed to parse full #define body
''     #define underline_char                 CUR Strings[136]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define underline_char CUR Strings [ 136 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define up_half_line CUR Strings[137]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(363): failed to parse full #define body
''     #define up_half_line                   CUR Strings[137]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define up_half_line CUR Strings [ 137 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define init_prog CUR Strings[138]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(364): failed to parse full #define body
''     #define init_prog                      CUR Strings[138]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define init_prog CUR Strings [ 138 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_a1 CUR Strings[139]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(365): failed to parse full #define body
''     #define key_a1                         CUR Strings[139]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_a1 CUR Strings [ 139 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_a3 CUR Strings[140]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(366): failed to parse full #define body
''     #define key_a3                         CUR Strings[140]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_a3 CUR Strings [ 140 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_b2 CUR Strings[141]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(367): failed to parse full #define body
''     #define key_b2                         CUR Strings[141]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_b2 CUR Strings [ 141 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_c1 CUR Strings[142]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(368): failed to parse full #define body
''     #define key_c1                         CUR Strings[142]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_c1 CUR Strings [ 142 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_c3 CUR Strings[143]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(369): failed to parse full #define body
''     #define key_c3                         CUR Strings[143]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_c3 CUR Strings [ 143 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define prtr_non CUR Strings[144]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(370): failed to parse full #define body
''     #define prtr_non                       CUR Strings[144]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define prtr_non CUR Strings [ 144 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define char_padding CUR Strings[145]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(371): failed to parse full #define body
''     #define char_padding                   CUR Strings[145]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define char_padding CUR Strings [ 145 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define acs_chars CUR Strings[146]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(372): failed to parse full #define body
''     #define acs_chars                      CUR Strings[146]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define acs_chars CUR Strings [ 146 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define plab_norm CUR Strings[147]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(373): failed to parse full #define body
''     #define plab_norm                      CUR Strings[147]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define plab_norm CUR Strings [ 147 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_btab CUR Strings[148]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(374): failed to parse full #define body
''     #define key_btab                       CUR Strings[148]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_btab CUR Strings [ 148 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_xon_mode CUR Strings[149]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(375): failed to parse full #define body
''     #define enter_xon_mode                 CUR Strings[149]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_xon_mode CUR Strings [ 149 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_xon_mode CUR Strings[150]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(376): failed to parse full #define body
''     #define exit_xon_mode                  CUR Strings[150]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_xon_mode CUR Strings [ 150 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_am_mode CUR Strings[151]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(377): failed to parse full #define body
''     #define enter_am_mode                  CUR Strings[151]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_am_mode CUR Strings [ 151 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_am_mode CUR Strings[152]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(378): failed to parse full #define body
''     #define exit_am_mode                   CUR Strings[152]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_am_mode CUR Strings [ 152 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define xon_character CUR Strings[153]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(379): failed to parse full #define body
''     #define xon_character                  CUR Strings[153]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define xon_character CUR Strings [ 153 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define xoff_character CUR Strings[154]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(380): failed to parse full #define body
''     #define xoff_character                 CUR Strings[154]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define xoff_character CUR Strings [ 154 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define ena_acs CUR Strings[155]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(381): failed to parse full #define body
''     #define ena_acs                        CUR Strings[155]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define ena_acs CUR Strings [ 155 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define label_on CUR Strings[156]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(382): failed to parse full #define body
''     #define label_on                       CUR Strings[156]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define label_on CUR Strings [ 156 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define label_off CUR Strings[157]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(383): failed to parse full #define body
''     #define label_off                      CUR Strings[157]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define label_off CUR Strings [ 157 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_beg CUR Strings[158]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(384): failed to parse full #define body
''     #define key_beg                        CUR Strings[158]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_beg CUR Strings [ 158 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_cancel CUR Strings[159]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(385): failed to parse full #define body
''     #define key_cancel                     CUR Strings[159]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_cancel CUR Strings [ 159 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_close CUR Strings[160]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(386): failed to parse full #define body
''     #define key_close                      CUR Strings[160]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_close CUR Strings [ 160 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_command CUR Strings[161]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(387): failed to parse full #define body
''     #define key_command                    CUR Strings[161]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_command CUR Strings [ 161 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_copy CUR Strings[162]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(388): failed to parse full #define body
''     #define key_copy                       CUR Strings[162]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_copy CUR Strings [ 162 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_create CUR Strings[163]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(389): failed to parse full #define body
''     #define key_create                     CUR Strings[163]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_create CUR Strings [ 163 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_end CUR Strings[164]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(390): failed to parse full #define body
''     #define key_end                        CUR Strings[164]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_end CUR Strings [ 164 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_enter CUR Strings[165]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(391): failed to parse full #define body
''     #define key_enter                      CUR Strings[165]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_enter CUR Strings [ 165 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_exit CUR Strings[166]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(392): failed to parse full #define body
''     #define key_exit                       CUR Strings[166]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_exit CUR Strings [ 166 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_find CUR Strings[167]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(393): failed to parse full #define body
''     #define key_find                       CUR Strings[167]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_find CUR Strings [ 167 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_help CUR Strings[168]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(394): failed to parse full #define body
''     #define key_help                       CUR Strings[168]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_help CUR Strings [ 168 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_mark CUR Strings[169]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(395): failed to parse full #define body
''     #define key_mark                       CUR Strings[169]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_mark CUR Strings [ 169 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_message CUR Strings[170]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(396): failed to parse full #define body
''     #define key_message                    CUR Strings[170]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_message CUR Strings [ 170 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_move CUR Strings[171]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(397): failed to parse full #define body
''     #define key_move                       CUR Strings[171]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_move CUR Strings [ 171 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_next CUR Strings[172]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(398): failed to parse full #define body
''     #define key_next                       CUR Strings[172]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_next CUR Strings [ 172 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_open CUR Strings[173]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(399): failed to parse full #define body
''     #define key_open                       CUR Strings[173]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_open CUR Strings [ 173 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_options CUR Strings[174]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(400): failed to parse full #define body
''     #define key_options                    CUR Strings[174]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_options CUR Strings [ 174 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_previous CUR Strings[175]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(401): failed to parse full #define body
''     #define key_previous                   CUR Strings[175]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_previous CUR Strings [ 175 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_print CUR Strings[176]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(402): failed to parse full #define body
''     #define key_print                      CUR Strings[176]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_print CUR Strings [ 176 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_redo CUR Strings[177]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(403): failed to parse full #define body
''     #define key_redo                       CUR Strings[177]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_redo CUR Strings [ 177 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_reference CUR Strings[178]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(404): failed to parse full #define body
''     #define key_reference                  CUR Strings[178]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_reference CUR Strings [ 178 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_refresh CUR Strings[179]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(405): failed to parse full #define body
''     #define key_refresh                    CUR Strings[179]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_refresh CUR Strings [ 179 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_replace CUR Strings[180]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(406): failed to parse full #define body
''     #define key_replace                    CUR Strings[180]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_replace CUR Strings [ 180 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_restart CUR Strings[181]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(407): failed to parse full #define body
''     #define key_restart                    CUR Strings[181]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_restart CUR Strings [ 181 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_resume CUR Strings[182]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(408): failed to parse full #define body
''     #define key_resume                     CUR Strings[182]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_resume CUR Strings [ 182 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_save CUR Strings[183]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(409): failed to parse full #define body
''     #define key_save                       CUR Strings[183]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_save CUR Strings [ 183 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_suspend CUR Strings[184]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(410): failed to parse full #define body
''     #define key_suspend                    CUR Strings[184]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_suspend CUR Strings [ 184 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_undo CUR Strings[185]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(411): failed to parse full #define body
''     #define key_undo                       CUR Strings[185]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_undo CUR Strings [ 185 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sbeg CUR Strings[186]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(412): failed to parse full #define body
''     #define key_sbeg                       CUR Strings[186]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sbeg CUR Strings [ 186 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_scancel CUR Strings[187]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(413): failed to parse full #define body
''     #define key_scancel                    CUR Strings[187]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_scancel CUR Strings [ 187 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_scommand CUR Strings[188]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(414): failed to parse full #define body
''     #define key_scommand                   CUR Strings[188]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_scommand CUR Strings [ 188 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_scopy CUR Strings[189]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(415): failed to parse full #define body
''     #define key_scopy                      CUR Strings[189]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_scopy CUR Strings [ 189 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_screate CUR Strings[190]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(416): failed to parse full #define body
''     #define key_screate                    CUR Strings[190]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_screate CUR Strings [ 190 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sdc CUR Strings[191]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(417): failed to parse full #define body
''     #define key_sdc                        CUR Strings[191]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sdc CUR Strings [ 191 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sdl CUR Strings[192]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(418): failed to parse full #define body
''     #define key_sdl                        CUR Strings[192]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sdl CUR Strings [ 192 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_select CUR Strings[193]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(419): failed to parse full #define body
''     #define key_select                     CUR Strings[193]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_select CUR Strings [ 193 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_send CUR Strings[194]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(420): failed to parse full #define body
''     #define key_send                       CUR Strings[194]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_send CUR Strings [ 194 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_seol CUR Strings[195]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(421): failed to parse full #define body
''     #define key_seol                       CUR Strings[195]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_seol CUR Strings [ 195 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sexit CUR Strings[196]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(422): failed to parse full #define body
''     #define key_sexit                      CUR Strings[196]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sexit CUR Strings [ 196 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sfind CUR Strings[197]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(423): failed to parse full #define body
''     #define key_sfind                      CUR Strings[197]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sfind CUR Strings [ 197 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_shelp CUR Strings[198]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(424): failed to parse full #define body
''     #define key_shelp                      CUR Strings[198]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_shelp CUR Strings [ 198 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_shome CUR Strings[199]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(425): failed to parse full #define body
''     #define key_shome                      CUR Strings[199]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_shome CUR Strings [ 199 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sic CUR Strings[200]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(426): failed to parse full #define body
''     #define key_sic                        CUR Strings[200]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sic CUR Strings [ 200 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sleft CUR Strings[201]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(427): failed to parse full #define body
''     #define key_sleft                      CUR Strings[201]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sleft CUR Strings [ 201 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_smessage CUR Strings[202]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(428): failed to parse full #define body
''     #define key_smessage                   CUR Strings[202]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_smessage CUR Strings [ 202 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_smove CUR Strings[203]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(429): failed to parse full #define body
''     #define key_smove                      CUR Strings[203]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_smove CUR Strings [ 203 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_snext CUR Strings[204]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(430): failed to parse full #define body
''     #define key_snext                      CUR Strings[204]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_snext CUR Strings [ 204 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_soptions CUR Strings[205]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(431): failed to parse full #define body
''     #define key_soptions                   CUR Strings[205]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_soptions CUR Strings [ 205 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sprevious CUR Strings[206]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(432): failed to parse full #define body
''     #define key_sprevious                  CUR Strings[206]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sprevious CUR Strings [ 206 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sprint CUR Strings[207]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(433): failed to parse full #define body
''     #define key_sprint                     CUR Strings[207]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sprint CUR Strings [ 207 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sredo CUR Strings[208]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(434): failed to parse full #define body
''     #define key_sredo                      CUR Strings[208]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sredo CUR Strings [ 208 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sreplace CUR Strings[209]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(435): failed to parse full #define body
''     #define key_sreplace                   CUR Strings[209]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sreplace CUR Strings [ 209 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sright CUR Strings[210]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(436): failed to parse full #define body
''     #define key_sright                     CUR Strings[210]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sright CUR Strings [ 210 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_srsume CUR Strings[211]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(437): failed to parse full #define body
''     #define key_srsume                     CUR Strings[211]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_srsume CUR Strings [ 211 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ssave CUR Strings[212]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(438): failed to parse full #define body
''     #define key_ssave                      CUR Strings[212]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ssave CUR Strings [ 212 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_ssuspend CUR Strings[213]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(439): failed to parse full #define body
''     #define key_ssuspend                   CUR Strings[213]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_ssuspend CUR Strings [ 213 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_sundo CUR Strings[214]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(440): failed to parse full #define body
''     #define key_sundo                      CUR Strings[214]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_sundo CUR Strings [ 214 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define req_for_input CUR Strings[215]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(441): failed to parse full #define body
''     #define req_for_input                  CUR Strings[215]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define req_for_input CUR Strings [ 215 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f11 CUR Strings[216]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(442): failed to parse full #define body
''     #define key_f11                        CUR Strings[216]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f11 CUR Strings [ 216 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f12 CUR Strings[217]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(443): failed to parse full #define body
''     #define key_f12                        CUR Strings[217]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f12 CUR Strings [ 217 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f13 CUR Strings[218]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(444): failed to parse full #define body
''     #define key_f13                        CUR Strings[218]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f13 CUR Strings [ 218 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f14 CUR Strings[219]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(445): failed to parse full #define body
''     #define key_f14                        CUR Strings[219]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f14 CUR Strings [ 219 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f15 CUR Strings[220]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(446): failed to parse full #define body
''     #define key_f15                        CUR Strings[220]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f15 CUR Strings [ 220 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f16 CUR Strings[221]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(447): failed to parse full #define body
''     #define key_f16                        CUR Strings[221]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f16 CUR Strings [ 221 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f17 CUR Strings[222]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(448): failed to parse full #define body
''     #define key_f17                        CUR Strings[222]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f17 CUR Strings [ 222 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f18 CUR Strings[223]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(449): failed to parse full #define body
''     #define key_f18                        CUR Strings[223]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f18 CUR Strings [ 223 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f19 CUR Strings[224]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(450): failed to parse full #define body
''     #define key_f19                        CUR Strings[224]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f19 CUR Strings [ 224 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f20 CUR Strings[225]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(451): failed to parse full #define body
''     #define key_f20                        CUR Strings[225]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f20 CUR Strings [ 225 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f21 CUR Strings[226]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(452): failed to parse full #define body
''     #define key_f21                        CUR Strings[226]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f21 CUR Strings [ 226 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f22 CUR Strings[227]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(453): failed to parse full #define body
''     #define key_f22                        CUR Strings[227]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f22 CUR Strings [ 227 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f23 CUR Strings[228]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(454): failed to parse full #define body
''     #define key_f23                        CUR Strings[228]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f23 CUR Strings [ 228 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f24 CUR Strings[229]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(455): failed to parse full #define body
''     #define key_f24                        CUR Strings[229]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f24 CUR Strings [ 229 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f25 CUR Strings[230]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(456): failed to parse full #define body
''     #define key_f25                        CUR Strings[230]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f25 CUR Strings [ 230 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f26 CUR Strings[231]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(457): failed to parse full #define body
''     #define key_f26                        CUR Strings[231]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f26 CUR Strings [ 231 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f27 CUR Strings[232]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(458): failed to parse full #define body
''     #define key_f27                        CUR Strings[232]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f27 CUR Strings [ 232 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f28 CUR Strings[233]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(459): failed to parse full #define body
''     #define key_f28                        CUR Strings[233]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f28 CUR Strings [ 233 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f29 CUR Strings[234]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(460): failed to parse full #define body
''     #define key_f29                        CUR Strings[234]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f29 CUR Strings [ 234 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f30 CUR Strings[235]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(461): failed to parse full #define body
''     #define key_f30                        CUR Strings[235]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f30 CUR Strings [ 235 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f31 CUR Strings[236]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(462): failed to parse full #define body
''     #define key_f31                        CUR Strings[236]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f31 CUR Strings [ 236 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f32 CUR Strings[237]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(463): failed to parse full #define body
''     #define key_f32                        CUR Strings[237]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f32 CUR Strings [ 237 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f33 CUR Strings[238]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(464): failed to parse full #define body
''     #define key_f33                        CUR Strings[238]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f33 CUR Strings [ 238 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f34 CUR Strings[239]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(465): failed to parse full #define body
''     #define key_f34                        CUR Strings[239]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f34 CUR Strings [ 239 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f35 CUR Strings[240]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(466): failed to parse full #define body
''     #define key_f35                        CUR Strings[240]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f35 CUR Strings [ 240 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f36 CUR Strings[241]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(467): failed to parse full #define body
''     #define key_f36                        CUR Strings[241]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f36 CUR Strings [ 241 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f37 CUR Strings[242]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(468): failed to parse full #define body
''     #define key_f37                        CUR Strings[242]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f37 CUR Strings [ 242 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f38 CUR Strings[243]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(469): failed to parse full #define body
''     #define key_f38                        CUR Strings[243]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f38 CUR Strings [ 243 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f39 CUR Strings[244]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(470): failed to parse full #define body
''     #define key_f39                        CUR Strings[244]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f39 CUR Strings [ 244 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f40 CUR Strings[245]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(471): failed to parse full #define body
''     #define key_f40                        CUR Strings[245]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f40 CUR Strings [ 245 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f41 CUR Strings[246]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(472): failed to parse full #define body
''     #define key_f41                        CUR Strings[246]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f41 CUR Strings [ 246 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f42 CUR Strings[247]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(473): failed to parse full #define body
''     #define key_f42                        CUR Strings[247]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f42 CUR Strings [ 247 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f43 CUR Strings[248]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(474): failed to parse full #define body
''     #define key_f43                        CUR Strings[248]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f43 CUR Strings [ 248 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f44 CUR Strings[249]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(475): failed to parse full #define body
''     #define key_f44                        CUR Strings[249]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f44 CUR Strings [ 249 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f45 CUR Strings[250]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(476): failed to parse full #define body
''     #define key_f45                        CUR Strings[250]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f45 CUR Strings [ 250 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f46 CUR Strings[251]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(477): failed to parse full #define body
''     #define key_f46                        CUR Strings[251]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f46 CUR Strings [ 251 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f47 CUR Strings[252]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(478): failed to parse full #define body
''     #define key_f47                        CUR Strings[252]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f47 CUR Strings [ 252 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f48 CUR Strings[253]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(479): failed to parse full #define body
''     #define key_f48                        CUR Strings[253]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f48 CUR Strings [ 253 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f49 CUR Strings[254]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(480): failed to parse full #define body
''     #define key_f49                        CUR Strings[254]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f49 CUR Strings [ 254 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f50 CUR Strings[255]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(481): failed to parse full #define body
''     #define key_f50                        CUR Strings[255]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f50 CUR Strings [ 255 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f51 CUR Strings[256]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(482): failed to parse full #define body
''     #define key_f51                        CUR Strings[256]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f51 CUR Strings [ 256 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f52 CUR Strings[257]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(483): failed to parse full #define body
''     #define key_f52                        CUR Strings[257]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f52 CUR Strings [ 257 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f53 CUR Strings[258]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(484): failed to parse full #define body
''     #define key_f53                        CUR Strings[258]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f53 CUR Strings [ 258 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f54 CUR Strings[259]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(485): failed to parse full #define body
''     #define key_f54                        CUR Strings[259]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f54 CUR Strings [ 259 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f55 CUR Strings[260]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(486): failed to parse full #define body
''     #define key_f55                        CUR Strings[260]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f55 CUR Strings [ 260 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f56 CUR Strings[261]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(487): failed to parse full #define body
''     #define key_f56                        CUR Strings[261]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f56 CUR Strings [ 261 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f57 CUR Strings[262]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(488): failed to parse full #define body
''     #define key_f57                        CUR Strings[262]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f57 CUR Strings [ 262 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f58 CUR Strings[263]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(489): failed to parse full #define body
''     #define key_f58                        CUR Strings[263]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f58 CUR Strings [ 263 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f59 CUR Strings[264]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(490): failed to parse full #define body
''     #define key_f59                        CUR Strings[264]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f59 CUR Strings [ 264 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f60 CUR Strings[265]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(491): failed to parse full #define body
''     #define key_f60                        CUR Strings[265]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f60 CUR Strings [ 265 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f61 CUR Strings[266]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(492): failed to parse full #define body
''     #define key_f61                        CUR Strings[266]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f61 CUR Strings [ 266 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f62 CUR Strings[267]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(493): failed to parse full #define body
''     #define key_f62                        CUR Strings[267]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f62 CUR Strings [ 267 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_f63 CUR Strings[268]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(494): failed to parse full #define body
''     #define key_f63                        CUR Strings[268]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_f63 CUR Strings [ 268 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define clr_bol CUR Strings[269]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(495): failed to parse full #define body
''     #define clr_bol                        CUR Strings[269]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clr_bol CUR Strings [ 269 ] 
''                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define clear_margins CUR Strings[270]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(496): failed to parse full #define body
''     #define clear_margins                  CUR Strings[270]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define clear_margins CUR Strings [ 270 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_left_margin CUR Strings[271]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(497): failed to parse full #define body
''     #define set_left_margin                CUR Strings[271]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_left_margin CUR Strings [ 271 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_right_margin CUR Strings[272]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(498): failed to parse full #define body
''     #define set_right_margin               CUR Strings[272]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_right_margin CUR Strings [ 272 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define label_format CUR Strings[273]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(499): failed to parse full #define body
''     #define label_format                   CUR Strings[273]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define label_format CUR Strings [ 273 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_clock CUR Strings[274]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(500): failed to parse full #define body
''     #define set_clock                      CUR Strings[274]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_clock CUR Strings [ 274 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define display_clock CUR Strings[275]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(501): failed to parse full #define body
''     #define display_clock                  CUR Strings[275]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define display_clock CUR Strings [ 275 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define remove_clock CUR Strings[276]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(502): failed to parse full #define body
''     #define remove_clock                   CUR Strings[276]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define remove_clock CUR Strings [ 276 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define create_window CUR Strings[277]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(503): failed to parse full #define body
''     #define create_window                  CUR Strings[277]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define create_window CUR Strings [ 277 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define goto_window CUR Strings[278]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(504): failed to parse full #define body
''     #define goto_window                    CUR Strings[278]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define goto_window CUR Strings [ 278 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define hangup CUR Strings[279]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(505): failed to parse full #define body
''     #define hangup                         CUR Strings[279]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define hangup CUR Strings [ 279 ] 
''                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define dial_phone CUR Strings[280]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(506): failed to parse full #define body
''     #define dial_phone                     CUR Strings[280]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define dial_phone CUR Strings [ 280 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define quick_dial CUR Strings[281]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(507): failed to parse full #define body
''     #define quick_dial                     CUR Strings[281]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define quick_dial CUR Strings [ 281 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define tone CUR Strings[282]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(508): failed to parse full #define body
''     #define tone                           CUR Strings[282]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define tone CUR Strings [ 282 ] 
''                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define pulse CUR Strings[283]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(509): failed to parse full #define body
''     #define pulse                          CUR Strings[283]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pulse CUR Strings [ 283 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define flash_hook CUR Strings[284]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(510): failed to parse full #define body
''     #define flash_hook                     CUR Strings[284]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define flash_hook CUR Strings [ 284 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define fixed_pause CUR Strings[285]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(511): failed to parse full #define body
''     #define fixed_pause                    CUR Strings[285]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define fixed_pause CUR Strings [ 285 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define wait_tone CUR Strings[286]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(512): failed to parse full #define body
''     #define wait_tone                      CUR Strings[286]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define wait_tone CUR Strings [ 286 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define user0 CUR Strings[287]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(513): failed to parse full #define body
''     #define user0                          CUR Strings[287]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user0 CUR Strings [ 287 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user1 CUR Strings[288]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(514): failed to parse full #define body
''     #define user1                          CUR Strings[288]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user1 CUR Strings [ 288 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user2 CUR Strings[289]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(515): failed to parse full #define body
''     #define user2                          CUR Strings[289]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user2 CUR Strings [ 289 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user3 CUR Strings[290]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(516): failed to parse full #define body
''     #define user3                          CUR Strings[290]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user3 CUR Strings [ 290 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user4 CUR Strings[291]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(517): failed to parse full #define body
''     #define user4                          CUR Strings[291]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user4 CUR Strings [ 291 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user5 CUR Strings[292]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(518): failed to parse full #define body
''     #define user5                          CUR Strings[292]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user5 CUR Strings [ 292 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user6 CUR Strings[293]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(519): failed to parse full #define body
''     #define user6                          CUR Strings[293]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user6 CUR Strings [ 293 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user7 CUR Strings[294]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(520): failed to parse full #define body
''     #define user7                          CUR Strings[294]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user7 CUR Strings [ 294 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user8 CUR Strings[295]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(521): failed to parse full #define body
''     #define user8                          CUR Strings[295]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user8 CUR Strings [ 295 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define user9 CUR Strings[296]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(522): failed to parse full #define body
''     #define user9                          CUR Strings[296]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define user9 CUR Strings [ 296 ] 
''                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define orig_pair CUR Strings[297]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(523): failed to parse full #define body
''     #define orig_pair                      CUR Strings[297]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define orig_pair CUR Strings [ 297 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define orig_colors CUR Strings[298]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(524): failed to parse full #define body
''     #define orig_colors                    CUR Strings[298]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define orig_colors CUR Strings [ 298 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define initialize_color CUR Strings[299]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(525): failed to parse full #define body
''     #define initialize_color               CUR Strings[299]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define initialize_color CUR Strings [ 299 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define initialize_pair CUR Strings[300]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(526): failed to parse full #define body
''     #define initialize_pair                CUR Strings[300]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define initialize_pair CUR Strings [ 300 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_color_pair CUR Strings[301]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(527): failed to parse full #define body
''     #define set_color_pair                 CUR Strings[301]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_color_pair CUR Strings [ 301 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_foreground CUR Strings[302]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(528): failed to parse full #define body
''     #define set_foreground                 CUR Strings[302]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_foreground CUR Strings [ 302 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_background CUR Strings[303]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(529): failed to parse full #define body
''     #define set_background                 CUR Strings[303]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_background CUR Strings [ 303 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define change_char_pitch CUR Strings[304]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(530): failed to parse full #define body
''     #define change_char_pitch              CUR Strings[304]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define change_char_pitch CUR Strings [ 304 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define change_line_pitch CUR Strings[305]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(531): failed to parse full #define body
''     #define change_line_pitch              CUR Strings[305]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define change_line_pitch CUR Strings [ 305 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define change_res_horz CUR Strings[306]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(532): failed to parse full #define body
''     #define change_res_horz                CUR Strings[306]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define change_res_horz CUR Strings [ 306 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define change_res_vert CUR Strings[307]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(533): failed to parse full #define body
''     #define change_res_vert                CUR Strings[307]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define change_res_vert CUR Strings [ 307 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define define_char CUR Strings[308]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(534): failed to parse full #define body
''     #define define_char                    CUR Strings[308]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define define_char CUR Strings [ 308 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_doublewide_mode CUR Strings[309]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(535): failed to parse full #define body
''     #define enter_doublewide_mode          CUR Strings[309]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_doublewide_mode CUR Strings [ 309 ] 
''                                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_draft_quality CUR Strings[310]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(536): failed to parse full #define body
''     #define enter_draft_quality            CUR Strings[310]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_draft_quality CUR Strings [ 310 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_italics_mode CUR Strings[311]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(537): failed to parse full #define body
''     #define enter_italics_mode             CUR Strings[311]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_italics_mode CUR Strings [ 311 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_leftward_mode CUR Strings[312]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(538): failed to parse full #define body
''     #define enter_leftward_mode            CUR Strings[312]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_leftward_mode CUR Strings [ 312 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_micro_mode CUR Strings[313]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(539): failed to parse full #define body
''     #define enter_micro_mode               CUR Strings[313]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_micro_mode CUR Strings [ 313 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_near_letter_quality CUR Strings[314]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(540): failed to parse full #define body
''     #define enter_near_letter_quality      CUR Strings[314]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_near_letter_quality CUR Strings [ 314 ] 
''                                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_normal_quality CUR Strings[315]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(541): failed to parse full #define body
''     #define enter_normal_quality           CUR Strings[315]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_normal_quality CUR Strings [ 315 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_shadow_mode CUR Strings[316]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(542): failed to parse full #define body
''     #define enter_shadow_mode              CUR Strings[316]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_shadow_mode CUR Strings [ 316 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_subscript_mode CUR Strings[317]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(543): failed to parse full #define body
''     #define enter_subscript_mode           CUR Strings[317]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_subscript_mode CUR Strings [ 317 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_superscript_mode CUR Strings[318]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(544): failed to parse full #define body
''     #define enter_superscript_mode         CUR Strings[318]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_superscript_mode CUR Strings [ 318 ] 
''                                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_upward_mode CUR Strings[319]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(545): failed to parse full #define body
''     #define enter_upward_mode              CUR Strings[319]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_upward_mode CUR Strings [ 319 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_doublewide_mode CUR Strings[320]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(546): failed to parse full #define body
''     #define exit_doublewide_mode           CUR Strings[320]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_doublewide_mode CUR Strings [ 320 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_italics_mode CUR Strings[321]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(547): failed to parse full #define body
''     #define exit_italics_mode              CUR Strings[321]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_italics_mode CUR Strings [ 321 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_leftward_mode CUR Strings[322]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(548): failed to parse full #define body
''     #define exit_leftward_mode             CUR Strings[322]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_leftward_mode CUR Strings [ 322 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_micro_mode CUR Strings[323]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(549): failed to parse full #define body
''     #define exit_micro_mode                CUR Strings[323]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_micro_mode CUR Strings [ 323 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_shadow_mode CUR Strings[324]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(550): failed to parse full #define body
''     #define exit_shadow_mode               CUR Strings[324]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_shadow_mode CUR Strings [ 324 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_subscript_mode CUR Strings[325]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(551): failed to parse full #define body
''     #define exit_subscript_mode            CUR Strings[325]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_subscript_mode CUR Strings [ 325 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_superscript_mode CUR Strings[326]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(552): failed to parse full #define body
''     #define exit_superscript_mode          CUR Strings[326]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_superscript_mode CUR Strings [ 326 ] 
''                                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_upward_mode CUR Strings[327]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(553): failed to parse full #define body
''     #define exit_upward_mode               CUR Strings[327]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_upward_mode CUR Strings [ 327 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_column_address CUR Strings[328]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(554): failed to parse full #define body
''     #define micro_column_address           CUR Strings[328]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_column_address CUR Strings [ 328 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_down CUR Strings[329]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(555): failed to parse full #define body
''     #define micro_down                     CUR Strings[329]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_down CUR Strings [ 329 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_left CUR Strings[330]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(556): failed to parse full #define body
''     #define micro_left                     CUR Strings[330]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_left CUR Strings [ 330 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_right CUR Strings[331]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(557): failed to parse full #define body
''     #define micro_right                    CUR Strings[331]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_right CUR Strings [ 331 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_row_address CUR Strings[332]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(558): failed to parse full #define body
''     #define micro_row_address              CUR Strings[332]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_row_address CUR Strings [ 332 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define micro_up CUR Strings[333]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(559): failed to parse full #define body
''     #define micro_up                       CUR Strings[333]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define micro_up CUR Strings [ 333 ] 
''                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define order_of_pins CUR Strings[334]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(560): failed to parse full #define body
''     #define order_of_pins                  CUR Strings[334]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define order_of_pins CUR Strings [ 334 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_down_micro CUR Strings[335]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(561): failed to parse full #define body
''     #define parm_down_micro                CUR Strings[335]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_down_micro CUR Strings [ 335 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_left_micro CUR Strings[336]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(562): failed to parse full #define body
''     #define parm_left_micro                CUR Strings[336]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_left_micro CUR Strings [ 336 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_right_micro CUR Strings[337]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(563): failed to parse full #define body
''     #define parm_right_micro               CUR Strings[337]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_right_micro CUR Strings [ 337 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define parm_up_micro CUR Strings[338]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(564): failed to parse full #define body
''     #define parm_up_micro                  CUR Strings[338]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define parm_up_micro CUR Strings [ 338 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define select_char_set CUR Strings[339]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(565): failed to parse full #define body
''     #define select_char_set                CUR Strings[339]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define select_char_set CUR Strings [ 339 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_bottom_margin CUR Strings[340]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(566): failed to parse full #define body
''     #define set_bottom_margin              CUR Strings[340]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_bottom_margin CUR Strings [ 340 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_bottom_margin_parm CUR Strings[341]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(567): failed to parse full #define body
''     #define set_bottom_margin_parm         CUR Strings[341]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_bottom_margin_parm CUR Strings [ 341 ] 
''                                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_left_margin_parm CUR Strings[342]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(568): failed to parse full #define body
''     #define set_left_margin_parm           CUR Strings[342]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_left_margin_parm CUR Strings [ 342 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_right_margin_parm CUR Strings[343]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(569): failed to parse full #define body
''     #define set_right_margin_parm          CUR Strings[343]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_right_margin_parm CUR Strings [ 343 ] 
''                                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_top_margin CUR Strings[344]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(570): failed to parse full #define body
''     #define set_top_margin                 CUR Strings[344]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_top_margin CUR Strings [ 344 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_top_margin_parm CUR Strings[345]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(571): failed to parse full #define body
''     #define set_top_margin_parm            CUR Strings[345]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_top_margin_parm CUR Strings [ 345 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define start_bit_image CUR Strings[346]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(572): failed to parse full #define body
''     #define start_bit_image                CUR Strings[346]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define start_bit_image CUR Strings [ 346 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define start_char_set_def CUR Strings[347]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(573): failed to parse full #define body
''     #define start_char_set_def             CUR Strings[347]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define start_char_set_def CUR Strings [ 347 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define stop_bit_image CUR Strings[348]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(574): failed to parse full #define body
''     #define stop_bit_image                 CUR Strings[348]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define stop_bit_image CUR Strings [ 348 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define stop_char_set_def CUR Strings[349]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(575): failed to parse full #define body
''     #define stop_char_set_def              CUR Strings[349]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define stop_char_set_def CUR Strings [ 349 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define subscript_characters CUR Strings[350]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(576): failed to parse full #define body
''     #define subscript_characters           CUR Strings[350]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define subscript_characters CUR Strings [ 350 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define superscript_characters CUR Strings[351]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(577): failed to parse full #define body
''     #define superscript_characters         CUR Strings[351]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define superscript_characters CUR Strings [ 351 ] 
''                                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define these_cause_cr CUR Strings[352]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(578): failed to parse full #define body
''     #define these_cause_cr                 CUR Strings[352]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define these_cause_cr CUR Strings [ 352 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define zero_motion CUR Strings[353]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(579): failed to parse full #define body
''     #define zero_motion                    CUR Strings[353]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define zero_motion CUR Strings [ 353 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define char_set_names CUR Strings[354]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(580): failed to parse full #define body
''     #define char_set_names                 CUR Strings[354]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define char_set_names CUR Strings [ 354 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define key_mouse CUR Strings[355]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(581): failed to parse full #define body
''     #define key_mouse                      CUR Strings[355]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define key_mouse CUR Strings [ 355 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define mouse_info CUR Strings[356]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(582): failed to parse full #define body
''     #define mouse_info                     CUR Strings[356]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define mouse_info CUR Strings [ 356 ] 
''                             ^~~~~~~

'' TODO: unrecognized construct:
'' #define req_mouse_pos CUR Strings[357]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(583): failed to parse full #define body
''     #define req_mouse_pos                  CUR Strings[357]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define req_mouse_pos CUR Strings [ 357 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define get_mouse CUR Strings[358]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(584): failed to parse full #define body
''     #define get_mouse                      CUR Strings[358]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define get_mouse CUR Strings [ 358 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_a_foreground CUR Strings[359]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(585): failed to parse full #define body
''     #define set_a_foreground               CUR Strings[359]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_a_foreground CUR Strings [ 359 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_a_background CUR Strings[360]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(586): failed to parse full #define body
''     #define set_a_background               CUR Strings[360]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_a_background CUR Strings [ 360 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define pkey_plab CUR Strings[361]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(587): failed to parse full #define body
''     #define pkey_plab                      CUR Strings[361]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pkey_plab CUR Strings [ 361 ] 
''                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define device_type CUR Strings[362]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(588): failed to parse full #define body
''     #define device_type                    CUR Strings[362]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define device_type CUR Strings [ 362 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define code_set_init CUR Strings[363]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(589): failed to parse full #define body
''     #define code_set_init                  CUR Strings[363]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define code_set_init CUR Strings [ 363 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define set0_des_seq CUR Strings[364]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(590): failed to parse full #define body
''     #define set0_des_seq                   CUR Strings[364]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set0_des_seq CUR Strings [ 364 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define set1_des_seq CUR Strings[365]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(591): failed to parse full #define body
''     #define set1_des_seq                   CUR Strings[365]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set1_des_seq CUR Strings [ 365 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define set2_des_seq CUR Strings[366]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(592): failed to parse full #define body
''     #define set2_des_seq                   CUR Strings[366]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set2_des_seq CUR Strings [ 366 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define set3_des_seq CUR Strings[367]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(593): failed to parse full #define body
''     #define set3_des_seq                   CUR Strings[367]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set3_des_seq CUR Strings [ 367 ] 
''                               ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_lr_margin CUR Strings[368]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(594): failed to parse full #define body
''     #define set_lr_margin                  CUR Strings[368]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_lr_margin CUR Strings [ 368 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_tb_margin CUR Strings[369]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(595): failed to parse full #define body
''     #define set_tb_margin                  CUR Strings[369]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_tb_margin CUR Strings [ 369 ] 
''                                ^~~~~~~

'' TODO: unrecognized construct:
'' #define bit_image_repeat CUR Strings[370]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(596): failed to parse full #define body
''     #define bit_image_repeat               CUR Strings[370]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bit_image_repeat CUR Strings [ 370 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define bit_image_newline CUR Strings[371]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(597): failed to parse full #define body
''     #define bit_image_newline              CUR Strings[371]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bit_image_newline CUR Strings [ 371 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define bit_image_carriage_return CUR Strings[372]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(598): failed to parse full #define body
''     #define bit_image_carriage_return      CUR Strings[372]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define bit_image_carriage_return CUR Strings [ 372 ] 
''                                            ^~~~~~~

'' TODO: unrecognized construct:
'' #define color_names CUR Strings[373]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(599): failed to parse full #define body
''     #define color_names                    CUR Strings[373]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define color_names CUR Strings [ 373 ] 
''                              ^~~~~~~

'' TODO: unrecognized construct:
'' #define define_bit_image_region CUR Strings[374]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(600): failed to parse full #define body
''     #define define_bit_image_region        CUR Strings[374]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define define_bit_image_region CUR Strings [ 374 ] 
''                                          ^~~~~~~

'' TODO: unrecognized construct:
'' #define end_bit_image_region CUR Strings[375]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(601): failed to parse full #define body
''     #define end_bit_image_region           CUR Strings[375]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define end_bit_image_region CUR Strings [ 375 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_color_band CUR Strings[376]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(602): failed to parse full #define body
''     #define set_color_band                 CUR Strings[376]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_color_band CUR Strings [ 376 ] 
''                                 ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_page_length CUR Strings[377]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(603): failed to parse full #define body
''     #define set_page_length                CUR Strings[377]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_page_length CUR Strings [ 377 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define display_pc_char CUR Strings[378]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(604): failed to parse full #define body
''     #define display_pc_char                CUR Strings[378]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define display_pc_char CUR Strings [ 378 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_pc_charset_mode CUR Strings[379]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(605): failed to parse full #define body
''     #define enter_pc_charset_mode          CUR Strings[379]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_pc_charset_mode CUR Strings [ 379 ] 
''                                        ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_pc_charset_mode CUR Strings[380]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(606): failed to parse full #define body
''     #define exit_pc_charset_mode           CUR Strings[380]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_pc_charset_mode CUR Strings [ 380 ] 
''                                       ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_scancode_mode CUR Strings[381]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(607): failed to parse full #define body
''     #define enter_scancode_mode            CUR Strings[381]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_scancode_mode CUR Strings [ 381 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define exit_scancode_mode CUR Strings[382]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(608): failed to parse full #define body
''     #define exit_scancode_mode             CUR Strings[382]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define exit_scancode_mode CUR Strings [ 382 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define pc_term_options CUR Strings[383]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(609): failed to parse full #define body
''     #define pc_term_options                CUR Strings[383]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define pc_term_options CUR Strings [ 383 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define scancode_escape CUR Strings[384]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(610): failed to parse full #define body
''     #define scancode_escape                CUR Strings[384]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define scancode_escape CUR Strings [ 384 ] 
''                                  ^~~~~~~

'' TODO: unrecognized construct:
'' #define alt_scancode_esc CUR Strings[385]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(611): failed to parse full #define body
''     #define alt_scancode_esc               CUR Strings[385]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define alt_scancode_esc CUR Strings [ 385 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_horizontal_hl_mode CUR Strings[386]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(612): failed to parse full #define body
''     #define enter_horizontal_hl_mode       CUR Strings[386]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_horizontal_hl_mode CUR Strings [ 386 ] 
''                                           ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_left_hl_mode CUR Strings[387]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(613): failed to parse full #define body
''     #define enter_left_hl_mode             CUR Strings[387]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_left_hl_mode CUR Strings [ 387 ] 
''                                     ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_low_hl_mode CUR Strings[388]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(614): failed to parse full #define body
''     #define enter_low_hl_mode              CUR Strings[388]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_low_hl_mode CUR Strings [ 388 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_right_hl_mode CUR Strings[389]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(615): failed to parse full #define body
''     #define enter_right_hl_mode            CUR Strings[389]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_right_hl_mode CUR Strings [ 389 ] 
''                                      ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_top_hl_mode CUR Strings[390]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(616): failed to parse full #define body
''     #define enter_top_hl_mode              CUR Strings[390]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_top_hl_mode CUR Strings [ 390 ] 
''                                    ^~~~~~~

'' TODO: unrecognized construct:
'' #define enter_vertical_hl_mode CUR Strings[391]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(617): failed to parse full #define body
''     #define enter_vertical_hl_mode         CUR Strings[391]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define enter_vertical_hl_mode CUR Strings [ 391 ] 
''                                         ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_a_attributes CUR Strings[392]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(618): failed to parse full #define body
''     #define set_a_attributes               CUR Strings[392]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_a_attributes CUR Strings [ 392 ] 
''                                   ^~~~~~~

'' TODO: unrecognized construct:
'' #define set_pglen_inch CUR Strings[393]
'' ---------------------------------------------------------------------------
'' extracted/ncurses-5.9/include/term.h(619): failed to parse full #define body
''     #define set_pglen_inch                 CUR Strings[393]
''                                                ^~~~~~~
'' context as seen by fbfrog:
''     # define set_pglen_inch CUR Strings [ 393 ] 
''                                 ^~~~~~~

#define BOOLWRITE 37
#define NUMWRITE 33
#define STRWRITE 394
#define beehive_glitch no_esc_ctlc
#define teleray_glitch dest_tabs_magic_smso
#define micro_char_size micro_col_size
#define BOOLCOUNT 44
#define NUMCOUNT 39
#define STRCOUNT 414
#define acs_chars_index 146

type termtype
	term_names as zstring ptr
	str_table as zstring ptr
	Booleans as zstring ptr
	Numbers as short ptr
	Strings as zstring ptr ptr
	ext_str_table as zstring ptr
	ext_Names as zstring ptr ptr
	num_Booleans as ushort
	num_Numbers as ushort
	num_Strings as ushort
	ext_Booleans as ushort
	ext_Numbers as ushort
	ext_Strings as ushort
end type

type TERMTYPE_ as termtype

type term
	as TERMTYPE_ type
	Filedes as short
	Ottyb as termios
	Nttyb as termios
	_baudrate as long
	_termname as zstring ptr
end type

type TERMINAL as term

extern cur_term as TERMINAL ptr

'' TODO: unrecognized construct:
'' extern char * const boolnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const boolnames [ ] ;
''                                     ^
'' extracted/ncurses-5.9/include/term.h(740): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolnames[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const boolcodes[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const boolcodes [ ] ;
''                                     ^
'' extracted/ncurses-5.9/include/term.h(741): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const boolfnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const boolfnames [ ] ;
''                                      ^
'' extracted/ncurses-5.9/include/term.h(742): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolfnames[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const numnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const numnames [ ] ;
''                                    ^
'' extracted/ncurses-5.9/include/term.h(743): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numnames[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const numcodes[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const numcodes [ ] ;
''                                    ^
'' extracted/ncurses-5.9/include/term.h(744): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numcodes[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const numfnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const numfnames [ ] ;
''                                     ^
'' extracted/ncurses-5.9/include/term.h(745): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) numfnames[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const strnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const strnames [ ] ;
''                                    ^
'' extracted/ncurses-5.9/include/term.h(746): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strnames[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const strcodes[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const strcodes [ ] ;
''                                    ^
'' extracted/ncurses-5.9/include/term.h(747): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strcodes[];
''     ^~~~~~

'' TODO: unrecognized construct:
'' extern char * const strfnames[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char * const strfnames [ ] ;
''                                     ^
'' extracted/ncurses-5.9/include/term.h(748): construct found here
''     extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) strfnames[];
''     ^~~~~~

declare function _nc_set_tty_mode(byval buf as termios ptr) as long
declare function _nc_get_tty_mode(byval buf as termios ptr) as long
declare function _nc_read_entry(byval as const zstring const ptr, byval as zstring const ptr, byval as TERMTYPE_ const ptr) as long
declare function _nc_read_file_entry(byval as const zstring const ptr, byval as TERMTYPE_ ptr) as long
declare function _nc_read_termtype(byval as TERMTYPE_ ptr, byval as zstring ptr, byval as long) as long
declare function _nc_first_name(byval as const zstring const ptr) as zstring ptr
declare function _nc_name_match(byval as const zstring const ptr, byval as const zstring const ptr, byval as const zstring const ptr) as long
declare function _nc_fallback(byval as const zstring ptr) as const TERMTYPE_ ptr
declare function set_curterm(byval as TERMINAL ptr) as TERMINAL ptr
declare function del_curterm(byval as TERMINAL ptr) as long
declare function restartterm(byval as zstring ptr, byval as long, byval as long ptr) as long
declare function setupterm(byval as zstring ptr, byval as long, byval as long ptr) as long
declare function tigetstr(byval as zstring ptr) as zstring ptr

'' TODO: unrecognized construct:
'' extern char ttytype[];
'' ---------------------------------------------------------------------------
'' expected expression but found ']'
''     extern char ttytype [ ] ;
''                           ^
'' extracted/ncurses-5.9/include/term.h(773): construct found here
''     extern NCURSES_EXPORT_VAR(char) ttytype[];
''     ^~~~~~

declare function putp(byval as const zstring ptr) as long
declare function tigetflag(byval as zstring ptr) as long
declare function tigetnum(byval as zstring ptr) as long
declare function tparm(byval as zstring ptr, ...) as zstring ptr
declare function tiparm(byval as const zstring ptr, ...) as zstring ptr
declare function tgetstr(byval as zstring ptr, byval as zstring ptr ptr) as zstring ptr
declare function tgoto(byval as const zstring ptr, byval as long, byval as long) as zstring ptr
declare function tgetent(byval as zstring ptr, byval as const zstring ptr) as long
declare function tgetflag(byval as zstring ptr) as long
declare function tgetnum(byval as zstring ptr) as long
declare function tputs(byval as const zstring ptr, byval as long, byval as function(byval as long) as long) as long

end extern
