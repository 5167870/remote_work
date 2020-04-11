#!/bin/bash
set -e

THIS_DIR=$(cd "$(dirname "$0")"; pwd)
THIS_SCRIPT="$(basename "$0")"

function Usage() {
   echo "Usage:"
   echo "   $THIS_SCRIPT pixel quick|full"
}


if [ "$2" = "quick" ]
then
   echo "Installing fish quickly"
   set -x
   set +x
elif [ "$2" = "full" ]
then
   echo "Installing fish from the scratch"
   set -x
   sudo aptitude update
   sudo aptitude install fish
   curl -L https://get.oh-my.fish > install
   echo "bbace7ef16956d87fd40bff91cd1992a90621e7931ac3055f16b7f6d679e8fff install" | sha256sum --check
   fish install --path=~/.local/share/omf --config=~/.config/omf --noninteractive --yes
   rm install
   fish -c "omf install bobthefish"
   mkdir -p ~/.config/fish/
   set +x
else
   Usage
   exit 1
fi


set -x
cp -r ${THIS_DIR}/fish/* ~/.config/fish/
set +x


if [ "$1" = "pixel" ]
then
   set -x
   cp -r ${THIS_DIR}/aliases_pixel.fish ~/.config/fish/conf.d/
   set +x
elif [ "$1" = "work_bloom" ]
then
   set -x
   cp -r ${THIS_DIR}/aliases_work_bloom.fish ~/.config/fish/conf.d/
   set +x
else
   Usage
   exit 1
fi

echo "To make fish your default shell, issue: chsh -s /usr/bin/fish"
echo "To restore your default shell: chsh -s /bin/bash"
