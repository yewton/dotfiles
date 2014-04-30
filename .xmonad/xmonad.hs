import qualified Data.Map as M

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Actions.WindowGo
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Layout
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad

tall = ResizableTall 1 (3/100) (1/2) []
layout = avoidStruts $ smartBorders $ mkToggle1 FULL $ gaps [(U,24)] $ tall ||| Mirror tall
works = map show [1..9]
modm = mod4Mask

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig
       { borderWidth = 2
       , terminal = "urxvt"
       , normalBorderColor = "#99ccff"
       , focusedBorderColor = "#0033dd"
       , layoutHook = layout
       , manageHook = manageDocks <+> composeAll
                      [ className =? "MPlayer" --> doFloat,
                        className =? "Gimp"    --> doFloat,
                        title     =? "Speedbar" --> doFloat,
                        title     =? "Adobe Reader" --> doFloat]
       , logHook = ewmhDesktopsLogHook
       , workspaces = works
       , modMask = modm }
       `additionalKeys`
       [ ((modm, xK_f), sendMessage (Toggle FULL))
       , ((modm, xK_g), sendMessage ToggleGaps)
       , ((modm, xK_j), sendMessage MirrorShrink)
       , ((modm, xK_k), sendMessage MirrorExpand)
       , ((modm, xK_period), windows W.focusDown)
       , ((modm, xK_comma), windows W.focusUp)
       , ((modm .|. shiftMask, xK_period), windows W.swapDown)
       , ((modm .|. shiftMask, xK_comma), windows W.swapUp)
       , ((modm, xK_w), nextScreen) ]
       `additionalKeys`
       [ ((modm .|. m, k), windows $ f i)
         | (i, k) <- zip works
                     [ xK_exclam, xK_at, xK_numbersign
                     , xK_dollar, xK_percent, xK_asciicircum
                     , xK_ampersand, xK_asterisk, xK_parenleft
                     , xK_parenright
                     ]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]
       `additionalKeys`
       [ ((modm, xK_a), runOrRaise "emacs-x-restart" (className =? "Emacs"))
       , ((modm, xK_s), runOrRaise "urxvt" (className =? "URxvt"))
       , ((modm, xK_d), runOrRaise "firefox" (className =? "Firefox"))
       ]
