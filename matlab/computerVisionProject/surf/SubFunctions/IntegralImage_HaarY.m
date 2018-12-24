function an=IntegralImage_HaarY(row, column, size, img)

an= II_conv(row, column - size / 2, size / 2, size , img) - II_conv(row - size / 2, column - size / 2, size / 2, size , img);

end