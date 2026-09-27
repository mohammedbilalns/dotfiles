#!/bin/bash

pkg_list=$(
  {
    pacman -Sl | awk '{print $2 "\t[" $1 "]"}'     
    paru -Slq   | awk '{print $1 "\t[AUR]"}'      #
  } | awk -F'\t' '!seen[$1]++'
)

fzf_args=(
  --multi
  --delimiter='\t'
  --with-nth=1,2
  --preview '
    if [[ {2} =~ AUR ]]; then
      paru -Siia {1}
    else
      pacman -Si {1}
    fi
  '
  --preview-label='alt-p: toggle description, alt-b/B: toggle PKGBUILD, alt-j/k: scroll, tab: multi-select'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --bind 'alt-b:change-preview:paru -Gp {1} | tail -n +5'
  --bind 'alt-B:change-preview:paru -Siia {1}'
  --color 'pointer:green,marker:green,label:blue'
)

pkg_names=$(echo "$pkg_list" | fzf "${fzf_args[@]}" | cut -f1)

if [[ -n "$pkg_names" ]]; then
  echo "$pkg_names" | tr '\n' ' ' | xargs paru -S --noconfirm
  sudo updatedb
  echo "Packages installed!"
fi


