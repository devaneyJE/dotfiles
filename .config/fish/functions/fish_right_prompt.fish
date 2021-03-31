# devaneyJE right fish prompt
# adapted from omf theme 'clearance'

# checking for git branch and status
function _git_branch
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_right_prompt
    # git colors
    set -l dirty_col (set_color '#ff62ff')
    set -l clean_col (set_color '#6de148')
    set -l normal (set_color normal)

    # git branch and status
    if [ (_git_branch) ]
       set -l branch (_git_branch)

       if [ (_git_dirty) ]
          set git_info $normal '(' $dirty_col $branch $normal ')'
       else
          set git_info $normal '(' $clean_col $branch $normal ')'
	   end
    end

    echo -n -s $git_info ' '

	set -l time_icon_col (set_color '#ffaeff')
	set -l time_icon $time_icon_col(echo 'ﮫ ')
	set -l time_col (set_color '#6e6e6e')
	set -l time $time_col(date "+%H:%M:%S")
	
	echo -n -s $time ' ' $time_icon
end
