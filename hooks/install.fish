function __fcd_warn -d "Echo to STDERR"
	set -l options 'e/error' 'w/warn' 'i/info' 'h/help'

	set -l error 0
	set -l color (set_color normal)

	argparse $options -- $argv

	if set -q _flag_help
		echo "Output to STDERR"
		echo "Options:"
		echo "  -e, --error   Error level message"
		echo "  -w, --warn    Warning level message"
		echo "  -i, --info    Info level message"
		return
	end

	if set -q _flag_error
		set color (set_color -b brred brwhite)
	else if set -q _flag_warn
		set color (set_color -b bryellow black)
	else if set -q _flag_info
		set color (set_color brgreen)
	end
	set -l prompt (set_color bryellow)
	printf '%s>%s %s%s%s\n' $prompt $prompt $color "$argv" (set_color normal) >&2
end

__fcd_warn "fuzzy_cd: testing prerequisites"

if not test -d ~/.marks
	__fcd_warn -e "fuzzy_cd: jump doesn't appear to be installed. Please see https://github.com/oh-my-fish/plugin-jump"
	__fcd_warn "......... if you have oh-my-fish installed, you can use `omf install jump`"
else
	__fcd_warn "......... jump is installed"
end

if not test (which fzf)
	__fcd_warn -e "fuzzy_cd: fzf is not installed/available in PATH. Please install https://github.com/junegunn/fzf"
	__fcd_warn "......... if you're on a Mac and have Homebrew installed, you can use `brew install fzf`"
else
	__fcd_warn "......... fzf is available"
end


if not test (which fasd)
	__fcd_warn -e "fuzzy_cd: fasd is not installed/available in PATH. Please install https://github.com/clvv/fasd"
	__fcd_warn "......... if you're on a Mac and have Homebrew installed, you can use `brew install fasd`"
else
	__fcd_warn "......... fasd is available"
end

source ../init.fish
