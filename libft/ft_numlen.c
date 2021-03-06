/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_numlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amaquena <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/06 17:03:50 by amaquena          #+#    #+#             */
/*   Updated: 2019/06/07 10:46:25 by amaquena         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_numlen(int num)
{
	int i;

	i = 0;
	if (num <= 0)
	{
		num *= -1;
		i++;
	}
	while (num != 0)
	{
		num /= 10;
		i++;
	}
	return (i);
}
