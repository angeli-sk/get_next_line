/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   get_next_line_bonus.c                              :+:    :+:            */
/*                                                     +:+                    */
/*   By: akramp <marvin@codam.nl>                     +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/26 14:08:34 by akramp         #+#    #+#                */
/*   Updated: 2019/12/10 21:58:33 by akramp        ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include "get_next_line_bonus.h"

char		*ft_strdup(const char *s1)
{
	size_t	len;
	char	*s2;

	len = ft_strlen(s1);
	s2 = (char *)malloc(sizeof(char) * (len + 1));
	if (s2 == 0)
		return (0);
	ft_strlcpy(s2, s1, len + 1);
	return (s2);
}

size_t		ft_strlcpy(char *dst, const char *src, size_t dstsize)
{
	size_t srclen;
	size_t dstlen;

	if (src == 0)
		return (0);
	srclen = ft_strlen(src);
	if (dstsize == 0)
		return (srclen);
	dstlen = dstsize - 1;
	if (srclen < dstsize)
		dstlen = srclen;
	ft_memcpy(dst, src, dstlen);
	dst[dstlen] = '\0';
	return (srclen);
}

int			g_n_l_read(char **str, char *buffer, int fd, int *i)
{
	int ret;

	ret = 1;
	if ((*str)[*i] == '\n')
	{
		ret = read(fd, buffer, BUFFER_SIZE);
		buffer[ret] = '\0';
		(*str) = ft_strjoin((*str), buffer);
	}
	while ((*str)[*i] != '\n')
	{
		if (((*i) % BUFFER_SIZE) == 0)
		{
			ret = read(fd, buffer, BUFFER_SIZE);
			buffer[ret] = '\0';
			(*str) = ft_strjoin((*str), buffer);
		}
		if ((*str)[*i] == '\n' || (*str)[*i] == '\0')
			break ;
		(*i)++;
	}
	return (ret);
}

int			g_n_l_eol(int ret, char **str, int *i)
{
	while ((ret == 0 || (ret == 1 && BUFFER_SIZE != 1)))
	{
		if ((*str)[*i] == '\n' || (*str)[*i] == '\0')
			break ;
		(*i)++;
	}
	if ((ret == 0 && (*str)[*i] != '\0') || ret != 0)
		ret = 1;
	return (ret);
}

int			get_next_line_bonus(int fd, char **line)
{
	char			*buffer;
	static char		*str[1024];
	int				ret;
	int				i;

	i = 0;
	ret = 1;
	buffer = NULL;
	if (fd < 0 || line == 0 || read(fd, 0, 0) == -1)
		return (-1);
	if (ret != 0)
		buffer = malloc(sizeof(char) * (BUFFER_SIZE + 1));
	if (buffer == 0)
		return (-1);
	if (str[fd] == 0)
		str[fd] = ft_strdup("");
	ret = g_n_l_read(&str[fd], buffer, fd, &i);
	ret = g_n_l_eol(ret, &str[fd], &i);
	if (!*line)
		free(*line);
	*line = malloc(sizeof(char) * i + 1);
	ft_strlcpy(*line, str[fd], i + 1);
	ft_strlcpy(&str[fd][0], &str[fd][i + 1], (ft_strlen(str[fd])));
	free(buffer);
	return (ret);
}
