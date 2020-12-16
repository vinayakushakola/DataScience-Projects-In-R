library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(RCurl)
library(XML)


# Read the text file from internet
filePath <- "filepath\data.txt"

text <- readLines(filePath)

# Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Inspect the content of the document

inspect(docs)



dtm <- TermDocumentMatrix(docs)

dtm 

m <- as.matrix(dtm)
m


v <- sort(rowSums(m),decreasing=TRUE)
v


d <- data.frame(word = names(v),freq=v)
head(d, 10)



#Step 5 : Generate the Word cloud

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))




findFreqTerms(dtm, lowfreq = 4)



findAssocs(dtm, terms = "gandhi", corlimit = 0.3)



#The frequency table of words
head(d, 10)





#Plot word frequencies
#The frequency of the first 10 frequent words are plotted :
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")




