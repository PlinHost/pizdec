#!/bin/bash
git show HEAD:map/my_map.dmm > tmp.dmm
java -jar MapPatcher.jar -clean tmp.dmm '../map/my_map.dmm' '../map/my_map.dmm'
rm tmp.dmm