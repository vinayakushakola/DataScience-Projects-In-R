install.packages("tesseract")

#Pan Card
library(tesseract)
text <- ocr("C:/Users/akshay/Desktop/pancar.jpg")
cat(text)


#Adhar Card
library(tesseract)
text <- ocr("E:/akshay/Data Science project/Text Detection Project/adhar.jpg")
cat(text)



# Low quality:
text1 <- ocr("http://jeroen.github.io/files/dog_lq.png")
cat(text1)


# High quality:
text2 <- ocr("http://jeroen.github.io/files/dog_hq.png")
cat(text2)