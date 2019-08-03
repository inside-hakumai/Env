set PROMPT_R_ARROW   # PowerlineFontを導入することで表示できる右向きの三角形アイコン
set PROMPT_L_ARROW   # PowerlineFontを導入することで表示できる左向きの三角形アイコン
set pf_b (set_color black)
set pb_b (set_color -b black)
set pf_bl (set_color blue)
set pb_bl (set_color -b blue)
set pf_w (set_color white)
set pb_w (set_color -b white)
set pf_g (set_color green)
set pf_r (set_color red)
set pb_r (set_color -b red)
set pf_y (set_color yellow)
set pf_by (set_color -o yellow)
set pb_y (set_color -b yellow)
set pf_n (set_color normal)
set pb_n (set_color -b normal)

set fish_prompt_pwd_dir_length 2

set CHECK_ICON 
set EXIT_ICON "↵"

function exit_code_prompt
  if [ $RETVAL -eq 0 ]
    printf "$pf_b$PROMPT_L_ARROW$pf_g$pb_b %s  $pf_n" $CHECK_ICON
  else
    printf "$pf_r$PROMPT_L_ARROW$pf_by$pb_r %s %s $pf_n" $RETVAL $EXIT_ICON
  end
end

# fishのプロンプトが表示される前に、直前に実行されたコマンドのexit codeを環境変数に保存する
function store_exit_code --on-event fish_prompt
  set -g RETVAL "$status"
end

# fishのプロンプトの装飾
function fish_prompt --description 'Write out the prompt'
  printf "$pf_w$pb_b %s $pf_b$pb_bl$PROMPT_R_ARROW %s $pb_n$pf_bl$PROMPT_R_ARROW$pf_n " (whoami) (prompt_pwd)
end

# fishのプロンプト（右側）の装飾
function fish_right_prompt --description 'Write out the right prompt'
  printf "%s" (exit_code_prompt)
end
