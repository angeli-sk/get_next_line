/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_good.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: nphilipp <nphilipp@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/16 12:29:59 by nphilipp      #+#    #+#                 */
/*   Updated: 2020/07/30 18:00:54 by akramp        ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include "get_next_line.h"
#include "pokedex_ascii.h"
#include <time.h>
int	main(int ac, char **av)
{
	int		retval;
	int		i;
	int		fd;
	char	*str;

    srand( time(NULL) );
    int x;
    x = rand();
	if ((x % 151) <= 0)
		x = 1;
	retval = 1;
	i = 0;
	fd = 0;
	str = NULL;
	if (ac >= 2)
		fd = open(av[1], O_RDONLY);
	printf("\033[38;5;33m\n\033[38;5;96m");
	// str = malloc(sizeof(char) * 4);
	// str = "abc";
	// printf("%s\n", str);
	while (retval == 1)
	{
		retval = get_next_line(fd, &str);
		printf("%d | %s\n", retval, str);
		free(str);
		i++;
	}
	//srand(151);
	print_pokemon(x % 151);
	//  while (1)
	//  ;
	return (0);
}
