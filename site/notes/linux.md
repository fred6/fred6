# linux setup

This is a collection of notes to future me's who have forgotten what needs to be done to a fresh installation of Arch Linux. 

First thing to remember: install *wireless_tools*. My weapon of choice is an Acer Aspire One 722, so you need this to make the internets work.


File changes:

### /etc/bash.bashrc

Change the PS1 assignment line to

    PS1='\[\e[4;34m\]\u@\h \w \$\[\e[0m\] '


This makes a simple bash prompt with color (blue), underline and absolute paths displayed

### ~/.bashrc
Current full contents:

    export PS1="\[\e[4;35m\]\u@\h \w \$\[\e[0m\] "


Same as for /etc/bash.bashrc, except the color here is purple. Used to distinguish between my user and root.


### ~/.bash_profile
Simple as of yet:

    sudo bash bin/wifi &
    startx

bin/wifi is a script for connecting to the internet via wpa_supplicant and dhcpd

### ~/.xinitrc

    urxvtd &

    setxkbmap carpalx -option caps:swapescape

    xset r rate 200 25

    sh ~/.fehbg &
    xrdb ~/.Xresources
    spectrwm

Starts the urxvtd daemon, sets keyboard to my custom layout (see below) with caps and escape swapped, and finally starts the spectrwm tiling WM.


### /usr/share/X11/xkb/symbols/carpalx
In its entirety:

    // carpalx layouts
    // see http://mkweb.bcgsc.ca/carpalx/

    // xkb keymap prepared by sven moritz hallberg <pesco@khjk.org>
    // see http://www.khjk.org/log/2011/jan/carpalx.html
    // copyright 2011, isc license


    // to use, copy to /usr/share/X11/xkb/symbols/carpalx and add the following
    // lines to /usr/share/X11/xkb/symbols.dir:
    //
    //     -dp----- a------- carpalx(qgmlwb)
    //     --p----- a------- carpalx(qgmlwy)
    //     --p----- a------- carpalx(qfmlwy)
    //     --p----- a------- carpalx(qwkrfy)
    //     --p----- a------- carpalx(qwyrfm)
    //     --p----- a------- carpalx(tnwmlc)
    //
    // then load with, e.g.
    //
    //     setxkbmap carpalx                            # defaults to QGMLWB
    //     setxkbmap -layout carpalx -variant qwkrfy    # to select other variants


    default
    partial alphanumeric_keys
    xkb_symbols "qwkrfy3" {

        include "latin"
        include "latin(nodeadkeys)"

        name[Group1] = "QWKRFY3 - 3 keys swapped wrt. QWERTY";

        key <AD03>  { [         k,          K,          kra,    ampersand ] };
        key <AD05>  { [         f,          F,      dstroke,  ordfeminine ] };
        key <AD09>  { [         j,          J ] };

        key <AC04>  { [         t,          T,       tslash,       Tslash ] };
        key <AC07>  { [         o,          O,       oslash,     Ooblique ] };
        key <AC08>  { [         e,          E ] };


    };

I took the carpalx X11 keyboard setup available from carpalx website and modified it by removing everything I don't use, then tweaking qwkrfy. Specifically, I use a 3-swap alternative of qwkrfy (which I've called qwkrfy3 here) which does not swap A & S or N & G. You've got to modify symbols.dir like it says, but that's straightforward.


### ~/.fehbg

    feh --bg-scale '/mnt/bits/unorg/images/earthrise.jpg'

### ~/.Xresources

    ! urxvt
    !
    URxvt*geometry:                115x40
    !URxvt*font:  xft:cure:pixelsize=12
    URxvt*depth:                24
    URxvt*background:            [80]#000000
    URxvt*foreground:            [60]#ffffff
    URxvt*borderless: 1
    URxvt*scrollBar:            false
    URxvt*saveLines:  2000
    URxvt.urlLauncher: firefox
    URxvt.matcher.button: 1
    URxvt.transparent:      true
    URxvt.shading:  20
    URxvt*termName:screen-256color


### /etc/spectrwm.conf
Here's the section that's different:

    color_unfocus       = rgb:ff/ff/ff
    color_focus     = rgb:ff/00/7f

    # bar settings
    # bar_enabled       = 1
    # bar_border_width  = 1
    bar_border[1]       = rgb:ff/00/7f
    bar_color[1]        = black
    bar_font_color[1]   = rgb:c0/c0/c0
    bar_font        = -*-profont-*-*-*-*-15-*-*-*-*-*-*-*
    bar_action      = conky
    # bar_delay     = 1
    # bar_justify       = left
    # bar_at_bottom     = 1
    # stack_enabled     = 1
     clock_enabled      = 0
    # clock_format      = %Y %b %d %R %Z
    # title_name_enabled    = 0
    # title_class_enabled   = 0
    # window_name_enabled   = 0
    # verbose_layout        = 1
    # focus_mode        = default
    # disable_border        = 1
    # border_width      = 1
    # urgent_enabled        = 1

    # spawn app
    # program[term]     = urxvtc
    # program[screenshot_all]   = screenshot.sh full
    # program[screenshot_wind]  = screenshot.sh window
    # program[lock]     = xlock
    # program[initscr]  = initscreen.sh
    # program[menu]     = dmenu_run -fn $bar_font -nb $bar_color -nf $bar_font_color -sb $bar_border -sf $bar_color
    spawn_term      = urxvtc
    # dialog box size ratio .3 >= r < 1
    # dialog_ratio      = 0.6

Basically, terminal is urxvtc, bar_font is bigger (you need xfontsel to get the right format here), and some colors. 

### /etc/conky/conky.conf

    out_to_x no
    background no
    out_to_console yes
    update_interval 2
    total_run_times 0
    use_spacer none
    TEXT
    ${time %R %d-%b-%Y}  Batt:${battery}  RAM:${memperc}%  CPU:${cpu cpu0}%  Wifi: ${wireless_essid wlan0} [${wireless_link_bar 5,10 wlan0}]

In order to get ${battery} working, have to install acpi.

### .vimrc
I use vim a lot. This is my current vimrc:

    set nocompatible
    syntax enable
    set encoding=utf-8
    set showcmd
    set ruler
    filetype plugin indent on

    "" Whitespace
    set tabstop=4 shiftwidth=4
    set expandtab
    set backspace=indent,eol,start

    "" fucking bell
    :set vb

    "" Searching
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    set hidden
    set autochdir

    "" color
    colorscheme molokai


    "" Text wrapping
    set wrap
    set linebreak
    set nolist
    set showbreak

You also need to install the molokai theme into .vim/colors/

## flash sound (youtube)
In order to get this working, have to add my username to the 'audio' group. It's required by alsa?

