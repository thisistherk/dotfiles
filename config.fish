

# Vulkan SDK
set --export VULKAN_SDK $HOME/vulkansdk-macos-1.1.108.0/macOS
set --export DYLD_LIBRARY_PATH $VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
set --export VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d
set --export VK_ICD_FILENAMES $VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json

# Set Go path
set --export GOPATH $HOME/go

# Set path
set -U fish_user_paths /usr/local/opt/llvm/bin $HOME/bin $GOPATH/bin $HOME/.cargo/bin $VULKAN_SDK/bin

# Preferred editor for local and remote sessions
set --export EDITOR vim

# ssh
set --export SSH_KEY_PATH ~/.ssh/rsa_id

# Rust stuff
set --export CARGO_HOME $HOME/.cargo

# FZF command from https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
set --export FZF_DEFAULT_COMMAND rg --files --no-ignore --hidden --follow --glob "!.git/*"

# Work around SIP DYLD_LIBRARY_PATH issues with default lldb in /usr/bin
alias lldb /Applications/Xcode.app/Contents/Developer/usr/bin/lldb

# Git prompt config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green

# Switch to vi mode
fish_vi_key_bindings

# Hide vi mode indicator
function fish_mode_prompt
end

# Prompt
function fish_prompt
    set_color blue
    printf (date "+$c2%H$c0:$c2%M$c0:$c2%S ")
    echo -n "[" (prompt_pwd) "] "
    set_color white
    echo -n "> "
    set_color normal
end

# Right side prompt
function fish_right_prompt
    if test $fish_bind_mode = default
        set_color red
        echo "[VI]"
    end
    set_color yellow
    printf " %s" (__fish_git_prompt)
end

