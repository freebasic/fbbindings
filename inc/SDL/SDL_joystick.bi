#pragma once

#include once "SDL_stdinc.bi"
#include once "SDL_error.bi"
#include once "begin_code.bi"
#include once "close_code.bi"

extern "C"

#define _SDL_joystick_h
type SDL_Joystick as _SDL_Joystick
declare function SDL_NumJoysticks() as long
declare function SDL_JoystickName(byval device_index as long) as const zstring ptr
declare function SDL_JoystickOpen(byval device_index as long) as SDL_Joystick ptr
declare function SDL_JoystickOpened(byval device_index as long) as long
declare function SDL_JoystickIndex(byval joystick as SDL_Joystick ptr) as long
declare function SDL_JoystickNumAxes(byval joystick as SDL_Joystick ptr) as long
declare function SDL_JoystickNumBalls(byval joystick as SDL_Joystick ptr) as long
declare function SDL_JoystickNumHats(byval joystick as SDL_Joystick ptr) as long
declare function SDL_JoystickNumButtons(byval joystick as SDL_Joystick ptr) as long
declare sub SDL_JoystickUpdate()
declare function SDL_JoystickEventState(byval state as long) as long
declare function SDL_JoystickGetAxis(byval joystick as SDL_Joystick ptr, byval axis as long) as Sint16

const SDL_HAT_CENTERED = &h00
const SDL_HAT_UP = &h01
const SDL_HAT_RIGHT = &h02
const SDL_HAT_DOWN = &h04
const SDL_HAT_LEFT = &h08
#define SDL_HAT_RIGHTUP (SDL_HAT_RIGHT or SDL_HAT_UP)
#define SDL_HAT_RIGHTDOWN (SDL_HAT_RIGHT or SDL_HAT_DOWN)
#define SDL_HAT_LEFTUP (SDL_HAT_LEFT or SDL_HAT_UP)
#define SDL_HAT_LEFTDOWN (SDL_HAT_LEFT or SDL_HAT_DOWN)

declare function SDL_JoystickGetHat(byval joystick as SDL_Joystick ptr, byval hat as long) as Uint8
declare function SDL_JoystickGetBall(byval joystick as SDL_Joystick ptr, byval ball as long, byval dx as long ptr, byval dy as long ptr) as long
declare function SDL_JoystickGetButton(byval joystick as SDL_Joystick ptr, byval button as long) as Uint8
declare sub SDL_JoystickClose(byval joystick as SDL_Joystick ptr)

end extern
