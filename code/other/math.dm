//MATH

proc/pow(var/x, var/level) //возведение в степень
	var/i = 1
	while(i < level)
		i++
		x = x*x

	return x