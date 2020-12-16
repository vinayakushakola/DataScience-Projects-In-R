library(tesseract)

# ocr -> optical character recognition
eng <- tesseract("eng")
text <- tesseract::ocr("image.jpg", engine = eng)
cat(text)


#The ocr_data() function returns all words in the image along with a bounding box and confidence rate.

results <- tesseract::ocr_data("C:\\Users\\User27\\Documents\\Vinayak\\fwimagepreprocessing\\hqdefault.jpg", engine = eng)
results

#Use tesseract_info() to list the languages that you currently have installed.
tesseract_info()




library(magick)

input <- image_read("C:\\Users\\User27\\Documents\\Vinayak\\fwimagepreprocessing\\hqdefault.jpg")
input 

text <- input %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) %>%
  image_write(format = 'png', density = '300x300') %>%
  tesseract::ocr() 

cat(text)

image_info(input)

plot(input)

