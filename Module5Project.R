library(tidyverse)
library(ggplot2)

#loading data
Connor_active <- read.csv("Connor_active.csv")
Connor_couch <- read.csv("Connor_couch.csv")

Julia_active <- read.csv("Julia_active.csv")
Julia_couch <- read.csv("Julia_couch.csv")

Lauren_active <- read.csv("Lauren_active.csv")
Lauren_couch <- read.csv("Lauren_couch.csv")

Weihang_active <- read.csv("Weihang_active.csv")
Weihang_couch <- read.csv("Weihang_couch.csv")


#combining data into one table
dat.f <- list.files(pattern = "couch|active.csv") 
dat.l <- list()

for(i in dat.f){
  met.dat<- unlist(strsplit(i,"_")) 
  who <- met.dat[1] 
  activity <- gsub(".csv","",met.dat[2]) 
  dat.l[[i]]<- read_csv(i)%>%
    mutate(who=who,activity=activity) 
  
}
dat <- do.call(rbind,dat.l) 
