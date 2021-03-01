library(Hmisc)
library(expss)
library(summarytools)
library(tidyr)
library(dplyr)
library(tableone)
library(knitr)
library(vroom)
library(ggplot2)
library(readr)
library(ggpubr)
#library(plyr)
library(icd)
library(ggsci)




bill191_zz=gzfile('I:/Sarah Warner/Premier Data/8.3.2020/covid19_20191_patbill.txt.gz','rt')  
patbill191 <- read.table(bill191_zz, header=T, sep="|", fill=T, quote="")
inpat_bill191 <- patbill191[patbill191$PAT_KEY %in% inpat191$PAT_KEY,]
patbill191 <- NULL
close.connection(bill191_zz)
inpat_bill191 <- left_join(inpat_bill191, chgmstr)
saveRDS(inpat_bill191, 'I:/Sarah Warner/Premier Data/working files/inpat_bill191.RData')

bill192_zz=gzfile('I:/Sarah Warner/Premier Data/8.3.2020/covid19_20192_patbill.txt.gz','rt')  
patbill192 <- read.table(bill192_zz, header=T, sep="|", fill=T, quote="")
inpat_bill192 <- patbill192[patbill192$PAT_KEY %in% inpat192$PAT_KEY,]
patbill192 <- NULL
close.connection(bill192_zz)
inpat_bill192 <- left_join(inpat_bill192, chgmstr)
saveRDS(inpat_bill192, 'I:/Sarah Warner/Premier Data/working files/inpat_bill192.RData')

bill193_zz=gzfile('I:/Sarah Warner/Premier Data/8.3.2020/covid19_20193_patbill.txt.gz','rt')  
patbill193 <- read.table(bill193_zz, header=T, sep="|", fill=T, quote="")
inpat_bill193 <- patbill193[patbill193$PAT_KEY %in% inpat193$PAT_KEY,]
patbill193 <- NULL
close.connection(bill193_zz)
inpat_bill193 <- left_join(inpat_bill193, chgmstr)
saveRDS(inpat_bill193, 'I:/Sarah Warner/Premier Data/working files/inpat_bill193.RData')

inpat_bill194 <- readRDS("I:/Sarah Warner/Premier Data/working files/inpat_bill194.RData")


inpat_bill201 <- readRDS("I:/Sarah Warner/Premier Data/working files/inpat_bill201.RData")
inpat_bill202 <- readRDS("I:/Sarah Warner/Premier Data/working files/inpat_bill202.RData")
inpat_bill203 <- readRDS("I:/Sarah Warner/Premier Data/working files/inpat_bill203.RData")



