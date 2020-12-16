
library(magick)
library(tesseract)



#reading image files from both the local computer or a url on the Internet using theimage_read() function
inp_img <- image_read('aeroplane.jpg')

# basic information can be extracted using the image_info() function
image_info(inp_img)

#to view the image, functions like plot()
plot(inp_img)


#Also, the same magick object could be viewed in the default photoviewer application of your system using image_browse()
image_browse(inp_img)

#converting the existing jpeg format image into png
inp_img_png <- image_convert(inp_img, format = 'png')
image_info(inp_img_png)


#write the same to an external file, we can use image_write()
image_write(inp_img, path = 'aero.png', format = 'png')

#We convert the above color image into a grayscale image using image_quantize(colorspace = 'gray')
gray_img <- inp_img %>% 
            image_quantize(colorspace = 'gray')
plot(gray_img)
