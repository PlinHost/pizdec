//MATH

proc/pow(var/x, var/level) //���������� � �������
	var/i = 1
	while(i < level)
		i++
		x = x*x

	return x