

library(pdftools)
pngfile <- pdf_convert('PdfName.pdf', dpi = 600)

text <- tesseract::ocr(pngfile)
cat(text)

# To save png file
write.csv(text)