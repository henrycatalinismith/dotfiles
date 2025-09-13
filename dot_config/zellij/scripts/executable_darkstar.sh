#!/usr/bin/env bash

get_phase_day () {
 local lp=2551443
 local now=$(date -ju +"%s")
 local newmoon=592500
 local phase=$((($now - $newmoon) % $lp))
 echo $(((phase / 86400) + 1))
}

get_moon_icon () {
 local phase_number=$(get_phase_day)
 local phase_number_biggened=$((phase_number * 100000))
 if   [ $phase_number_biggened -lt 184566 ];  then echo "🌑"
 elif [ $phase_number_biggened -lt 553699 ];  then echo "🌒"
 elif [ $phase_number_biggened -lt 922831 ];  then echo "🌓"
 elif [ $phase_number_biggened -lt 1291963 ]; then echo "🌔"
 elif [ $phase_number_biggened -lt 1661096 ]; then echo "🌕"
 elif [ $phase_number_biggened -lt 2030228 ]; then echo "🌖"
 elif [ $phase_number_biggened -lt 2399361 ]; then echo "🌗"
 elif [ $phase_number_biggened -lt 2768493 ]; then echo "🌘"
 else                                              echo "🌑"
 fi
}

get_moon_icon

