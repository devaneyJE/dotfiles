# devaneyJE fish prompt

function __prompt_working_dir
	set -l logo_col (set_color '#9f63f6')
	set -l logo $logo_col(echo '  ')
	set -l cwd_col (set_color cyan)
	set -l cwd $cwd_col(pwd | sed "s:^$HOME:~:")

	echo -n -s $logo $cwd
end

function __prompt_arrow
    set -l arrow1_col (set_color '#f9fdd1')
    set -l arrow2_col (set_color '#f1fa8c')
    set -l arrow3_col (set_color '#ffff4d')
	set -l arrow1 $arrow1_col(echo '⟩')
	set -l arrow2 $arrow2_col(echo '⟩')
	set -l arrow3 $arrow3_col(echo '⟩')

    echo -n -s $arrow1 $arrow2 $arrow3 ' '
end

function fish_prompt
    echo ''
    echo -n -s (__prompt_working_dir)\n(__prompt_arrow)
end
