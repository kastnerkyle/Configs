import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- alt 0 to take a screenshot
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , startupHook = setWMName "LG3D"
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeys`
        [((mod1Mask, 0x30), spawn "scrot screen_%Y-%m-%d-%H-%M-%S.png -d 1")
        ,((mod1Mask .|. shiftMask, 0x30), spawn "scrot window_%Y-%m-%d-%H-%M-%S.png -d 1-u") 
        ,((0, 0x1008FF11), spawn "amixer set Master 5-")
        ,((0, 0x1008FF13), spawn "amixer set Master 5+")
        ,((0, 0x1008FF12), spawn "amixer -q -D pulse set Master toggle")
        ,((0, 0x1008FF02), spawn "xbacklight -inc 10")
        ,((0, 0x1008FF03), spawn "xbacklight -dec 10")
        ]
