function an=IntegralImage_HaarX(row, column, size, img)

an= II_conv(row - size / 2, column, size, size / 2, img) - II_conv(row - size / 2, column - size / 2, size, size / 2, img);

end