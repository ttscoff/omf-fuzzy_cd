fcd_warn "fuzzy_cd: testing prerequisites"

if not test -d ~/.marks
	fcd_warn -e "fuzzy_cd: jump doesn't appear to be installed. Please see https://github.com/oh-my-fish/plugin-jump"
	fcd_warn "......... if you have oh-my-fish installed, you can use `omf install jump`"
else
	fcd_warn "......... jump is installed"
end

if not test (which fasd)
	fcd_warn -e "fuzzy_cd: fasd is not installed/available in PATH. Please install https://github.com/clvv/fasd"
	fcd_warn "......... if you're on a Mac and have Homebrew installed, you can use `brew install fasd`"
else
	fcd_warn "......... fasd is available"
end
