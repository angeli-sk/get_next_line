/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   get_next_line_utils_bonus.c                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: akramp <marvin@codam.nl>                     +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/26 14:09:46 by akramp         #+#    #+#                */
/*   Updated: 2019/12/29 18:26:57 by akramp        ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line_bonus.h"

int			ft_strlen(const char *str)
{
	int i;

	i = 0;
	while (str[i] != '\0')
		i++;
	return (i);
}

void		*ft_memcpy(void *dst, const void *src, int n)
{
	int				i;
	unsigned char	*s;
	unsigned char	*d;

	i = 0;
	s = (unsigned char *)src;
	d = (unsigned char *)dst;
	if (d == 0 && s == 0)
		return (0);
	while (i < n)
	{
		d[i] = s[i];
		i++;
	}
	return (d);
}

char		*ft_fill(char *str, char const *s1, char const *s2)
{
	int i;
	int n;

	i = 0;
	n = 0;
	while (s1[i] != '\0')
	{
		str[i] = s1[i];
		i++;
	}
	while (s2[n] != '\0')
	{
		str[i] = s2[n];
		n++;
		i++;
	}
	str[i] = '\0';
	return (str);
}

int			ft_free(char **str, char **buffer, int check)
{
	free(*str);
	*str = 0;
	if (check == 0)
		free(*buffer);
	return (0);
}

char		*ft_strjoin(char *s1, char *s2)
{
	int		i;
	int		n;
	int		s1_len;
	int		s2_len;
	char	*str;

	i = 0;
	n = 0;
	s1_len = ft_strlen(s1);
	s2_len = ft_strlen(s2);
	if (s1 == 0 || s2 == 0)
		return (0);
	str = (char *)malloc(sizeof(char) * (s1_len + s2_len) + 2);
	if (str == 0)
	{
		free(str);
		return (0);
	}
	str[(s1_len + s2_len) + 1] = '\0';
	str = ft_fill(str, s1, s2);
	free(s1);
	return (str);
}
