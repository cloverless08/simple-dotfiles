function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    #no default greeting
    set fish_greeting

    #uses starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    alias ls1 'ls -1 --color=auto'
    alias lsa 'ls -a --color=auto'
    alias rm 'rm -i'
    alias mv 'mv -i'
    alias cp 'cp -i'
    alias cdod 'cd ~/OneDrive'
    alias s 'yay -S'
    alias r 'yay -Rs'
    alias logisim 'java -jar /home/cdemin/Java\ Apps/logisim-generic-2.7.1.jar'
    alias py python
    alias main 'python main.py'
    alias home 'cd ~'

    # Functions
    function mkcd
        mkdir -p $argv[1] && cd $argv[1]
    end

    function newk --description "Resets console condition"
        clear
        source ~/.config/fish/config.fish
    end

    function sd --description "Shutdown with a message"
        echo "[Shutting Down Now...]"
        sleep 1
        shutdown now
    end

    # Startup commands
    fastfetch --logo ~/.config/fastfetch/logo.txt

    set current_hour $(date +%H)
    # echo $current_hour

    set CURRENT_DATETIME $(date +"%Y-%m-%d %H:%M:%S")
    # echo "Current date and time: $CURRENT_DATETIME"

    set name "Enter your name here (config.fish ln 73)"
    if test $current_hour -ge 0; and test $current_hour -lt 12
        set greeting "Good Morning"
    else if test $current_hour -ge 12; and test $current_hour -lt 18
        set greeting "Good Afternoon"
    else if test $current_hour -ge 18; and test $current_hour -lt 24
        set greeting "Good Evening"
    else
        set greeting "Welcome Back"
    end

    echo (set_color cyan)(date "+%A, %b %d, %Y")(set_color yellow)" • "(date "+%H:%M %p")(set_color normal)
    echo "$greeting $name, what shall we do today?"
    echo " "

    set -x XDG_CONFIG_HOME $HOME/.config
    export EDITOR="nvim"

end
