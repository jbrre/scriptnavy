#!/bin/bash


# On teste les maps valides, si l'une d'elles fail on incrémente
# une variable, à la fin si la variable est supérieure à 0 ça voudra
# dire qu'au moins 1 test a fail

#Tests pour les maps valides
let "fail_valid = 0"
echo "Testing valid maps..."
../navy valid_maps/valid1 > /dev/null
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 1 failed"
fi
../navy valid_maps/valid2 > /dev/null
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 2 failed"
fi
../navy valid_maps/valid3 > /dev/null
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 3 failed"
fi
../navy valid_maps/valid4 > /dev/null
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 4 failed"
fi
../navy valid_maps/valid5 > /dev/null
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 5 failed"
fi
if [ $? = 84 ]; then
		let "fail_valid += 1"
		echo "Valid map 6 failed"
fi
if [ $fail_valid != 0 ]; then
		echo "Valid maps : $fail_valid tests failed"
else
		echo "Valid maps : All tests succed !"
fi

#Tests pour les maps non valides
let "fail_bad = 0"
echo "Testing bad maps..."
../navy not_valid_maps/empty_file > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 1 (empty file) failed"
fi
../navy not_valid_maps/not_enough_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 2 (not enough boats) failed"
fi
../navy not_valid_maps/too_big_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 3 (too big boats) failed"
fi
../navy not_valid_maps/too_much_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 4 (too much boats) failed"
fi
../navy not_valid_maps/too_small_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 5 (too small boats) failed"
fi
../navy not_valid_maps/not_corresponding_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 6 (not corresponding boats) failed"
fi
../navy not_valid_maps/diagonal_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 7 (diagonal boats) failed"
fi
../navy not_valid_maps/superposed_boats > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 8 (superposed boats) failed"
fi
../navy not_valid_maps/no_existing_pos > /dev/null
if [ $? != 84 ]; then
		let "fail_bad += 1"
		echo "Bad map 9 (not existing pos) failed"
fi
if [ $fail_bad != 0 ]; then
		echo "Bad maps : $fail_bad tests failed"
else
		echo "Bad maps : All tests succed !"
fi