

### Hospital mortality variation script ###


inpat20 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20.RData')
inpat20v2 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v2.RData')
inpat20v3 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')
inpat20v4 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v4.RData')



#### data files last updated 11.9.2020 ####



pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20201_pat_noapr.txt.gz','rt')  
pat201 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat201 <- subset(pat201, pat201$I_O_IND=='I')
pat201 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20202_pat_noapr.txt.gz','rt')  
pat202 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat202 <- subset(pat202, pat202$I_O_IND=='I')
pat202 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20203_pat_noapr.txt.gz','rt')  
pat203 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat203 <- subset(pat203, pat203$I_O_IND=='I')
pat203 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20204_pat_noapr.txt.gz','rt')  
pat204 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat204 <- subset(pat204, pat204$I_O_IND=='I')
pat204 <- NULL
close.connection(pat_zz)

inpat20v3 <- rbind(inpat201, inpat202)
inpat20v3 <- rbind(inpat20v3, inpat203)
inpat20v3 <- rbind(inpat20v3, inpat204)

inpat20v3 <- inpat20v3 %>% 
  filter(AGE>17) %>% 
  filter(ADM_MON %in% c('2020101','2020102','2020103',
                        '2020204','2020205','2020206',
                        '2020307','2020308','2020309',
                        '2020410','2020411','2020412'))

providers_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_providers.txt.gz','rt')  
providers <- read.table(providers_zz, header=T, sep="|", fill=T, quote="")

admsrc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_admsrc.txt.gz','rt')  
admsrc <- read.table(admsrc_zz, header=T, sep="|", fill=T, quote="")

admtype_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_admtype.txt.gz','rt')  
admtype <- read.table(admtype_zz, header=T, sep="|", fill=T, quote="")


inpat20v3 <- left_join(inpat20v3, providers)
inpat20v3 <- left_join(inpat20v3, admsrc)
inpat20v3 <- left_join(inpat20v3, admtype)



pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20191_pat_noapr.txt.gz','rt')  
pat191 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat191 <- subset(pat191, pat191$I_O_IND=='I')
pat191 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20192_pat_noapr.txt.gz','rt')  
pat192 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat192 <- subset(pat192, pat192$I_O_IND=='I')
pat192 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20193_pat_noapr.txt.gz','rt')  
pat193 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat193 <- subset(pat193, pat193$I_O_IND=='I')
pat193 <- NULL
close.connection(pat_zz)

pat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20194_pat_noapr.txt.gz','rt')  
pat194 <- read.table(pat_zz, header=T, sep="|", fill=T, quote="")
inpat194 <- subset(pat194, pat194$I_O_IND=='I')
pat194 <- NULL
close.connection(pat_zz)

inpat19v3 <- rbind(inpat191, inpat192)
inpat19v3 <- rbind(inpat19v3, inpat193)
inpat19v3 <- rbind(inpat19v3, inpat194)

inpat19v3 <- inpat19v3 %>% 
  filter(AGE>17) %>% 
  filter(ADM_MON %in% c('2019101','2019102','2019103',
                        '2019204','2019205','2019206',
                        '2019307','2019308','2019309',
                        '2019410','2019411','2019412'))
saveRDS(inpat19v3, 'I:/Sarah Warner/Premier Data/working files/inpat19v3.RData')

rm(inpat191)
rm(inpat192)
rm(inpat193)
rm(inpat194)





diag_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20201_paticd_diag.txt.gz','rt')  
diag201 <- read.table(diag_zz, header=T, sep="|", fill=T, quote="")
close.connection(diag_zz)

diag_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20202_paticd_diag.txt.gz','rt')  
diag202 <- read.table(diag_zz, header=T, sep="|", fill=T, quote="")
close.connection(diag_zz)

diag_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20203_paticd_diag.txt.gz','rt')  
diag203 <- read.table(diag_zz, header=T, sep="|", fill=T, quote="")
close.connection(diag_zz)

diag_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20204_paticd_diag.txt.gz','rt')  
diag204 <- read.table(diag_zz, header=T, sep="|", fill=T, quote="")
close.connection(diag_zz)

inpat20v3_diag <- rbind(diag201, diag202)
inpat20v3_diag <- rbind(inpat20v3_diag, diag203)
inpat20v3_diag <- rbind(inpat20v3_diag, diag204)


proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20201_paticd_proc.txt.gz','rt')  
proc201 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20202_paticd_proc.txt.gz','rt')  
proc202 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20203_paticd_proc.txt.gz','rt')  
proc203 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20204_paticd_proc.txt.gz','rt')  
proc204 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

inpat20v3_proc <- rbind(proc201, proc202)
inpat20v3_proc <- rbind(inpat20v3_proc, proc203)
inpat20v3_proc <- rbind(inpat20v3_proc, proc204)



proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20191_paticd_proc.txt.gz','rt')  
proc191 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20192_paticd_proc.txt.gz','rt')  
proc192 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20193_paticd_proc.txt.gz','rt')  
proc193 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

proc_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20194_paticd_proc.txt.gz','rt')  
proc194 <- read.table(proc_zz, header=T, sep="|", fill=T, quote="")
close.connection(proc_zz)

inpat19v3_proc <- rbind(proc191, proc192)
inpat19v3_proc <- rbind(inpat19v3_proc, proc193)
inpat19v3_proc <- rbind(inpat19v3_proc, proc194)




bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20201_patbill.txt.gz','rt')  
bill201 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
inpat_bill201 <- subset(bill201, bill201$PAT_KEY %in% inpat20v3$PAT_KEY)
rm(bill201)
close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20202_patbill.txt.gz','rt')  
bill202 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
inpat_bill202 <- subset(bill202, bill202$PAT_KEY %in% inpat20v3$PAT_KEY)
rm(bill202)
close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20203_patbill.txt.gz','rt')  
bill203 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
inpat_bill203 <- subset(bill203, bill203$PAT_KEY %in% inpat20v3$PAT_KEY)
rm(bill203)
close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20204_patbill.txt.gz','rt')  
bill204 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
inpat_bill204 <- subset(bill204, bill204$PAT_KEY %in% inpat20v3$PAT_KEY)
rm(bill204)
close.connection(bill_zz)


hospchg_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_hospchg.txt.gz','rt')  
hospchg <- read.table(hospchg_zz, header=T, sep="|", fill=T, quote="")


chgmstr_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_chgmstr.txt.gz','rt')  
chgmstr <- read.table(chgmstr_zz, header=T, sep="|", fill=T, quote="")

icdcode_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_icdcode.txt.gz','rt')  
icdcode <- read.table(icdcode_zz, header=T, sep="|", fill=T, quote="")

cptcode_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_cptcode.txt.gz','rt')  
cptcode <- read.table(cptcode_zz, header=T, sep="|", fill=T, quote="")

disstat_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_disstat.txt.gz','rt')  
disstat <- read.table(disstat_zz, header=T, sep="|", fill=T, quote="")

icdcode_zz=gzfile('I:/Sarah Warner/Premier Data/9.18.20/covid19_icdcode.txt.gz','rt')  
icdcode2 <- read.table(icdcode_zz, header=T, sep="|", fill=T, quote="")



inpat_bill201 <- left_join(inpat_bill201, chgmstr)
inpat_bill202 <- left_join(inpat_bill202, chgmstr)
inpat_bill203 <- left_join(inpat_bill203, chgmstr)
inpat_bill204 <- left_join(inpat_bill204, chgmstr)



bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20191_patbill.txt.gz','rt')  
bill191 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
# inpat_bill191 <- subset(bill191, bill191$PAT_KEY %in% inpat19v3$PAT_KEY)
# rm(bill191)
# close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20192_patbill.txt.gz','rt')  
bill192 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
# inpat_bill192 <- subset(bill192, bill192$PAT_KEY %in% inpat19v3$PAT_KEY)
# rm(bill192)
# close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20193_patbill.txt.gz','rt')  
bill193 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
# inpat_bill193 <- subset(bill193, bill193$PAT_KEY %in% inpat19v3$PAT_KEY)
# rm(bill193)
# close.connection(bill_zz)

bill_zz=gzfile('I:/Sarah Warner/Premier Data/11.9.20/covid19_20194_patbill.txt.gz','rt')  
bill194 <- read.table(bill_zz, header=T, sep="|", fill=T, quote="")
# inpat_bill194 <- subset(bill194, bill194$PAT_KEY %in% inpat19v3$PAT_KEY)
# rm(bill194)
# close.connection(bill_zz)

inpat19v2 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat19v2.RData')


inpat_bill191 <- subset(bill191, bill191$PAT_KEY %in% inpat19v2$PAT_KEY)
inpat_bill192 <- subset(bill192, bill192$PAT_KEY %in% inpat19v2$PAT_KEY)
inpat_bill193 <- subset(bill193, bill193$PAT_KEY %in% inpat19v2$PAT_KEY)
inpat_bill194 <- subset(bill194, bill194$PAT_KEY %in% inpat19v2$PAT_KEY)


inpat_bill191 <- left_join(inpat_bill191, chgmstr[,c(1,2)])
inpat_bill192 <- left_join(inpat_bill192, chgmstr[,c(1,2)])
inpat_bill193 <- left_join(inpat_bill193, chgmstr[,c(1,2)])
inpat_bill194 <- left_join(bill194, chgmstr[,c(1,2)])

saveRDS(inpat19v2, 'I:/Sarah Warner/Premier Data/working files/inpat19v2.RData')


saveRDS(inpat_bill201, 'I:/Sarah Warner/Premier Data/working files/inpat_bill201.RData')
saveRDS(inpat_bill202, 'I:/Sarah Warner/Premier Data/working files/inpat_bill202.RData')
saveRDS(inpat_bill203, 'I:/Sarah Warner/Premier Data/working files/inpat_bill203.RData')
saveRDS(inpat_bill204, 'I:/Sarah Warner/Premier Data/working files/inpat_bill204.RData')

saveRDS(inpat20v3, 'I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')
saveRDS(inpat20v3_diag, 'I:/Sarah Warner/Premier Data/working files/inpat20v3_diag.RData')
saveRDS(inpat20v3_diag_poa, 'I:/Sarah Warner/Premier Data/working files/inpat20v3_diag_poa.RData')
saveRDS(inpat20v3_proc, 'I:/Sarah Warner/Premier Data/working files/inpat20v3_proc.RData')

inpat20v3 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')
inpat20v3_diag <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v3_diag.RData')
inpat20v3_proc <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v3_proc.RData')
inpat19 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat19.RData')


inpat_bill201 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat_bill201.RData')
inpat_bill202 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat_bill202.RData')
inpat_bill203 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat_bill203.RData')
inpat_bill204 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat_bill204.RData')



#### 12.1.20 ####

covid_resp_code_list <- c('J12.89','J12.81','J12.9','J18.0','J18.1','J18.2','J18.8','J18.9','J20.8',
                          'J20.9','J40','J22','J98.8','J98.9','J98.0','J98.01','J98.09','J98.1','J98.11',
                          'J98.19','J80','J96','J96.0','J96.00','J96.01','J96.02','J96.2','J96.20','J96.21',
                          'J96.22','J96.9','J96.90','J96.91','J96.92')

inpat20v3_diag <- inpat20v3_diag %>% 
  mutate(covid_resp_diag=case_when(ICD_CODE %in% covid_resp_code_list~1, TRUE~0),
         covid_legacy_icd=case_when(ICD_CODE=='B97.29'~1, TRUE~0),
         covid_icd10=case_when(ICD_CODE=='U07.1'~1, TRUE~0))

inpat20v3_diag_poa <- inpat20v3_diag %>% 
  filter(ICD_POA=='Y') %>% 
  mutate(covid_resp_diag=case_when(ICD_CODE %in% covid_resp_code_list~1, TRUE~0),
         covid_legacy_icd=case_when(ICD_CODE=='B97.29'~1, TRUE~0),
         covid_icd10=case_when(ICD_CODE=='U07.1'~1, TRUE~0))

# this is the "JAMA" definition created by Ning and Jake
inpat20v3 <- inpat20v3 %>% 
  mutate(covid=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$covid_resp_diag==1 & 
                                                       inpat20v3_diag$covid_legacy_icd==1,]$PAT_KEY 
                         & ADM_MON=='2020103' ~1,
                         PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$covid_icd10==1,]$PAT_KEY~1,
                         TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(covid_poa=case_when(PAT_KEY %in% inpat20v3_diag_poa[inpat20v3_diag_poa$covid_resp_diag==1 & 
                                                               inpat20v3_diag_poa$covid_legacy_icd==1 ,]$PAT_KEY
                             & ADM_MON=='2020103'~1,
                         PAT_KEY %in% inpat20v3_diag_poa[inpat20v3_diag_poa$covid_icd10==1,]$PAT_KEY~1,
                         TRUE~0))



cont_hosp_2020 <- inpat20v3 %>% 
  group_by(ADM_MON, PROV_ID) %>% 
  summarise(n_enc=n_distinct(PAT_KEY)) %>% 
  pivot_wider(id_cols = PROV_ID,
              names_from = ADM_MON, 
              values_from = n_enc) %>% 
  rename('Jan'=`2020101`,
         'Feb'=`2020102`,
         'Mar'=`2020103`,
         'Apr'=`2020204`,
         'May'=`2020205`,
         'Jun'=`2020206`,
         'Jul'=`2020307`,
         'Aug'=`2020308`,
         'Sep'=`2020309`,
         'Oct'=`2020410`) %>% 
  filter(Jan>0 & Feb>0 & Mar>0 & Apr>0 & May>0 & Jun>0 & Jul>0 & Aug>0)



inpat20v3 <- inpat20v3 %>% 
  mutate(cont_jan_aug=case_when(PROV_ID %in% cont_hosp_2020$PROV_ID~1, TRUE~0))

describe(inpat20v3[inpat20v3$cont_jan_aug==1 & !inpat20v3$ADM_MON %in% c('2020309','2020410'),]$PROV_ID)  
describe(inpat20v3[!inpat20v3$ADM_MON %in% c('2020309','2020410'),]$PROV_ID)  
describe(inpat20v3[inpat20v3$cont_jan_aug==1 & !inpat20v3$ADM_MON %in% c('2020309','2020410'),]$PAT_KEY)  
describe(inpat20v3[!inpat20v3$ADM_MON %in% c('2020309','2020410'),]$PAT_KEY)  
  
  
by_month <- inpat20v3 %>%
  filter(cont_jan_aug==1) %>% 
  filter(!ADM_MON %in% c('2020309','2020410')) %>% 
  group_by(ADM_MON) %>% 
  summarise(n_prov=n_distinct(PROV_ID),
            n_enc=n_distinct(PAT_KEY),
            n_covid=sum(covid),
            covid_perc=(n_covid/n_enc)*100,
            n_covid_poa=sum(covid_poa),
            covid_poa_perc=(n_covid_poa/n_enc)*100) 

  
  
  
  
  
  
#### how many hospitals use remdesivir ####
chgmstr$remdesivir <- ifelse(grepl("REMDESIVIR", chgmstr$STD_CHG_DESC), 1,0)
cro(droplevels(chgmstr[chgmstr$remdesivir==1,]$STD_CHG_DESC))
cro(chgmstr[chgmstr$remdesivir==1,]$STD_CHG_CODE)

bill1_remdes <- subset(inpat_bill201, inpat_bill201$STD_CHG_CODE=='250250131240000')
bill2_remdes <- subset(inpat_bill202, inpat_bill202$STD_CHG_CODE=='250250131240000')
bill3_remdes <- subset(inpat_bill203, inpat_bill203$STD_CHG_CODE=='250250131240000')
bill4_remdes <- subset(inpat_bill204, inpat_bill204$STD_CHG_CODE=='250250131240000')


inpat20v3_proc$remdesivir <- ifelse(inpat20v3_proc$ICD_CODE %in% c('XW033E5','XW043E5'), 1, 0)

# inpat20v3 <- inpat20v3 %>% 
#   mutate(remdesivir_adm=case_when(PAT_KEY %in% bill1_remdes$PAT_KEY~'bill',
#                               PAT_KEY %in% bill2_remdes$PAT_KEY~'bill',
#                               PAT_KEY %in% bill3_remdes$PAT_KEY~'bill',
#                               PAT_KEY %in% bill4_remdes$PAT_KEY~'bill',
#                               PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$remdesivir==1,]$PAT_KEY~'proc',
#                               PAT_KEY %in% bill1_remdes$PAT_KEY & 
#                                 PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$remdesivir==1,]$PAT_KEY~'both',
#                               PAT_KEY %in% bill2_remdes$PAT_KEY & 
#                                 PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$remdesivir==1,]$PAT_KEY~'both',
#                               PAT_KEY %in% bill3_remdes$PAT_KEY & 
#                                 PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$remdesivir==1,]$PAT_KEY~'both',
#                               PAT_KEY %in% bill4_remdes$PAT_KEY & 
#                                 PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$remdesivir==1,]$PAT_KEY~'both',
#                               TRUE~'none'))
# inpat20v3_remdesivir <- subset(inpat20v3, inpat20v3$remdesivir_adm!='none')
# this doesn't properly assign those with both types of coding

inpat20v3 <- inpat20v3 %>% 
  mutate(remdesivir_hosp=case_when(PROV_ID %in% inpat20v3_remdesivir$PROV_ID~1, TRUE~0))

cro(inpat20v3[inpat20v3$remdesivir_adm!='none' & inpat20v3$covid==1,]$ADM_MON, 
    inpat20v3[inpat20v3$remdesivir_adm!='none' & inpat20v3$covid==1,]$remdesivir_adm)

describe(inpat20v3[inpat20v3$remdesivir_hosp==1 & inpat20v3$covid==1,]$PROV_ID)

remdesivir_hosp_month <- inpat20v3 %>% 
  filter(remdesivir_adm!='none'& inpat20v3$covid==1) %>% 
  group_by(ADM_MON) %>% 
  summarise(n_hosp=n_distinct(PROV_ID))

remdesivir_adm <- inpat20v3 %>% 
  filter(remdesivir_adm!='none') %>% 
  group_by(PROV_ID) %>% 
  summarise(n_adm=n_distinct(PAT_KEY))

remdesivir_adm_month <- inpat20v3 %>% 
  filter(remdesivir_adm!='none'& inpat20v3$covid==1) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(n_adm=n_distinct(MEDREC_KEY))

ggplot(data=remdesivir_adm_month)+
  geom_point(aes(x=as.factor(PROV_ID),y=n_adm, color=as.factor(PROV_ID)))+
  facet_grid(.~ADM_MON, switch='x')+
  scale_x_discrete(labels='')+
  xlab("Hospitals")+
  ylab("Number of Remdesivir Encounters")+
  theme(legend.position = 'none')


remdes <- subset(chgmstr, grepl("REMDESIVIR", chgmstr$STD_CHG_DESC))
remdes_icd <- subset(icdcode, grepl("REMDESIVIR", icdcode$ICD_DESC))
remdes_cpt <- subset(cptcode, grepl("REMDESIVIR", cptcode$CPT_DESC))

inpat20v3 <- inpat20v3 %>% 
  mutate(remdes_bill=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_CODE==250250131240000,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_CODE==250250131240000,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_CODE==250250131240000,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill204[inpat_bill204$STD_CHG_CODE==250250131240000,]$PAT_KEY~1,
                               TRUE~0),
         remdes_icd=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE %in% c('XW033E5','XW043E5'),]$PAT_KEY~1,
                              TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(remdes_any=case_when(remdes_bill==1~1,
                              remdes_icd==1~1,
                              TRUE~0),
         remdes_bill_icd=case_when(remdes_bill==1 & remdes_icd==1~1,
                                   TRUE~0),
         remdes_adm_type=case_when(remdes_bill_icd==1~'both',
                                   remdes_bill_icd==0 & remdes_bill==1~'bill',
                                   remdes_bill_icd==0 & remdes_icd==1~'icd',
                                   TRUE~'none'
                                   ))
remdes_hosp_sub <- subset(inpat20v3, inpat20v3$remdesivir_hosp==1)
#529 hospitals
remdes_adm_type_hosp <- remdes_hosp_sub %>% 
  group_by(PROV_ID, remdes_adm_type) %>% 
  summarise(n=n_distinct(PAT_KEY)) %>% 
  pivot_wider(id_cols=PROV_ID,
              names_from=remdes_adm_type,
              values_from=n)%>% 
  mutate(total_rem=bill+both+icd) %>% 
  arrange(desc(total_rem)) %>% 
  tibble::rownames_to_column(var='rowname')
  
  
remdes_adm_type_hosp2 <- remdes_hosp_sub %>% 
  group_by(PROV_ID, remdes_adm_type) %>% 
  summarise(n=n_distinct(PAT_KEY))
remdes_adm_type_hosp2 <- left_join(remdes_adm_type_hosp2, remdes_adm_type_hosp[,c(1,2)], by='PROV_ID')
remdes_adm_type_hosp2 <- remdes_adm_type_hosp2 %>% 
  arrange(desc(rowname))


ggplot(data=remdes_adm_type_hosp2[remdes_adm_type_hosp2$remdes_adm_type!='none',])+
  geom_bar(aes(x=as.factor(rowname), y=as.numeric(n), fill=remdes_adm_type), stat='identity')


hosp_demo_table_data <- inpat20v3[inpat20v3$ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308'),] %>% 
  group_by(PROV_ID,remdesivir_hosp) %>% 
  summarise(n_enc=n_distinct(PAT_KEY))
hosp_demo_table_data <- left_join(hosp_demo_table_data, providers)
hosp_demo_table <- CreateTableOne(data=hosp_demo_table_data,
                                  vars=c("n_enc","URBAN_RURAL","TEACHING","BEDS_GRP","PROV_REGION","PROV_DIVISION"),
                                  factorVars = c("URBAN_RURAL","TEACHING","BEDS_GRP","PROV_REGION","PROV_DIVISION"),
                                  strata="remdesivir_hosp")
hosp_demo_table_print <- print(hosp_demo_table, nonnormal = "n_enc")
write.csv(hosp_demo_table_print, 'I:/Sarah Warner/Premier Data/CDC Collab/remdesivir hospital description.csv')

demo_table1 <- CreateTableOne(data=remdes_hosp_sub[remdes_hosp_sub$ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308'),],
                              vars=c('GENDER','race4','LOS','covid','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",'elixhauser_score',
                                     'anyvent','death'),
                              factorVars = c('GENDER','race4','covid','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",
                                     'anyvent','death'),
                              strata='remdes_adm_type')
demo_table1_print <- print(demo_table1, nonnormal=c('LOS','elixhauser_score'))
write.csv(demo_table1_print, 'I:/Sarah Warner/Premier Data/CDC Collab/remdesivir demo table code type.csv')

demo_table2 <- CreateTableOne(data=remdes_hosp_sub[remdes_hosp_sub$ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308'),],
                              vars=c('GENDER','race4','LOS','covid','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",'elixhauser_score',
                                     'anyvent','death'),
                              factorVars = c('GENDER','race4','covid','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",
                                     'anyvent','death'),
                              strata='remdes_any')
demo_table2_print <- print(demo_table2, nonnormal=c('LOS','elixhauser_score'))
write.csv(demo_table2_print, 'I:/Sarah Warner/Premier Data/CDC Collab/remdesivir demo table.csv')



demo_table3 <- CreateTableOne(data=remdes_hosp_sub[remdes_hosp_sub$ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') &
                                                     remdes_hosp_sub$covid==1,],
                              vars=c('GENDER','race4','LOS','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",'elixhauser_score',
                                     'anyvent','death'),
                              factorVars = c('GENDER','race4','steroid_adm','hydroxychl_azithro_adm','vaso_02','icu','age_cat5',
                                     'adm_src2','adm_type2','payor_new',"acute_resp_fail_poa","renal_fail_poa","hepatic_fail_poa",
                                     "hematologic_fail_poa","metabolic_fail_poa","neurologic_fail_poa","dnr_poa","icuvent_day02",
                                     "icu_or_nippv_day02","cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa","obese_overweight_poa",
                                     "pregnant_poa","sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                     "thalassemia_poa","cirrhosis_poa","heart_fail_poa","cerebrovascular_poa",
                                     'anyvent','death'),
                              strata='remdes_any')
demo_table3_print <- print(demo_table3, nonnormal=c('LOS','elixhauser_score'))
write.csv(demo_table3_print, 'I:/Sarah Warner/Premier Data/CDC Collab/remdesivir covid demo table.csv')


remdes_covid_hosp <- inpat20v3 %>%
  filter(remdesivir_hosp==1 & 
           ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308')) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_enc=n_distinct(PAT_KEY),
            n_covid=sum(covid),
            n_remdes=sum(remdes_any),
            perc_remdes=n_remdes/n_enc) %>% 
  arrange(desc(n_covid)) %>% 
  tibble::rownames_to_column(var='rownames')

ggplot(data=remdes_covid_hosp[remdes_covid_hosp$n_remdes>0,])+
  geom_point(aes(x=as.numeric(perc_remdes), y=as.integer(n_covid)), stat='identity')+
  scale_x_continuous(name='Percent of Encounters Receiving Remdesivir among All Encounters', labels=scales::percent)+
  scale_y_continuous(name="Number of COVID-19 Encounters", limits=c(0,2500))+
  ggtitle('Distribution of Remdesivir Administration and COVID-19 Encounters\namong 494 Remdesivir Hospitals, March - August 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
describe(remdes_covid_hosp[remdes_covid_hosp$n_remdes>0 ,]$PROV_ID)
#494 have 1+ remdesivir administration to COVID patient


remdes_covid_hosp2 <- inpat20v3 %>%
  filter(remdesivir_hosp==1 & 
           ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') &
           covid==1) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_enc=n_distinct(PAT_KEY),
            n_covid=sum(covid),
            n_remdes=sum(remdes_any),
            perc_remdes=n_remdes/n_enc) %>% 
  arrange(desc(n_covid)) %>% 
  tibble::rownames_to_column(var='rownames')

ggplot(data=remdes_covid_hosp2[remdes_covid_hosp2$n_remdes>0,], aes(y=as.numeric(perc_remdes), x=as.integer(n_covid)))+
  geom_point(stat='identity')+
  geom_smooth(method='lm', formula=y~x)+
  stat_regline_equation(label.y = .9, label.x=1000, aes(label = ..eq.label..), formula=y~x) +
  stat_regline_equation(label.y = .85, label.x=1000, aes(label = ..rr.label..), formula=y~x) +
  scale_y_continuous(name='Percent of Encounters Receiving Remdesivir among COVID-19 Encounters', labels=scales::percent)+
  scale_x_continuous(name="Number of COVID-19 Encounters", limits=c(0,2500))+
  ggtitle('Distribution of Remdesivir Administration and COVID-19 Encounters\namong 492 Remdesivir Hospitals, March - August 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
describe(remdes_covid_hosp2[remdes_covid_hosp2$n_remdes>0 ,]$PROV_ID)
                   

ggplot(data=remdes_covid_hosp2[remdes_covid_hosp2$n_remdes>0 & remdes_covid_hosp2$n_covid>=15,], 
       aes(y=as.numeric(perc_remdes), x=as.integer(n_covid)))+
  geom_point(stat='identity')+
  geom_smooth(method='lm', formula=y~x)+
  stat_regline_equation(label.y = .75, label.x=1000, aes(label = ..eq.label..), formula=y~x) +
  stat_regline_equation(label.y = .7, label.x=1000, aes(label = ..rr.label..), formula=y~x) +
  scale_y_continuous(name='Percent of Encounters Receiving Remdesivir among COVID-19 Encounters', labels=scales::percent)+
  scale_x_continuous(name="Number of COVID-19 Encounters", limits=c(0,2500))+
  ggtitle('Distribution of Remdesivir Administration and COVID-19 Encounters\namong 474 Remdesivir Hospitals with 15+ COVID-19 Encounters,\nMarch - August 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
describe(remdes_covid_hosp2[remdes_covid_hosp2$n_remdes>0 & remdes_covid_hosp2$n_covid>=15,]$PROV_ID)


remdes_covid_hosp3 <- inpat20v3 %>%
  filter(remdesivir_hosp==1 & 
           ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') &
           covid==1) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(n_enc=n_distinct(PAT_KEY),
            n_covid=sum(covid),
            n_remdes=sum(remdes_any),
            perc_remdes=n_remdes/n_enc) %>% 
  filter(n_remdes>=15) %>% 
  arrange(perc_remdes) %>% 
  tibble::rownames_to_column(var='rownames')

month_labels <- c('May','June','Jul','AUg')

ggplot(data=remdes_covid_hosp3, aes(x=as.integer(rownames), y=as.numeric(perc_remdes)))+
  geom_point(stat='identity')+
  facet_grid(rows=vars(ADM_MON))+
  geom_smooth(method='lm', formula=y~x)+
  stat_regline_equation(label.y = .75, label.x=100, aes(label = ..eq.label..), formula=y~x) +
  stat_regline_equation(label.y = .7, label.x=100, aes(label = ..rr.label..), formula=y~x) +
  scale_y_continuous(name='Percent of Encounters Receiving Remdesivir among COVID-19 Encounters', 
                     labels=scales::percent)+
  scale_x_continuous(name="Remdesivir Hospitals Ranked by Remdesivir Use")+
  ggtitle('Remdesivir use among COVID-19 Diagnosed Encounters,\nHospitals with 15+ COVID Encounters, March-August 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/CDC Collab/remdesivir prev.pdf')


  

remdes_day1 <- inpat_bill201 %>% 
  filter(STD_CHG_CODE==250250131240000) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(bill_day=SERV_DAY)
remdes_day2 <- inpat_bill202 %>% 
  filter(STD_CHG_CODE==250250131240000) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(bill_day=SERV_DAY)
remdes_day3 <- inpat_bill203 %>% 
  filter(STD_CHG_CODE==250250131240000) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(bill_day=SERV_DAY)
remdes_day4 <- inpat_bill204 %>% 
  filter(STD_CHG_CODE==250250131240000) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(bill_day=SERV_DAY)


remdes_day <- rbind(remdes_day1, remdes_day2)
remdes_day <- rbind(remdes_day, remdes_day3)
remdes_day <- rbind(remdes_day, remdes_day4)
remdes_day <- remdes_day %>% 
  rename(remdes_day=bill_day)

remdes_day_proc <- inpat20v3_proc %>% 
  filter(remdesivir==1) %>% 
  select(PAT_KEY, PROC_DAY) %>% 
  rename(remdes_day=PROC_DAY)

remdes_day_all <- rbind(remdes_day_proc, remdes_day)

remdes_day_count <- remdes_day %>% 
  group_by(PAT_KEY) %>% 
  summarise(n_days=n_distinct(remdes_day))

describe(remdes_day_count$n_days)
# median = 5, IQR = 4-5, mean = 4.5

covid_remdes_day_count <- subset(remdes_day_count, remdes_day_count$PAT_KEY %in% inpat20v3[inpat20v3$covid==1,]$PAT_KEY)
describe(covid_remdes_day_count$n_days)
# median = 5, IQR = 4-5, mean = 4.5


ggplot(data=covid_remdes_day_count)+
  geom_histogram(aes(x=n_days), bins=15)+
  xlab("Days of Remdesivir Administration")+
  ylab("Number of COVID-19 Encounters")+
  annotate('text', x=10, y=12000, label=expression(paste('Median=5\nIQR=4-5\nMean=4.5\n95.8% <=5 Days')))+
  theme(panel.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/CDC Collab/remdesivir adm days.pdf')
  
  
cro(covid_remdes_day_count$n_days)


remdes_day_first <- remdes_day_all %>% 
  group_by(PAT_KEY) %>% 
  filter(remdes_day==min(remdes_day))
describe(remdes_day_first$remdes_day)




























#### azithromycin, hydroxchloroquine, steroids, vasopressors ####


dnu_steroids <- c('BETAMETH NA PHOS, CELESTONE VL 4(3)MG/ML 1ML',
'BETAMETH NA PHOS/ACET PARENTERAL MISC',
'BETAMETH NA PHOS/ACET, CELESTONE SL VL 6MG/ML 1ML',
'BETAMETH NA PHOS/ACET, CELESTONE SL VL 6MG/ML 5ML',
'BETAMETH, CELESTONE SYRP 0.6MG/5ML 5ML',
'BUDESONIDE, ENTOCORT EC CAP 3MG',
'DEXAMETH, DECADRON INT SOL 0.5MG/0.5ML 30ML',
'DEXAMETH, DECADRON TAB 0.75MG',
'DEXAMETH/LIDO, DECADRON W/XYLO VL 4/10MG 5ML',
'FLUDROCORTISONE, FLORINEF TAB 0.1MG',
'METHYLPRED ACE, DEPOMEDROL VL 20MG/ML 1ML',
'METHYLPRED ACE, DEPOMEDROL VL 40MG/ML 1ML',
'METHYLPRED ACE, DEPOMEDROL VL 80MG/ML 1ML',
'TRIAMCINOLONE ACE PARENTERAL MISC',
'TRIAMCINOLONE ACE, KENALOG-10 INJ 10MG',
'TRIAMCINOLONE ACE, KENALOG-40 VL 40MG/ML 1ML')

inpat20v3 <- inpat20v3 %>% 
  mutate(steroid_adm=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill201$PROD_NAME_METH_DESC) &
                                                            !inpat_bill201$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill202[inpat_bill202$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill202$PROD_NAME_METH_DESC) &
                                                            !inpat_bill202$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill203[inpat_bill203$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill203$PROD_NAME_METH_DESC) &
                                                            !inpat_bill203$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill204[inpat_bill204$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill204$PROD_NAME_METH_DESC) &
                                                            !inpat_bill204$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               TRUE~0)) 

inpat20v3 <- inpat20v3 %>% 
  mutate(steroid_adm2=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill201$PROD_NAME_METH_DESC) &
                                                            !inpat_bill201$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill202[inpat_bill202$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill202$PROD_NAME_METH_DESC) &
                                                            !inpat_bill202$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill203[inpat_bill203$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill203$PROD_NAME_METH_DESC) &
                                                            !inpat_bill203$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill204[inpat_bill204$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill204$PROD_NAME_METH_DESC) &
                                                            !inpat_bill204$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                               TRUE~0)) 


inpat_bill201 <- inpat_bill201 %>% 
  mutate(steroid=case_when(PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                             grepl("ORAL|PARENTERAL",PROD_NAME_METH_DESC) &
                             !STD_CHG_DESC %in% dnu_steroids~1, TRUE~0))
inpat_bill202 <- inpat_bill202 %>% 
  mutate(steroid=case_when(PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                             grepl("ORAL|PARENTERAL",PROD_NAME_METH_DESC) &
                             !STD_CHG_DESC %in% dnu_steroids~1, TRUE~0))
inpat_bill203 <- inpat_bill203 %>% 
  mutate(steroid=case_when(PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                             grepl("ORAL|PARENTERAL",PROD_NAME_METH_DESC) &
                             !STD_CHG_DESC %in% dnu_steroids~1, TRUE~0))
inpat_bill204 <- inpat_bill204 %>% 
  mutate(steroid=case_when(PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                             grepl("ORAL|PARENTERAL",PROD_NAME_METH_DESC) &
                             !STD_CHG_DESC %in% dnu_steroids~1, TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(steroid_adm2=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$steroid==1,]$PAT_KEY~1,
                                PAT_KEY %in% inpat_bill202[inpat_bill202$steroid==1,]$PAT_KEY~1,
                                PAT_KEY %in% inpat_bill203[inpat_bill203$steroid==1,]$PAT_KEY~1,
                                PAT_KEY %in% inpat_bill204[inpat_bill204$steroid==1,]$PAT_KEY~1,
                                TRUE~0))








inpat20v3 <- inpat20v3 %>% 
  mutate(steroid_adm_new=case_when(PAT_KEY %in% inpat_bill203[inpat_bill203$PROD_CLASS_DESC=='HORMONES, CORTICOIDS, PLAIN' &
                                                            grepl('ORAL|PARENTERAL',inpat_bill203$PROD_NAME_METH_DESC) &
                                                            !inpat_bill203$STD_CHG_DESC %in% dnu_steroids,]$PAT_KEY~1,
                                   TRUE~0)) 
inpat20v3 <- inpat20v3 %>% 
  mutate(steroid_adm2=case_when(steroid_adm==1~1, steroid_adm_new==1~1, TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(azithro_adm=case_when(PAT_KEY %in% inpat_bill201[grepl('AZITHROMYCIN',inpat_bill201$STD_CHG_DESC),]$PAT_KEY ~1,
                               PAT_KEY %in% inpat_bill202[grepl('AZITHROMYCIN',inpat_bill202$STD_CHG_DESC),]$PAT_KEY ~1,
                               PAT_KEY %in% inpat_bill203[grepl('AZITHROMYCIN',inpat_bill203$STD_CHG_DESC),]$PAT_KEY ~1,
                               PAT_KEY %in% inpat_bill204[grepl('AZITHROMYCIN',inpat_bill204$STD_CHG_DESC),]$PAT_KEY ~1,
                               TRUE~0),
         hydroxychl_adm=case_when(PAT_KEY %in% inpat_bill201[grepl('HYDROXYCHLOR',inpat_bill201$STD_CHG_DESC),]$PAT_KEY~1,
                                  PAT_KEY %in% inpat_bill202[grepl('HYDROXYCHLOR',inpat_bill202$STD_CHG_DESC),]$PAT_KEY~1,
                                  PAT_KEY %in% inpat_bill203[grepl('HYDROXYCHLOR',inpat_bill203$STD_CHG_DESC),]$PAT_KEY~1,
                                  PAT_KEY %in% inpat_bill204[grepl('HYDROXYCHLOR',inpat_bill204$STD_CHG_DESC),]$PAT_KEY~1,
                                  TRUE~0),
         hydroxychl_azithro_adm=case_when(azithro_adm==1 & hydroxychl_adm==1~1, TRUE~0))


                                          

vasopressor_list <- c('DOPAMINE','EPINEPHRINE','NOREPINEPHRINE','PHENYLEPHRINE','VASOPRESSIN',
                      'GIAPREZA','ANGIOTENSIN II')

inpat20v3 <- inpat20v3 %>% 
  mutate(vaso_02=case_when(PAT_KEY %in% inpat_bill201[grepl('DOPAMINE|EPINEPHRINE|NOREPINEPHRINE|PHENYLEPHRINE|
                                                            VASOPRESSIN|GIAPREZA|ANGIOTENSIN II', inpat_bill201$STD_CHG_DESC) &
                                                        inpat_bill201$SERV_DAY %in% c(0:2),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill202[grepl('DOPAMINE|EPINEPHRINE|NOREPINEPHRINE|PHENYLEPHRINE|
                                                            VASOPRESSIN|GIAPREZA|ANGIOTENSIN II', inpat_bill202$STD_CHG_DESC) &
                                                        inpat_bill202$SERV_DAY %in% c(0:2),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill203[grepl('DOPAMINE|EPINEPHRINE|NOREPINEPHRINE|PHENYLEPHRINE|
                                                            VASOPRESSIN|GIAPREZA|ANGIOTENSIN II', inpat_bill203$STD_CHG_DESC) &
                                                        inpat_bill203$SERV_DAY %in% c(0:2),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill204[grepl('DOPAMINE|EPINEPHRINE|NOREPINEPHRINE|PHENYLEPHRINE|
                                                            VASOPRESSIN|GIAPREZA|ANGIOTENSIN II', inpat_bill204$STD_CHG_DESC) &
                                                        inpat_bill204$SERV_DAY %in% c(0:2),]$PAT_KEY~1,
                           TRUE~0))


#### icu ####

icu_reg_list <- c(
'ELIMINATOR ROSE ICU',
'OBSERVATION ICU FLAT RATE', 
'OBSERVATION ICU PER HR', 
'OBSERVATION ICU/CCU ADDL HR', 
'OBSERVATION ICU/CCU PER HR', 
'OBSERVATION PED ICU PER HR', 
'PACU(RECOVERY) ICU PER HR', 
'R&B BURN ICU', 
'R&B CICU/CCU (CORONARY CARE)', 
'R&B CICU/CCU (CORONARY CARE)COVID19', 
'R&B CICU/CCU ISOLATION (CORONARY CARE)',
'R&B CVICU', 
'R&B CVICU ISOLATION', 
'R&B ICU', 
'R&B ICU COVID19', 
'R&B ICU ISOLATION', 
'R&B MICU (MEDICAL ICU)', 
'R&B MICU (MEDICAL ICU) ISOLATION', 
'R&B NURSERY INTENSIVE LEVEL III (NICU)', 
'R&B PEDIATRIC ICU', 
'R&B PSYCH ICU PEDIATRIC', 
'R&B SICU  (SURGICAL ICU) ISOLATION', 
'R&B SICU (SURGICAL ICU)', 
'R&B TRANSPLANT ICU', 
'R&B TRAUMA ICU')

inpat20v3 <- inpat20v3 %>% 
  mutate(icu=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% icu_reg_list,]$PAT_KEY~1,
                       PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% icu_reg_list,]$PAT_KEY~1,
                       PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% icu_reg_list,]$PAT_KEY~1,
                       PAT_KEY %in% inpat_bill204[inpat_bill204$STD_CHG_DESC %in% icu_reg_list,]$PAT_KEY~1,
                       TRUE~0))


icu_day1 <- inpat_bill201 %>% 
  filter(STD_CHG_DESC %in% icu_reg_list) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(icu_day=SERV_DAY)
icu_day2 <- inpat_bill202 %>% 
  filter(STD_CHG_DESC %in% icu_reg_list) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(icu_day=SERV_DAY)
icu_day3 <- inpat_bill203 %>% 
  filter(STD_CHG_DESC %in% icu_reg_list) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(icu_day=SERV_DAY)
icu_day4 <- inpat_bill204 %>% 
  filter(STD_CHG_DESC %in% icu_reg_list) %>% 
  select(PAT_KEY, SERV_DAY) %>% 
  rename(icu_day=SERV_DAY)
icu_day20v3 <- rbind(icu_day1, icu_day2)
icu_day20v3 <- rbind(icu_day20v3, icu_day3)
icu_day20v3 <- rbind(icu_day20v3, icu_day4)
saveRDS(icu_day20v3, 'I:/Sarah Warner/Premier Data/working files/icu_day20v3.RData')

icu_day20v3 <- readRDS('I:/Sarah Warner/Premier Data/working files/icu_day20v3.RData')


icu_day20v3 <- icu_day20v3 %>% 
  rename(day=icu_day) %>% 
  mutate(icu=1)
  
  
#### ICU and Vent by day codes ####

vent_day20v3 <- inpat20v3_proc %>% 
  filter(ICD_CODE %in% c('5A1935Z','5A1945Z','5A1955Z')) %>% 
  select(PAT_KEY, PROC_DAY) %>% 
  rename(day=PROC_DAY) %>% 
  mutate(vent=1)

icu_vent <- full_join(icu_data, vent_day20v3, by=c('PAT_KEY'='PAT_KEY','icu_day'='day'))
icu_vent <- icu_vent %>% 
  filter(vent==1)
saveRDS(icu_vent, 'I:/Sarah Warner/Premier Data/working files/icu_vent 20v3.RData')
icu_vent <- readRDS('I:/Sarah Warner/Premier Data/working files/icu_vent 20v3.RData')


icu_day20v3_m1p2 <- subset(icu_day20v3, icu_day20v3$day %in% c(-1:2))
vent_day20v3_m1p2 <- subset(vent_day20v3, vent_day20v3$day %in% c(-1:2))

icu_vent_day20v3_m1p2 <- full_join(icu_day20v3_m1p2, vent_day20v3_m1p2)

icuventday_m1p1 <- icu_vent_day20v3_m1p2 %>% 
  filter(icu==1 & vent==1) %>% 
  filter(day %in% c(-1:1))

icuventday_0p2 <- icu_vent_day20v3_m1p2 %>% 
  filter(icu==1 & vent==1) %>% 
  filter(day %in% c(0:2))

icuday_0p2 <- icu_day20v3_m1p2 %>% 
  filter(day %in% c(0:2))


#### patient level, aofs, elixhauser, cdc comorbidities ####

# elixhauser
inpat_diag_distinct=select(inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y',], PAT_KEY, ICD_CODE) %>% distinct() %>% group_by(PAT_KEY)
cohort_elix=as.data.frame(icd10_comorbid_quan_elix(inpat_diag_distinct))
cols=sapply(cohort_elix, is.logical)
cohort_elix[,cols]=lapply(cohort_elix[,cols],as.numeric)
cohort_elix$score=rowSums(cohort_elix)
cohort_elix$PAT_KEY=row.names(cohort_elix)
row.names(cohort_elix)=NULL
cohort_elix$PAT_KEY=as.numeric(cohort_elix$PAT_KEY)
cohort_elix_short <- cohort_elix[,c(32,31)]




inpat20v3 <- inpat20v3 %>% 
  mutate(age_cat4=case_when(AGE<25~'<25',
                            AGE>=25 & AGE<35~'25-34',
                            AGE>=35 & AGE<45~'35-44',
                            AGE>=45 & AGE<55~'45-54',
                            AGE>=55 & AGE<65~'55-64',
                            AGE>=65 & AGE<75~'65-74',
                            AGE>=75~'75+',
                            TRUE~'unk'),
         race4=case_when(RACE=="B" & HISPANIC_IND!="Y"~"Non-Hispanic Black",
                         RACE=="W" & HISPANIC_IND!="Y"~"Non-Hispanic White",
                         RACE=="A" & HISPANIC_IND!="Y"~"Non-Hispanic Asian",                           
                         RACE=="O" & HISPANIC_IND!="Y"~"Non-Hispanic Other Race",
                         RACE=="U" & HISPANIC_IND !="Y"~"Unknown Race",
                         HISPANIC_IND=="Y"~"Hispanic"),
         adm_src2=case_when(ADM_SRC_DESC=="NONHEALTHCARE FACILITY POINT OF ORIGIN"~"Home",
                            ADM_SRC_DESC=="XFER FROM A HOSPITAL (DIFF FACILITY)"~"Acute Care Hospital Transfer",
                            ADM_SRC_DESC=="XFER FROM AMBULATORY SURGERY CENTER"~"Subacute Facility",
                            ADM_SRC_DESC=="XFER FROM DU IN SAME HOSP;SEPARATE CLAIM"~"Subacute Facility",
                            ADM_SRC_DESC=="XFER FROM HLTH FAC OR BORN OUTSIDE HOSP"~"Subacute Facility",
                            ADM_SRC_DESC=="XFER FROM HOSPICE;UNDER PLAN OR ENROLLED"~"Subacute Facility",
                            ADM_SRC_DESC=="XFER FROM SNF, ICF OR BORN INSIDE HOSP"~"Subacute Facility",
                            TRUE~"Other"),
         adm_type2=case_when(ADM_TYPE_DESC=="ELECTIVE"~"Elective",
                             ADM_TYPE_DESC=="EMERGENCY"~"Emergency/Urgent",
                             ADM_TYPE_DESC=="URGENT"~"Emergency/Urgent",
                             TRUE~"Other"),
         payor_new=case_when(STD_PAYOR %in% c('300','310','320')~'Medicare',
                         STD_PAYOR %in% c('330','340','350')~'Medicaid',
                         STD_PAYOR %in% c('360','370','380')~'Private Insurance',
                         STD_PAYOR %in% c('390','400','410')~'Uninsured',
                         TRUE~'Other'),
         acute_resp_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE %in% c('J96.00','J96.01','J96.02','J96.20','J96.21',
                                                                                                    'J96.22','J80','R06.3','R06.9','R09.2'),]$PAT_KEY~1, 
                                       TRUE~0),
         renal_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE %in% c('N00.0',"N17.0",'N17.1','N17.2','N17.8','N17.9'),]$PAT_KEY~1,
                                  TRUE~0),
         hepatic_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE %in% c('K72.00','K72.90','K71.6',
                                                                                                    'K76.2','K72.91','K75.9'),]$PAT_KEY~1,
                                  TRUE~0),
         hematologic_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE %in% c('D65','D68.1','D68.8','D68.9','D69.3',
                                                                                                    'D69.41','D69.42','D69.49','D69.51',
                                                                                                    'D69.59','D69.6','D69.49'),]$PAT_KEY~1,
                                  TRUE~0),
         metabolic_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE=='E87.2',]$PAT_KEY~1,
                                  TRUE~0),
         neurologic_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     inpat20v3_diag$ICD_CODE %in% c('F29','G93.1','G93.40','R40.20','R40.0',
                                                                                                    'G93.41','G93.49','R40.1'),]$PAT_KEY~1,
                                  TRUE~0),
         dnr_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & inpat20v3_diag$ICD_CODE=='Z66',]$PAT_KEY~1, TRUE~0),
         icuvent_day02=case_when(PAT_KEY %in% icuventday_0p2$PAT_KEY~1, TRUE~0),
         icu_or_nippv_day02=case_when(PAT_KEY %in% icuday_0p2$PAT_KEY~1,
                                      #PAT_KEY %in% whatever is needed for nippv
                                      TRUE~0),
         
         cancer_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                            grepl('C',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         ckd_stage3_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                inpat20v3_diag$ICD_CODE %in% c('N18.3','N18.4','N18.5','N18.6'),]
                                  $PAT_KEY~1, TRUE~0),
         copd_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                inpat20v3_diag$ICD_CODE %in% c('J44','J44.0','J44.1','J44.9'),]
                            $PAT_KEY~1, TRUE~0),
         immunocomp_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                grepl('D71|D80|D81|D82|D83|D84|D89',inpat20v3_diag$ICD_CODE),]
                                  $PAT_KEY~1, TRUE~0),
         obese_overweight_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & grepl('E66',inpat20v3_diag$ICD_CODE),]
                                        $PAT_KEY~1, TRUE~0),
         pregnant_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                              grepl('Z33|Z34|Z36|Z3A|O',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         sickle_cell_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                 grepl('D57',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         diabetes_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                              grepl('E10|E11',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         asthma_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                inpat20v3_diag$ICD_CODE %in% c('J45','J45.2','J45.20','J45.21','J45.22',
                                                                                               'J45.3','J45.30','J45.31','J45.32','J45.4',
                                                                                               'J45.40','J45.41','J45.42','J45.5','J45.50',
                                                                                               'J45.51','J45.52','J45.9','J45.90','J45.901',
                                                                                               'J45.902','J45.903','J45.99','J45.990','J45.991',
                                                                                               'J45.998','J47','J47.0','J47.1','J47.9'),]
                              $PAT_KEY~1, TRUE~0), 
         cystic_fibrosis_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                     grepl('E84',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         interstitial_lung_dx_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                          grepl('J84',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         thalassemia_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                 grepl('D56',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         cirrhosis_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                               inpat20v3_diag$ICD_CODE %in% c('K70.11','K70.3','K70.41',
                                                                                              'K71.7','K76.7','K76.81'),]$PAT_KEY~1,TRUE~0),
         heart_fail_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' &
                                                                inpat20v3_diag$ICD_CODE %in% c('O90.3','I51.7'),]$PAT_KEY~1,
                                  PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                grepl('I25|I46',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         smoking_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' &
                                                                inpat20v3_diag$ICD_CODE=='Z72.0',]$PAT_KEY~1, TRUE~0),
         cerebrovascular_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' &
                                                                inpat20v3_diag$ICD_CODE %in% c('G93.1' , 'G93.82','I67.81','I67.82',
                                                                                               'I69.03','I69.04','I69.05','I69.06',
                                                                                               'I69.13', 'I69.14','I69.15','I69.16',
                                                                                               'I69.23','I69.24','I69.25','I69.26',
                                                                                               'I69.33,','I69.34','I69.35','I69.36',
                                                                                               'I69.83','I69.84','I69.85','I69.86',
                                                                                               'I69.93', 'I69.94','I69.95','I69.96'),]$PAT_KEY~1,
                                       PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                                grepl('G10|G11|G12|G13|G20|G21|G22|G23|G30|G31|G32|G35|G36|G37|G46|
                                                                G80|G81|G82|G83|Q00|Q01|Q02|Q03|Q04|Q05|Q06|Q07|I63',inpat20v3_diag$ICD_CODE),]
                                       $PAT_KEY~1, TRUE~0))


                                      
inpat20v3 <- inpat20v3 %>% 
  mutate(pregnant_poa=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_POA=='Y' & 
                                                              grepl('Z33|Z34|Z36|Z3A|O',inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(immunocomp_poa2=case_when(PAT_KEY %in% inpat20v3_diag[inpat20v3_diag$ICD_CODE %in% c('D70.0','D70.1','D70.2','D70.3','D70.4','D70.8','D70.9',
                                               'B20','Z92.25','Z79.5','Z79.52','D71',
                                               'D80.0','D80.1','D80.2','D80.3','D80.4','D80.5','D80.6','D80.7','D80.8','D80.9',
                                               'D81.0','D81.1','D81.2','D81.3','D81.4','D81.5','D81.6','D81.7','D81.8','D81.81','D81.810','D81.818','D81.819',
                                               'D81.89','D81.9',
                                               'D82.0','D82.1','D82.2','D82.3','D82.4','D82.8','D82.9',
                                               'D83.0','D83.1','D83.2','D83.8','D83.9',
                                               'D84.0','D84.1','D84.8','D84.9',
                                               'D89.0','D89.1','D89.2','D89.3','D89.4','D89.40','D89.41','D89.42','D89.43','D89.49',
                                               'D89.8','D89.81','D89.8110','D89.8111','D89.812','D89.813','D89.82','D89.89','D89.9'),]$PAT_KEY~1, TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(anyvent=case_when(PAT_KEY %in% vent_day20v3$PAT_KEY~1, TRUE~0))

inpat_bill201$nippv <- ifelse(grepl('CPAP|BIPAP|NIPPV|HVNI|High Flow Oxygen|HFNC|Non-Invasive Ventilation|Mask (O2, BIPAP, CPAP)|
                                    Venti mask|Nasal Cannula (high-flow)|Optiflow|94660', inpat_bill201$STD_CHG_DESC),1,0)
inpat_bill202$nippv <- ifelse(grepl('CPAP|BIPAP|NIPPV|HVNI|High Flow Oxygen|HFNC|Non-Invasive Ventilation|Mask (O2, BIPAP, CPAP)|
                                    Venti mask|Nasal Cannula (high-flow)|Optiflow|94660', inpat_bill202$STD_CHG_DESC),1,0)
inpat_bill203$nippv <- ifelse(grepl('CPAP|BIPAP|NIPPV|HVNI|High Flow Oxygen|HFNC|Non-Invasive Ventilation|Mask (O2, BIPAP, CPAP)|
                                    Venti mask|Nasal Cannula (high-flow)|Optiflow|94660', inpat_bill203$STD_CHG_DESC),1,0)
inpat_bill204$nippv <- ifelse(grepl('CPAP|BIPAP|NIPPV|HVNI|High Flow Oxygen|HFNC|Non-Invasive Ventilation|Mask (O2, BIPAP, CPAP)|
                                    Venti mask|Nasal Cannula (high-flow)|Optiflow|94660', inpat_bill204$STD_CHG_DESC),1,0)

inpat20v3 <- inpat20v3 %>% 
  mutate(lowrisknippv=case_when(PAT_KEY %in% inpat20v3_diag[grepl("G57.33|E66.2", inpat20v3_diag$ICD_CODE),]$PAT_KEY~1, TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(highrisknippv_day02=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$nippv==1 & inpat_bill201$SERV_DAY %in% c(0:2),]$PAT_KEY & 
                                         lowrisknippv==0 & anyvent==0 ~1,
                                       PAT_KEY %in% inpat_bill202[inpat_bill202$nippv==1 & inpat_bill202$SERV_DAY %in% c(0:2),]$PAT_KEY & 
                                         lowrisknippv==0 & anyvent==0~1,
                                       PAT_KEY %in% inpat_bill203[inpat_bill203$nippv==1 & inpat_bill203$SERV_DAY %in% c(0:2),]$PAT_KEY & 
                                         lowrisknippv==0 & anyvent==0 ~1,
                                       PAT_KEY %in% inpat_bill204[inpat_bill204$nippv==1 & inpat_bill204$SERV_DAY %in% c(0:2),]$PAT_KEY & 
                                         lowrisknippv==0 & anyvent==0 ~1,
                                       TRUE~0)) 
inpat20v3 <- inpat20v3 %>% 
  mutate(highrisknippv=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$nippv==1,]$PAT_KEY & lowrisknippv==0 & anyvent==0 ~1,
                                 PAT_KEY %in% inpat_bill202[inpat_bill202$nippv==1,]$PAT_KEY & lowrisknippv==0 & anyvent==0 ~1,
                                 PAT_KEY %in% inpat_bill203[inpat_bill203$nippv==1,]$PAT_KEY & lowrisknippv==0 & anyvent==0 ~1,
                                 PAT_KEY %in% inpat_bill204[inpat_bill204$nippv==1,]$PAT_KEY & lowrisknippv==0 & anyvent==0 ~1,
                                 TRUE~0)) 
inpat20v3 <- inpat20v3 %>% 
  mutate(anynippv_novent=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$nippv==1,]$PAT_KEY & anyvent==0 ~1,
                                   PAT_KEY %in% inpat_bill202[inpat_bill202$nippv==1,]$PAT_KEY & anyvent==0 ~1,
                                   PAT_KEY %in% inpat_bill203[inpat_bill203$nippv==1,]$PAT_KEY & anyvent==0 ~1,
                                   PAT_KEY %in% inpat_bill204[inpat_bill204$nippv==1,]$PAT_KEY & anyvent==0 ~1,
                                   TRUE~0)) 



inpat20v3 <- inpat20v3 %>% 
  mutate(grade_day02=case_when(icuvent_day02==1~3,
                               icu_or_nippv_day02==1~2,
                               highrisknippv_day02==1~2,
                               covid==1~1,
                               TRUE~0))
         
icu_day20v3 <- icu_day20v3 %>% 
  mutate(icu=1) %>% 
  rename(day=icu_day)

icu_vent_all <- full_join(icu_day20v3, vent_day20v3)
icu_vent_all <- icu_vent_all %>% 
  filter(icu==1 & vent==1)


inpat20v3 <- inpat20v3 %>%
  mutate(any_icuvent=case_when(PAT_KEY %in% icu_vent_all$PAT_KEY~1,
                               TRUE~0),
         highestgrade_anyday=case_when(any_icuvent==1~3,
                                       icu==1~2,
                                       highrisknippv==1~2,
                                       covid==1~1,
                                       TRUE~0))
         
         
inpat20v3 <- left_join(inpat20v3, cohort_elix)
inpat20v3 <- inpat20v3 %>% 
  rename(elixhauser_score=score,
         elix_CHF=CHF,                      
         elix_Arrhythmia=Arrhythmia,              
         elix_Valvular=Valvular,
         elix_PHTN=PHTN,
         elix_PVD=PVD,
         elix_HTN=HTN,
         elix_Paralysis=Paralysis,
         elix_NeuroOther=NeuroOther,
         elix_Pulmonary=Pulmonary,
         elix_DM=DM,
         elix_DMcx=DMcx,
         elix_Hypothyroid=Hypothyroid,
         elix_Renal=Renal,                
         elix_Liver=Liver ,                  
         elix_PUD=PUD     ,                 
         elix_HIV=HIV,
         elix_Lymphoma=Lymphoma,
         elix_Mets=Mets,
         elix_Tumor=Tumor,
         elix_Rheumatic=Rheumatic,
         elix_Coagulopathy=Coagulopathy,
         elix_Obesity=Obesity,
         elix_WeightLoss=WeightLoss,
         elix_FluidsLytes=FluidsLytes,
         elix_BloodLoss=BloodLoss,           
         elix_Anemia=Anemia,
         elix_Alcohol=Alcohol,
         elix_Drugs=Drugs,
         elix_Psychoses=Psychoses,
         elix_Depression=Depression) 

inpat20v3_proc <- left_join(inpat20v3_proc, icdcode)
inpat20v3_diag <- left_join(inpat20v3_diag, icdcode)

inpat20v3 <- left_join(inpat20v3, disstat)

inpat20v3 <- inpat20v3 %>% 
  mutate(trach=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_DESC %in% c('BP TRACH CUTANEOUS WTRACH DEV PEA','BP TRACH TO CUTANEOUS OPEN APPRO',
                                                                                    'BP TRACH TO CUTANEOUS PERCU ENDO AP','BP TRACH TO CUTANEOUS WTRACH DEV PA',
                                                                                    'BP TRACH TO CUTANEOUS, PERCU APPRO','BP TRACH TO CUTANUS W/TRCHOS DEV OA'),]
                         $PAT_KEY~1, TRUE~0),
         acute_discharge=case_when(grepl('ACUT', DISC_STATUS_DESC)~1, 
                                   DISC_STATUS_DESC %in% c('DISCHARGED/TRANSFERRED TO A CAH','DISCHARGED/TRANSFERRED TO FEDERAL HOSP',
                                                           'DISCHARGED/TRANSFERRED TO OTHER FACILITY')~1,
                                   TRUE~0))











#### hospital level, tech index variables ####

inpat19v3 <- inpat19v3 %>% 
  mutate(beam_therapy=case_when(PAT_KEY %in% inpat20v3_proc[grepl('D00....|D70....|D80....|D90....|DB0....|DD0....|DF0....|
                                                                  DG0....|DH0....|DM0....|DP0....|DT0....|DU0....|DV0....|DW0....', 
                                                                  inpat20v3_proc$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         nonrenaltx=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE %in% c('02YA0Z0','02YA0Z1','02YA0Z2','0DY80Z0',
                                                                                         '0DY80Z1','0DY80Z2','0FYG0Z0','0FYG0Z1',
                                                                                         '0FYG0Z2','0FY00Z0','0FY00Z1','0FY00Z2',
                                                                                         '0BYM0Z0','0BYM0Z1','0BYM0Z2'),]$PAT_KEY~1, TRUE~0),
         ecmo=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE %in% c("5A1522F","5A1522G","5A1522H"),]$PAT_KEY~1, TRUE~0),
         heart_cath=case_when(PAT_KEY %in% inpat20v3_proc[grepl('0270...|0271...|0272...|0273...',inpat20v3_proc$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         anyvent=case_when(PAT_KEY %in% inpat19v3_proc[inpat19v3_proc$ICD_CODE %in% c('5A1935Z','5A1945Z','5A1955Z'),]$PAT_KEY~1, TRUE~0),
         medicaid=case_when(STD_PAYOR %in% c('330','340','350')~1, TRUE~0))



inpat20v3 <- inpat20v3 %>% 
  mutate(beam_therapy=case_when(PAT_KEY %in% inpat20v3_proc[grepl('D00....|D70....|D80....|D90....|DB0....|DD0....|DF0....|
                                                                  DG0....|DH0....|DM0....|DP0....|DT0....|DU0....|DV0....|DW0....', 
                                                                  inpat20v3_proc$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         nonrenaltx=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE %in% c('02YA0Z0','02YA0Z1','02YA0Z2','0DY80Z0',
                                                                                         '0DY80Z1','0DY80Z2','0FYG0Z0','0FYG0Z1',
                                                                                         '0FYG0Z2','0FY00Z0','0FY00Z1','0FY00Z2',
                                                                                         '0BYM0Z0','0BYM0Z1','0BYM0Z2'),]$PAT_KEY~1, TRUE~0),
         ecmo=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE %in% c("5A1522F","5A1522G","5A1522H"),]$PAT_KEY~1, TRUE~0),
         heart_cath=case_when(PAT_KEY %in% inpat20v3_proc[grepl('0270...|0271...|0272...|0273...',inpat20v3_proc$ICD_CODE),]$PAT_KEY~1, TRUE~0),
         medicaid=case_when(STD_PAYOR %in% c('330','340','350')~1, TRUE~0))




hosp19techind <- inpat19v3 %>% 
  group_by(PROV_ID) %>% 
  summarise(beam_therapy19=sum(beam_therapy),
            nonrenaltx19=sum(nonrenaltx),
            ecmo19=sum(ecmo),
            heartcath19=sum(heart_cath),
            vent=sum(anyvent),
            medicaid=sum(medicaid),
            totaladmit19=n_distinct(PAT_KEY),
            total_attend19=n_distinct(ATT_PHY)) %>% 
  mutate(beam_therapy19_bin=case_when(beam_therapy19>1~1, TRUE~0),
         nonrenaltx19_bin=case_when(nonrenaltx19>1~1, TRUE~0),
         ecmo19_bin=case_when(ecmo19>1~1, TRUE~0),
         heartcath19_bin=case_when(heartcath19>1~1, TRUE~0),
         vent_vol19=(vent/totaladmit19),
         medicaid_vol19=(medicaid/totaladmit19),
         attend_ratio19=(total_attend19/totaladmit19)) 

hosp20techind <- inpat20v3 %>% 
  group_by(PROV_ID) %>% 
  summarise(beam_therapy20=sum(beam_therapy),
            nonrenaltx20=sum(nonrenaltx),
            ecmo20=sum(ecmo),
            heartcath20=sum(heart_cath),
            vent=sum(anyvent),
            medicaid=sum(medicaid),
            totaladmit20=n_distinct(PAT_KEY),
            total_attend20=n_distinct(ATT_PHY)) %>% 
  mutate(beam_therapy20_bin=case_when(beam_therapy20>1~1, TRUE~0),
         nonrenaltx20_bin=case_when(nonrenaltx20>1~1, TRUE~0),
         ecmo20_bin=case_when(ecmo20>1~1, TRUE~0),
         heartcath20_bin=case_when(heartcath20>1~1, TRUE~0),
         vent_vol20=(vent/totaladmit20),
         medicaid_vol20=(medicaid/totaladmit20),
         attend_ratio20=(totaladmit20/total_attend20)) 

hosptechind <- full_join(hosp19techind, hosp20techind, by='PROV_ID')
hosptechind <- hosptechind %>% 
  mutate(beam_therapy_bin=case_when(beam_therapy19_bin==1~1,
                                    beam_therapy20_bin==1~1,
                                    TRUE~0),
         nonrenaltx_bin=case_when(nonrenaltx19_bin==1~1,
                                  nonrenaltx20_bin==1~1,
                                  TRUE~0),
         ecmo_bin=case_when(ecmo19_bin==1~1, 
                            ecmo20_bin==1~1,
                            TRUE~0),
         heartcath_bin=case_when(heartcath19_bin==1~1,
                                 heartcath20_bin==1~1,
                                 TRUE~0)) %>% 
  select(PROV_ID,vent_vol19, vent_vol20, medicaid_vol19, medicaid_vol20,
         beam_therapy_bin, nonrenaltx_bin, ecmo_bin, heartcath_bin,
         attend_ratio20) %>% 
  rename(beam_therapy_hosp=beam_therapy_bin,
         nonrenaltx_hosp=nonrenaltx_bin,
         ecmo_hosp=ecmo_bin,
         heartcath_hosp=heartcath_bin,
         pat_per_attend20=attend_ratio20)

icuventprop <- inpat20v3 %>% 
  group_by(PROV_ID) %>%
  filter(covid==1) %>% 
  summarise(n_icuvent=sum(icuvent_day02),
            n_enc=n_distinct(PAT_KEY)) %>% 
  mutate(icuventprop_covid=n_icuvent/n_enc) %>% 
  select(PROV_ID, icuventprop_covid)
  
hosptechind <- left_join(hosptechind, icuventprop)
  
inpat20v3 <- left_join(inpat20v3, hosptechind, by='PROV_ID')
  
  
inpat20v3 <- as.data.frame(inpat20v3)
inpat20v3$PROV_ID <- as.character(inpat20v3$PROV_ID)
inpat20v3$icuventprop_covid <- as.character(inpat20v3$icuventprop_covid)

inpat20v3 <- inpat20v3 %>% 
  mutate(remdesivir_adm2=case_when(remdesivir_adm=='none'~0, TRUE~1),
         elixhauser_score=case_when(elixhauser_score>=0~elixhauser_score, TRUE~0),
         elix_CHF=case_when(elix_CHF>=0~elix_CHF, TRUE~0),
         elix_HTN=case_when(elix_HTN>=0~elix_HTN, TRUE~0),
         elix_NeuroOther=case_when(elix_NeuroOther>=0~elix_NeuroOther, TRUE~0),
         elix_Liver=case_when(elix_Liver>=0~elix_Liver, TRUE~0),
         vent_vol19=case_when(vent_vol19>=0~vent_vol19, TRUE~99),
         medicaid_vol19=case_when(medicaid_vol19>=0~medicaid_vol19, TRUE~99),
         icuventprop_covid=as.numeric(icuventprop_covid),
         icuventprop_covid=case_when(icuventprop_covid>=0~icuventprop_covid, TRUE~99))
inpat20v3 <- inpat20v3 %>% 
  mutate(death=case_when(DISC_STATUS %in% c(20,40,41,42,50,51)~1, TRUE~0))


# 2019 ICU type to determine number of ICU types per hospital
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_uncomp=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_ped=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_burn=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_ccu=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_covid=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_micu=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC %in% 
                                                        c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC %in% 
                                                       c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC %in% 
                                                        c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_nicu=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_psych=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_transpl=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_trauma=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              TRUE~0))
inpat19v2 <- inpat19v2 %>% 
  mutate(icu_sicu=case_when(PAT_KEY %in% inpat_bill191[inpat_bill191$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill192[inpat_bill192$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill193[inpat_bill193$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            TRUE~0))

inpat19v2 <- inpat19v2 %>% 
  mutate(n_icu=icu_uncomp+icu_ped+icu_burn+icu_ccu+icu_covid+icu_micu+icu_nicu+icu_psych+icu_transpl+icu_trauma+icu_sicu)


# 2020 ICU type to determine number of ICU types per hospital
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_uncomp=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in%
                                                           c('ELIMINATOR ROSE ICU','OBSERVATION ICU FLAT RATE','OBSERVATION ICU PER HR',
                                                             'OBSERVATION ICU/CCU ADDL HR','OBSERVATION ICU/CCU PER HR',
                                                             'R&B ICU','R&B ICU ISOLATION'),]$PAT_KEY~1,
                              TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_ped=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% 
                                                        c('OBSERVATION PED ICU PER HR','PACU(RECOVERY) ICU PER HR','R&B PEDIATRIC ICU'),]$PAT_KEY~1,
                           TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_burn=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B BURN ICU',]$PAT_KEY~1,
                            TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_ccu=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% 
                                                        c('R&B CICU/CCU (CORONARY CARE)','R&B CICU/CCU (CORONARY CARE)COVID19',
                                                          'R&B CICU/CCU ISOLATION (CORONARY CARE)','R&B CVICU','R&B CVICU ISOLATION'),]$PAT_KEY~1,
                           TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_covid=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B ICU COVID19',]$PAT_KEY~1,
                             TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_micu=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% 
                                                        c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% 
                                                       c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% 
                                                        c('R&B MICU (MEDICAL ICU)','R&B MICU (MEDICAL ICU) ISOLATION'),]$PAT_KEY~1,
                            TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_nicu=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B NURSERY INTENSIVE LEVEL III (NICU)',]$PAT_KEY~1,
                            TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_psych=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B PSYCH ICU PEDIATRIC',]$PAT_KEY~1,
                             TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_transpl=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B TRANSPLANT ICU',]$PAT_KEY~1,
                               TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_trauma=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC=='R&B TRAUMA ICU',]$PAT_KEY~1,
                              TRUE~0))
inpat20v3 <- inpat20v3 %>% 
  mutate(icu_sicu=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% 
                                                        c('R&B SICU  (SURGICAL ICU) ISOLATION','R&B SICU (SURGICAL ICU)'),]$PAT_KEY~1,
                            TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(n_icu20=icu_uncomp+icu_ped+icu_burn+icu_ccu+icu_covid+icu_micu+icu_nicu+icu_psych+icu_transpl+icu_trauma+icu_sicu)

inpat20v3 <- inpat20v3 %>% 
  mutate(any_icu_hosp=case_when(n_icu19>0~1,
                             n_icu20>0~1,
                             n_icu>0~1,
                             TRUE~0))

inpat20v3 <- inpat20v3 %>% 
  mutate(n_icu19=case_when(PROV_ID %in% inpat19v2[inpat19v2$n_icu==0,]$PROV_ID~'0',
                           PROV_ID %in% inpat19v2[inpat19v2$n_icu==1,]$PROV_ID~'1',
                           PROV_ID %in% inpat19v2[inpat19v2$n_icu==2,]$PROV_ID~'2',
                           PROV_ID %in% inpat19v2[inpat19v2$n_icu==3,]$PROV_ID~'3',
                           PROV_ID %in% inpat19v2[inpat19v2$n_icu==4,]$PROV_ID~'4',
                           TRUE~'unk'))
# ,
#          age_cat5=case_when(AGE<25~'<25',
#                             AGE>=25 & AGE<35~'25-34',
#                             AGE>=35 & AGE<45~'35-44',
#                             AGE>=45 & AGE<55~'45-54',
#                             AGE>=55 & AGE<65~'55-64',
#                             AGE>=65 & AGE<75~'65-74',
#                             AGE>=75 & AGE<85~'75-84',
#                             AGE>=85~'85+',
#                             TRUE~'unk'))


icu19_prov <- inpat19v2 %>% 
  group_by(PROV_ID) %>% 
  filter(n_icu==max(n_icu)) %>% 
  select(PROV_ID, n_icu) %>% 
  mutate(PROV_ID=as.character(PROV_ID)) %>% 
  mutate(n_icu=as.numeric(n_icu))
icu19_prov <- as.data.frame(icu19_prov)


icu_check <- inpat20v3 %>% 
  mutate(n_icu19=case_when(PROV_ID %in% icu19_prov[icu19_prov$n_icu==0,]$PROV_ID~'0',
                           PROV_ID %in% icu19_prov[icu19_prov$n_icu==1,]$PROV_ID~'1',
                           PROV_ID %in% icu19_prov[icu19_prov$n_icu==2,]$PROV_ID~'2',
                           PROV_ID %in% icu19_prov[icu19_prov$n_icu==3,]$PROV_ID~'3',
                           PROV_ID %in% icu19_prov[icu19_prov$n_icu==4,]$PROV_ID~'4',
                           TRUE~'unk'
                           )) %>% 
  select(PAT_KEY, n_icu19)

icu_check2 <- left_join(inpat20v3, icu_check)


max_icu <- inpat20v3 %>% 
  group_by(PROV_ID) %>% 
  summarise(n_icu=max(n_icu),
         n_icu20=max(n_icu20))

inpat20v3 <- inpat20v3 %>% 
  mutate(n_icu_max=case_when(PROV_ID %in% max_icu[max_icu$n_icu20==5,]$PROV_ID~5,
                             PROV_ID %in% max_icu[max_icu$n_icu==4,]$PROV_ID~4,
                             PROV_ID %in% max_icu[max_icu$n_icu20==4,]$PROV_ID~4,
                             PROV_ID %in% max_icu[max_icu$n_icu==3,]$PROV_ID~3,
                             PROV_ID %in% max_icu[max_icu$n_icu20==3,]$PROV_ID~3,
                             PROV_ID %in% max_icu[max_icu$n_icu==2,]$PROV_ID~2,
                             PROV_ID %in% max_icu[max_icu$n_icu20==2,]$PROV_ID~2,
                             PROV_ID %in% max_icu[max_icu$n_icu==1,]$PROV_ID~1,
                             PROV_ID %in% max_icu[max_icu$n_icu20==1,]$PROV_ID~1,
                             TRUE~0
                             ))






# proportion of encounters with COVID testing
covid_test_bill_list <- 
  c('CDC TESTING LABORATORIES TEST PATIENTS FOR COVID19',
'INF AGENT DET NUCL ACID(DNA/RNA)COVID19 AMP PROBE',
'INF AGENT DET NUCL ACID(DNA/RNA)COVID19 HIGH THR',
'INF DIS PATHOGEN-SPEC 21 TARGETS AMP PROBE COVID19',
'INF DIS(DNA/RNA) 22 TARGET INC/COVID19 QL NASOPHAR',
'INF DIS(DNA/RNA)22 TARG INC/COVID19 QL NASOPH  QIA',
'NON-CDC LAB TEST COVID19 HIGH THROUGHPUT TECHNOL',
'NON-CDC LABORATORIES TEST PATIENTS FOR COVID19',
'NUCLEIC ACID PROBE AMPLIFIED INFECT AGENT COVID19v',
'PF CDC TESTING LAB TEST PATIENTS FOR COVID19',
'PF INF AG DET NUCL ACID(DNA/RNA)COVID19 AMP PROBE',
'PF INF AGENT DET NUCL ACID(DNA/RNA)COVID19 HIGH TH',
'PF INF DIS PATH-SPEC 21 TARGETS AMP PROBE COVID19',
'PF INF DIS(DNA/RNA) 22 TARG INC/COVID19 QL NASOPH',
'PF INF DIS(DNA/RNA)22 TRG INC/COVID19 QL NASOP QIA',
'PF NON-CDC LAB TEST COVID19 HIGH THROUGHPUT TECH',
'PF NON-CDC LABORATORIES TEST PATIENTS FOR COVID19',
'PF NUCL ACID PROBE AMPLIFIED INFECT AGENT COVID19',
'PF RESP PATH MULT REV TRAN&AMP PRB 210 TRG COVID19',
'COVID19 LAB PROCEDURE UNLISTED',
'PF COVID19 LAB PROCEDURE UNLISTED')

inpat20v3 <- inpat20v3 %>% 
  mutate(covid_test_bill=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% covid_test_bill_list,]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% covid_test_bill_list,]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% covid_test_bill_list,]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill204[inpat_bill204$STD_CHG_DESC %in% covid_test_bill_list,]$PAT_KEY~1,
                                   TRUE~0
                                   ))

inpat20v3 <- inpat20v3 %>% 
  mutate(covid_test_bill02=case_when(PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill201$SERV_DAY %in% c(0,1,2),]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill201$SERV_DAY %in% c(0,1,2),]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill201$SERV_DAY %in% c(0,1,2),]$PAT_KEY~1,
                                   PAT_KEY %in% inpat_bill204[inpat_bill204$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill201$SERV_DAY %in% c(0,1,2),]$PAT_KEY~1,
                                   TRUE~0))

inpat20v3$covid_test_bill02a <- ifelse(inpat20v3$PAT_KEY %in% inpat_bill201[inpat_bill201$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill201$SERV_DAY %in% c(0,1,2),]$PAT_KEY,1,0) 
inpat20v3$covid_test_bill02b <- ifelse(inpat20v3$PAT_KEY %in% inpat_bill202[inpat_bill202$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill202$SERV_DAY %in% c(0,1,2),]$PAT_KEY,1,0) 
inpat20v3$covid_test_bill02c <- ifelse(inpat20v3$PAT_KEY %in% inpat_bill203[inpat_bill203$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill203$SERV_DAY %in% c(0,1,2),]$PAT_KEY,1,0) 
inpat20v3$covid_test_bill02d <- ifelse(inpat20v3$PAT_KEY %in% inpat_bill204[inpat_bill204$STD_CHG_DESC %in% covid_test_bill_list &
                                                                  inpat_bill204$SERV_DAY %in% c(0,1,2),]$PAT_KEY,1,0) 

inpat20v3 <- inpat20v3 %>% 
  mutate(covid_test_bill02=case_when(covid_test_bill02a==1~1,
                                     covid_test_bill02b==1~1,
                                     covid_test_bill02c==1~1,
                                     covid_test_bill02d==1~1,
                                     TRUE~0))



n_hosp_testing <- inpat20v3 %>% 
  filter(covid_test_bill==1) %>% 
  group_by(ADM_MON) %>%
  summarise(hosp_testing=n_distinct(PROV_ID))
  

per_hosp_testing <- inpat20v3 %>% 
  filter(cont_jan_aug==1) %>% 
  group_by(ADM_MON, PROV_ID, covid) %>% 
  summarise(n_tested=sum(covid_test_bill),
            n_enc=n_distinct(PAT_KEY),
            perc_tested=n_tested/n_enc)

ggplot(data=per_hosp_testing)+
  geom_point(aes(x=as.factor(PROV_ID),y=perc_tested))+
  facet_grid(.~ADM_MON, switch='x')+
  scale_x_discrete(labels='')+
  xlab("Hospitals")+
  ylab('Proportion of Encounters Tested for COVID-19')+
  ggtitle('Testing for COVID-19 Among All Encounters at Continuously Reporting Hospitals')+
  theme(legend.position = 'none')

ggplot(data=per_hosp_testing[per_hosp_testing$covid==1,])+
  geom_point(aes(x=as.factor(PROV_ID),y=perc_tested))+
  facet_grid(.~ADM_MON, switch='x')+
  scale_x_discrete(labels='')+
  xlab("Hospitals")+
  ylab('Proportion of Encounters Tested for COVID-19')+
  ggtitle('Testing for COVID-19 Among COVID-19 Diagnosed Encounters at Continuously Reporting Hospitals')+
  theme(legend.position = 'none')




datasetv9 <- fread('I:/Sarah Warner/Data for Yusuf/inpat2020v9.csv')



datasetv9$PROV_ID <- as.numeric(datasetv9$PROV_ID)
icu_check2$PROV_ID <- as.numeric(icu_check2$PROV_ID)
icu_check3 <- icu_check2 %>% 
  mutate(old_n_icu=case_when(PROV_ID %in% datasetv9[datasetv9$n_icu==0,]$PROV_ID~'0',
                             PROV_ID %in% datasetv9[datasetv9$n_icu==1,]$PROV_ID~'1',
                             PROV_ID %in% datasetv9[datasetv9$n_icu==2,]$PROV_ID~'2',
                             PROV_ID %in% datasetv9[datasetv9$n_icu==3,]$PROV_ID~'3',
                             PROV_ID %in% datasetv9[datasetv9$n_icu==4,]$PROV_ID~'4',
                             TRUE~'unk'
                             ))


inpat20v3 <- inpat20v3 %>% 
  mutate(n_icu=case_when(PROV_ID %in% datasetv9[datasetv9$n_icu==0,]$PROV_ID~'0',
                         PROV_ID %in% datasetv9[datasetv9$n_icu==1,]$PROV_ID~'1',
                         PROV_ID %in% datasetv9[datasetv9$n_icu==2,]$PROV_ID~'2',
                         PROV_ID %in% datasetv9[datasetv9$n_icu==3,]$PROV_ID~'3',
                         PROV_ID %in% datasetv9[datasetv9$n_icu==4,]$PROV_ID~'4',
                         TRUE~'unk'))


noncovid_permonth_perhosp2020 <- inpat20v3 %>% 
  filter(covid==0) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(non_covid_admits20=n_distinct(PAT_KEY)) %>% 
  mutate(ADM_MON=case_when(ADM_MON==2020101~'Jan',
                           ADM_MON==2020102~'Feb',
                           ADM_MON==2020103~'Mar',
                           ADM_MON==2020204~'Apr',
                           ADM_MON==2020205~'May',
                           ADM_MON==2020206~'Jun',
                           ADM_MON==2020307~'Jul',
                           ADM_MON==2020308~'Aug',
                           ADM_MON==2020309~'Sep',
                           ADM_MON==2020410~'Oct')) %>% 
  mutate(PROV_ID=as.numeric(PROV_ID))

permonth_perhosp2019 <- inpat19v2 %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(admits19=n_distinct(PAT_KEY)) %>% 
  mutate(ADM_MON=case_when(ADM_MON==2019101~'Jan',
                           ADM_MON==2019102~'Feb',
                           ADM_MON==2019103~'Mar',
                           ADM_MON==2019204~'Apr',
                           ADM_MON==2019205~'May',
                           ADM_MON==2019206~'Jun',
                           ADM_MON==2019307~'Jul',
                           ADM_MON==2019308~'Aug',
                           ADM_MON==2019309~'Sep',
                           ADM_MON==2019410~'Oct'))%>% 
  mutate(PROV_ID=as.numeric(PROV_ID))

permonth_noncovid_admits <- full_join(noncovid_permonth_perhosp2020, permonth_perhosp2019, by=c('PROV_ID','ADM_MON'))
permonth_noncovid_admits <- permonth_noncovid_admits %>% 
  filter(non_covid_admits20>0 & admits19>0) %>% 
  mutate(ratio_noncovid_20v19=non_covid_admits20/admits19) %>% 
  mutate(PROV_ID=as.numeric(PROV_ID))


noncovid <- subset(permonth_noncovid_admits, permonth_noncovid_admits$PROV_ID %in% analysis_data$PROV_ID)

noncovid_hosp <- analysis_data %>% 
  select(PROV_ID, ADM_MON, ratio_noncovid_20v19) %>% 
  mutate(hosp_month=paste(PROV_ID, ADM_MON, sep="_")) %>% 
  filter(!duplicated(hosp_month)) 
noncovid_hosp$ratio_noncovid_20v19[is.na(noncovid_hosp$ratio_noncovid_20v19)] <- 1

ggplot(data=noncovid_hosp)+
  geom_boxplot(aes(x=as.factor(ADM_MON), y=ratio_noncovid_20v19))+
  geom_hline(yintercept=1, linetype='dashed')+
  scale_y_continuous(limits=c(0.001,2), name='Ratio of Non-COVID Admissions 2020 versus 2019')+
  scale_x_discrete(labels=c('March','April','May','June','July','August'), name='Admission Month')+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/noncovid admits.tiff')




noncovid_hosp <- noncovid_hosp %>% 
  mutate(lt1=case_when(ratio_noncovid_20v19<1~1, TRUE~0))









inpat20v3 <- inpat20v3 %>% 
  mutate(month_text=case_when(ADM_MON==2020101~'Jan',
                           ADM_MON==2020102~'Feb',
                           ADM_MON==2020103~'Mar',
                           ADM_MON==2020204~'Apr',
                           ADM_MON==2020205~'May',
                           ADM_MON==2020206~'Jun',
                           ADM_MON==2020307~'Jul',
                           ADM_MON==2020308~'Aug',
                           ADM_MON==2020309~'Sep',
                           ADM_MON==2020410~'Oct')) %>% 
  mutate(PROV_ID=as.numeric(PROV_ID))

inpat20v3 <- left_join(inpat20v3, permonth_noncovid_admits[,c(1,2,5)], by=c('PROV_ID','month_text'='ADM_MON'))



inpat19_hosp <- inpat19 %>% 
  mutate(uninsured=case_when(STD_PAYOR %in% c('390','400','410')~1, TRUE~0)) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_uninsured=sum(uninsured),
            n_enc=n_distinct(PAT_KEY),
            perc_uninsured=(n_uninsured/n_enc)*100)

inpat20v3 <- left_join(inpat20v3, inpat19_hosp[,c(1,4)])
inpat20v3$perc_uninsured[is.na(inpat20v3$perc_uninsured)] <- 0

inpat20_hosp <- inpat20v3 %>% 
  filter(remdes_any==1) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(n_remdes=sum(remdes_any)) %>% 
  mutate(n_remdes=1) %>% 
  rename(remdes_hosp_month=n_remdes)
  
inpat20v3 <- left_join(inpat20v3, inpat20_hosp)
inpat20v3 <- inpat20v3 %>%  
  mutate(#remdes_hosp_month=case_when(remdes_hosp_month==1~1, TRUE~0),
         crrt=case_when(PAT_KEY %in% inpat20v3_proc[inpat20v3_proc$ICD_CODE=='5A1D90Z',]$PAT_KEY~1, TRUE~0))

crrt_hosp <- inpat20v3 %>% 
  filter(crrt==1) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_enc=sum(crrt))

inpat20v3 <- inpat20v3 %>% 
  mutate(crrt_hosp=case_when(PROV_ID %in% crrt_hosp$PROV_ID~1, TRUE~0))





#### create output file ####

inpat20v3 <- inpat20v3 %>% 
  mutate(discharge_status=case_when(DISC_STATUS %in% c(40,41,42,50,51)~'hospice', 
                                    DISC_STATUS==20~'deceased',
                                    TRUE~'alive'),
         died_on_hospice=case_when(DISC_STATUS %in% c(41,42)~1, TRUE~0))

discharge_vars <- inpat20v3[,c(1,2,167,168)]
discharge_vars <- discharge_vars[discharge_vars$PAT_KEY %in% patient_hospvardata_11.9.20_newvariables$PAT_KEY,]
write.csv(discharge_vars, 'I:/Sarah Warner/Data for Yusuf/discharge_vars.csv')


hosp_variation_data_11.9.20 <- inpat20v3 %>% 
  ungroup() %>% 
  filter(ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308')) %>% 
  filter(cont_jan_aug==1) 
  
hosp_variation_data_11.9.20 <- 
  hosp_variation_data_11.9.20[,c(1:6,134,17,52,32,133,
                                 25,53,54,55,
                                 56:61,47,132,35:38,49,50,62,
                                 120,111,
                                 65:77,78,81,86,88,94,
                                 39:42,122:131,35,135,136,138,141,155,
                                 157,158,159,165,167)]
  
patient_hospvardata_11.9.20_check <- hosp_variation_data_11.9.20 %>% 
  ungroup() %>% 
  group_by(MEDREC_KEY) %>% 
  filter(ADM_MON==min(ADM_MON),
         DISC_MON==min(DISC_MON),
         DISC_MON_SEQ==min(DISC_MON_SEQ))


demo_table <- CreateTableOne(data=hosp_variation_data_11.9.20,
                             vars=c("ADM_MON",'death',
                                    "age_cat5","GENDER","race4","LOS",
                                    "adm_src2","adm_type2","payor_new","acute_resp_fail_poa",
                                    "renal_fail_poa","hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","vaso_02","remdesivir_adm2","steroid_adm",
                                    "hydroxychl_azithro_adm","azithro_adm","hydroxychl_adm","dnr_poa",
                                    "grade_day02","elixhauser_score","cancer_poa","ckd_stage3_poa",
                                    "copd_poa","immunocomp_poa","obese_overweight_poa","pregnant_poa",
                                    "sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa",
                                    "interstitial_lung_dx_poa","thalassemia_poa","cirrhosis_poa","heart_fail_poa",
                                    "elix_CHF","elix_HTN","elix_NeuroOther","elix_Liver",
                                    "URBAN_RURAL","TEACHING","BEDS_GRP","PROV_REGION",
                                    "vent_vol19","vent_vol20","medicaid_vol19","medicaid_vol20",
                                    "beam_therapy_hosp","nonrenaltx_hosp","ecmo_hosp","heartcath_hosp",
                                    "pat_per_attend20","icuventprop_covid","remdesivir_hosp", 'covid_test_bill','n_icu',
                                    'ratio_noncovid_20v19'),
                             factorVars=c("ADM_MON",'death',
                                    "age_cat5","GENDER","race4",
                                    "adm_src2","adm_type2","payor_new","acute_resp_fail_poa",
                                    "renal_fail_poa","hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","vaso_02","remdesivir_adm2","steroid_adm",
                                    "hydroxychl_azithro_adm","azithro_adm","hydroxychl_adm","dnr_poa",
                                    "grade_day02","cancer_poa","ckd_stage3_poa",
                                    "copd_poa","immunocomp_poa","obese_overweight_poa","pregnant_poa",
                                    "sickle_cell_poa","diabetes_poa","asthma_poa","cystic_fibrosis_poa",
                                    "interstitial_lung_dx_poa","thalassemia_poa","cirrhosis_poa","heart_fail_poa",
                                    "elix_CHF","elix_HTN","elix_NeuroOther","elix_Liver",
                                    "URBAN_RURAL","TEACHING","BEDS_GRP","PROV_REGION",
                                    "beam_therapy_hosp","nonrenaltx_hosp","ecmo_hosp","heartcath_hosp",
                                    "remdesivir_hosp", 'covid_test_bill','n_icu'),
                             strata='covid')
print_demo_table <- print(demo_table,
                          nonnormal=c('LOS','elixhauser_score',
                                      "vent_vol19","vent_vol20",
                                      "medicaid_vol19","medicaid_vol20",
                                      "pat_per_attend20","icuventprop_covid",
                                      'ratio_noncovid_20v19'))
write.csv(print_demo_table, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/11.9.20 data demo table.csv')
write.csv(hosp_variation_data_11.9.20, 'I:/Sarah Warner/Data for Yusuf/hosp_variation_data_11.9.20_v3.csv')

write.csv(hosp_variation_data_11.9.20[,c(1,2,67)], 'I:/Sarah Warner/Data for Yusuf/hosp_variation_data_highest_grade.csv')


write.csv(patient_hospvardata_11.9.20, 'I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20.csv')

write.csv(patient_hospvardata_11.9.20[,c(1,2,6,70)], 'I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20_updated_number_icu.csv')

write.csv(patient_hospvardata_11.9.20[,c(1,2,6,71:75)], 'I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20_newvariables.csv')



describe(patient_hospvardata_11.9.20[,c(1,2,6,71:75)])

write.csv(inpat20v3, 'I:/Sarah Warner/Premier Data/working files/inpat20v3.csv')



patient_hospvardata_11.9.20 <- fread('I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20.csv')
patient_hospvardata_11.9.20_part2 <- fread('I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20_updated_number_icu.csv')
patient_hospvardata_11.9.20_part3 <- fread('I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20_newvariables.csv')

total_data <- left_join(patient_hospvardata_11.9.20[,-1], patient_hospvardata_11.9.20_part2[,-1])
total_data <- left_join(total_data, patient_hospvardata_11.9.20_part3[,-1])



inpat20v3 <- left_join(inpat20v3, disstat)





region_bymonth_volume <- inpat20v3 %>% 
  filter(month_text %in% c('Mar','Apr','May','Jun','Jul','Aug')) %>% 
  group_by(PROV_REGION, month_text) %>% 
  summarise(covid_enc=sum(covid),
            all_enc=n_distinct(PAT_KEY),
            perc_covid=(covid_enc/all_enc)*100)
region_bymonth_volume$month_text <- factor(region_bymonth_volume$month_text,
                                           levels=c('Mar','Apr','May','Jun','Jul','Aug'))

ggplot(data=region_bymonth_volume)+
  geom_bar(aes(x=month_text, y=perc_covid), stat='identity')+
  facet_grid(rows=vars(PROV_REGION))


patient_hospvardata_11.9.20_newvariables <- fread('I:/Sarah Warner/Data for Yusuf/patient_hospvardata_11.9.20_newvariables.csv')





## data table 
surge_index <- fread('C:/Users/warnersr/Desktop/SurgeIndex_ForSarah.csv')
surge_index2 <- surge_index %>% 
  group_by(ADM_MON, PROV_ID, SurgeIndexImputed) %>% 
  summarise(n=n_distinct(PAT_KEY)) %>% 
  select(-n)

# total_data$V1 <- NULL
total_data <- left_join(total_data, surge_index2)

quantile(total_data$SurgeIndexImputed, probs = c(0.5,0.75,0.9,0.95,0.975,0.99), na.rm=T)
quantile(surge_index$SurgeIndexImputed, probs = c(0.5,0.75,0.9,0.95,0.975,0.99), na.rm=T)
quantile(surge_index2$SurgeIndexImputed, probs = c(0.5,0.75,0.9,0.95,0.975,0.99), na.rm=F)

quantile(surge_index2$SurgeIndexImputed, probs = c(0.5,0.75,0.9,0.95,0.975,0.99,0.995), na.rm=F)

quantile(surge_index2$SurgeIndexImputed, probs = c(0.625,0.825,0.925,0.9625,0.9825,0.995), na.rm=F)
quantile(analysis_data$SurgeIndexImputed, probs = c(0.5,0.75,0.9,0.95,0.975,0.99), na.rm=T)



If(
                0 <= :SurgeIndexImputed < 1.60151038388924, "0-2",
                1.60151038388924 <= :SurgeIndexImputed < 3.67944444444444, "2-4",
                3.67944444444444 <= :SurgeIndexImputed < 8.00212866286629, "4-8",
                8.00212866286629 <= :SurgeIndexImputed < 12.5504892195452, "8-13",
                12.5504892195452 <= :SurgeIndexImputed < 19.5997223252263, "13-20",
                19.5997223252263 <= :SurgeIndexImputed < 35.9659037195411, "20-36",
                "36+"
)



total_data_covid <- total_data %>% 
  filter(covid==1) %>% 
  mutate(keep=case_when(PAT_KEY %in% surge_index$PAT_KEY~1, TRUE~0)) %>% 
  filter(keep==1) %>% 
  mutate(surge_cat=case_when(SurgeIndexImputed <1.60151038388924 & SurgeIndexImputed>=0~'<50%',
                             SurgeIndexImputed >=1.60151038388924 & SurgeIndexImputed <3.67944444444444~'50%-75%',
                             SurgeIndexImputed >=3.67944444444444 & SurgeIndexImputed <8.00212866286629~'75%-90%',
                             SurgeIndexImputed >=8.00212866286629 & SurgeIndexImputed <12.5504892195452~'90%-95%',
                             SurgeIndexImputed >=12.5504892195452 & SurgeIndexImputed <19.5997223252263~'95%-97.5%',
                             SurgeIndexImputed >=19.5997223252263 & SurgeIndexImputed <35.9659037195411~'97.5%-99%',
                             SurgeIndexImputed >=35.9659037195411~'99%+',
                             TRUE~'unk'),
         surge_cat2=case_when(SurgeIndexImputed <1.60151038388924 & SurgeIndexImputed>=0~'<50%',
                             SurgeIndexImputed >=1.60151038388924 & SurgeIndexImputed <3.67944444444444~'50%-75%',
                             SurgeIndexImputed >=3.67944444444444 & SurgeIndexImputed <8.00212866286629~'75%-90%',
                             SurgeIndexImputed >=8.00212866286629 & SurgeIndexImputed <12.5504892195452~'90%-95%',
                             SurgeIndexImputed >=12.5504892195452 & SurgeIndexImputed <19.5997223252263~'95%-97.5%',
                             SurgeIndexImputed >=19.5997223252263 & SurgeIndexImputed <35.9659037195411~'97.5%-99%',
                             SurgeIndexImputed >=35.9659037195411 & SurgeIndexImputed <62.344223~'99%',
                             SurgeIndexImputed >=62.344223~'99.5%',
                             TRUE~'unk')) %>% 
  filter(surge_cat!='unk') %>% 
  mutate(beds_cat=case_when(BEDS_GRP=='000-099'~'50',
                            BEDS_GRP=='100-199'~'150',
                            BEDS_GRP=='200-299'~'250',
                            BEDS_GRP=='300-399'~'350',
                            BEDS_GRP=='400-499'~'450',
                            BEDS_GRP=='500+'~'550',
                            TRUE~'unk'),
         wave=case_when(ADM_MON %in% c('2020103','2020204','2020205')~'wave 1',
                        ADM_MON %in% c('2020206','2020307','2020308')~'wave 2',
                        TRUE~'unk'),
         n_icu2=case_when(n_icu_max==1~'single',
                          n_icu_max>1~'multi',
                          TRUE~'unk'))

total_data_covid <- total_data_covid[total_data_covid$PAT_KEY %in% surge_index$PAT_KEY,]

total_data_covid <- as.data.table(total_data_covid)
total_data_covid$surge_cat <- factor(total_data_covid$surge_cat, 
                                     levels=c('<50%','50%-75%','75%-90%','90%-95%','95%-97.5%','97.5%-99%','99%+')) 
total_data_covid$beds_cat <- factor(total_data_covid$beds_cat, levels=c('50','150','250','350','450','550'))


hosp_var_demo_table2 <- CreateTableOne(data=total_data_covid, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa",
                                    "obese_overweight_poa","pregnant_poa","sickle_cell_poa","diabetes_poa",
                                    "asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                    "thalassemia_poa","cirrhosis_poa","heart_fail_poa","elix_CHF",
                                    "elix_HTN","elix_NeuroOther","elix_Liver",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death',
                                    "beds_cat","TEACHING","wave","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa",
                                    "obese_overweight_poa","pregnant_poa","sickle_cell_poa","diabetes_poa",
                                    "asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                    "thalassemia_poa","cirrhosis_poa","heart_fail_poa","elix_CHF",
                                    "elix_HTN","elix_NeuroOther","elix_Liver",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death',
                                    "beds_cat","TEACHING","wave","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"),
                             strata='surge_cat')


hosp_var_demo_table_print2 <- print(hosp_var_demo_table2, 
                                   nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))
write.csv(hosp_var_demo_table_print2, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/pat_demo_table4.csv')


hosp_var_demo_table3 <- CreateTableOne(data=total_data_covid, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa",
                                    "obese_overweight_poa","pregnant_poa","sickle_cell_poa","diabetes_poa",
                                    "asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                    "thalassemia_poa","cirrhosis_poa","heart_fail_poa","elix_CHF",
                                    "elix_HTN","elix_NeuroOther","elix_Liver",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death','surge_cat',
                                    "beds_cat","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cancer_poa","ckd_stage3_poa","copd_poa","immunocomp_poa",
                                    "obese_overweight_poa","pregnant_poa","sickle_cell_poa","diabetes_poa",
                                    "asthma_poa","cystic_fibrosis_poa","interstitial_lung_dx_poa",
                                    "thalassemia_poa","cirrhosis_poa","heart_fail_poa","elix_CHF",
                                    "elix_HTN","elix_NeuroOther","elix_Liver",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death','surge_cat',
                                    "beds_cat","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"),
                             strata='wave')


hosp_var_demo_table_print3 <- print(hosp_var_demo_table3, 
                                   nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))
write.csv(hosp_var_demo_table_print3, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/pat_demo_table_wave.csv')







 ### Export covid patients for david ####
write.csv(inpat20v3[,c(1,2,32,33)], 'I:/Sarah Warner/Premier Data/covid_pats_11.9.20.csv')

#### look for high flow in premier ####

chgmstr$o2 <- ifelse(grepl('O2|OXYGEN', STD_CHG_DESC))
### AOR Graph for TT slides ####

# 2-4  vs 0-2 	1.14	1.06	1.22
# 4-6  vs 0-2	  1.20	1.12	1.30
# 6-8  vs 0-2	  1.34	1.23	1.46
# 8-13 vs 0-2	  1.54	1.42	1.66
# 13   vs 0-2	  1.81	1.66	1.97

# 2-4   vs 0-2	1.14	1.05	1.22
# 4-8   vs 0-2	1.30	1.21	1.40
# 8-13  vs 0-2	1.61	1.48	1.75
# 13-20 vs 0-2	1.74	1.58	1.92
# 20-36 vs 0-2	1.89	1.71	2.10
# 36+   vs 0-2	2.32	2.04	2.64


order <- c(1,2,3,4,5,6)
aor <-   c(1.14,1.30,1.61,1.74,1.89,2.32)
lower <- c(1.05,1.21,1.48,1.58,1.74,2.04)
upper <- c(1.22,1.40,1.75,1.92,2.10,2.64)
data <- cbind(order, aor)
data <- cbind(data, lower)
data <- cbind(data, upper)
data <- as.data.frame(data)

cohort_labels=c('50%-75%\nvs <50%',
                '75%-90%\nvs <50%',
                '90%-95%\nvs <50%',
                '95%-97.5%\nvs <50%',
                '97.5%-99%\nvs <50%',
                '99%+\nvs <50%')

ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept=1)+
  xlab("Cohort")+
  ylab("Adjusted Odds Ratio")+
  scale_x_continuous(labels=cohort_labels, breaks=c(1,2,3,4,5,6))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/graph v3 .tiff')



ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept = 1)+
  xlab("Cohort")+
  ylab("Adjusted Odds Ratio")+
  coord_flip()+
  scale_x_continuous(labels=cohort_labels)+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/graph v2.tiff')



icu_data <- readRDS('I:/Sarah Warner/Premier Data/working files/icu_day20v3.RData')
icu_data <- as.data.frame(icu_data)
icu_data$icu_day <- as.numeric(icu_data$icu_day)
icu_data02 <- subset(icu_data, icu_data$icu_day %in% c(0,1,2))


icu_day02 <- patient_hospvardata_11.9.20_newvariables %>% 
  mutate(icu02=case_when(PAT_KEY %in% icu_data02$PAT_KEY~1, TRUE~0)) %>% 
  select(PAT_KEY, MEDREC_KEY, PROV_ID, icu02)

write.csv(icu_day02, 'I:/Sarah Warner/Data for Yusuf/icu_day02.csv')















#### flowsheet data ####


describe(inpat20v3[inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308'),]$MEDREC_KEY)
describe(inpat20v3[inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308'),]$PROV_ID)

describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308'),]$MEDREC_KEY)
describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308'),]$PROV_ID)

describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER=='U',]$MEDREC_KEY)

describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER!='U' &
                     inpat20v3$n_icu==0,]$MEDREC_KEY)

describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER!='U' &
                     inpat20v3$n_icu!=0 &
                     inpat20v3$covid15hosp!=0,]$MEDREC_KEY)


final_cohort <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/pat_key_medrec_key_analysiscohort_covidGE15.csv')
inpat20v3$covid15 <- ifelse(inpat20v3$PAT_KEY %in% final_cohort$PAT_KEY, 1, 0)
covid15 <- subset(inpat20v3, inpat20v3$covid15==1)
inpat20v3$covid15hosp <- ifelse(inpat20v3$PROV_ID %in% covid15$PROV_ID, 1, 0)
final_hosp_list <- inpat20v3 %>% 
  filter(covid15==1) %>% 
  group_by(PROV_ID) %>% 
  summarize(n_enc=n_distinct(PAT_KEY))
describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER!='U' &
                     inpat20v3$covid15hosp==1,]$MEDREC_KEY)



describe(inpat20v3[inpat20v3$cont_jan_aug==1 &
                     inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER!='U' &
                     inpat20v3$covid15hosp==1 #&
                     #inpat20v3$covid15==1
                   ,]$MEDREC_KEY)



describe(inpat20v3[inpat20v3$ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                     inpat20v3$GENDER!='U' &
                     #inpat20v3$covid==1 &
                     inpat20v3$covid15hosp==0 &
                     #inpat20v3$n_icu!=0 &
                     inpat20v3$cont_jan_aug==1
                   ,]$PROV_ID)






lt15hosp <- inpat20v3 %>% 
  filter(ADM_MON %in% c('2020103','2020204','2020205',
                       '2020206','2020307','2020308') &
           GENDER!='U' &
           inpat20v3$covid15hosp==0 &
           cont_jan_aug==1) %>% 
  mutate(uninsured=case_when(payor_new=='Uninsured'~1, TRUE~0),
         tech_index=case_when(ecmo_hosp==1~'high',
                              ecmo_hosp==0 & n_icu>1~'medhigh',
                              n_icu==1 & crrt_hosp==1~'medlow',
                              TRUE~'low')) %>% 
  # group_by(PROV_ID) %>% 
  # summarise(prop_medicaid=sum(medicaid/n_distinct(PAT_KEY)),
  #           prop_uninsured=sum(uninsured/n_distinct(PAT_KEY)))%>% 
  # 
  filter(!duplicated(PROV_ID))











setdiff(final_cohort$PAT_KEY, total_data_covid$PAT_KEY)
setdiff(final_cohort$MEDREC_KEY, total_data_covid$MEDREC_KEY)


inpat20v3 <- inpat20v3 %>% 
  mutate(check1=case_when(cont_jan_aug==1 &
                           ADM_MON %in% c('2020103','2020204','2020205',
                                              '2020206','2020307','2020308') &
                           GENDER!='U'~1, TRUE~0),
         check2=case_when(check1==1 & covid15hosp==1~1, TRUE~0))






cro(inpat20v3$n_icu)


inpat20v3$n_icu[is.na(inpat20v3$n_icu)] <- 99
inpat20v3 <- inpat20v3 %>% 
  mutate(any_icu_hosp=case_when(n_icu!=99~n_icu,
                                n_icu==99~n_icu20))


inpat20v3_6mos <- inpat20v3 %>%
  ungroup() %>%
  filter(ADM_MON %in% c('2020103','2020204','2020205',
                        '2020206','2020307','2020308'))
patient_covid <- inpat20v3_6mos %>% 
  filter(covid==1) %>% 
  group_by(MEDREC_KEY) %>% 
  filter(ADM_MON==min(ADM_MON),
         DISC_MON==min(DISC_MON),
         DISC_MON_SEQ==min(DISC_MON_SEQ))
patient_nocovid <- inpat20v3_6mos %>%
  ungroup() %>%
  filter(covid==0) 
patient_nocovid <- patient_nocovid%>% 
  group_by(MEDREC_KEY) %>% 
  filter(ADM_MON==min(ADM_MON),
         DISC_MON==min(DISC_MON),
         DISC_MON_SEQ==min(DISC_MON_SEQ))
patient_nocovid <- patient_nocovid %>% 
  filter(!PAT_KEY %in% patient_covid$PAT_KEY, 
         !MEDREC_KEY %in% patient_covid$MEDREC_KEY)



patient_6mos <- rbind(patient_covid, patient_nocovid)
patient_6mos$covid15 <- ifelse(patient_6mos$PAT_KEY %in% analysis_data$PAT_KEY, 1, 0)
patient_6mos$covid15hosp <- ifelse(patient_6mos$PROV_ID %in% analysis_data$PROV_ID, 1, 0)



describe(patient_6mos[
    patient_6mos$GENDER=='U' &
    #patient_6mos$any_icu_hosp!=0 &
    #patient_6mos$covid15hosp==1 &
    #patient_6mos$covid15==1 &
    patient_6mos$cont_jan_aug==1
    ,]$MEDREC_KEY)


cro(patient_6mos[
    patient_6mos$GENDER!='U' &
    patient_6mos$any_icu_hosp!=0 &
    patient_6mos$covid15hosp!=1 &
    patient_6mos$cont_jan_aug==1
    ,]$covid)
describe(patient_6mos[
    patient_6mos$GENDER!='U' &
    patient_6mos$any_icu_hosp!=0 &
    patient_6mos$covid15hosp!=1 &
    patient_6mos$cont_jan_aug==1
    ,]$PROV_ID)
describe(patient_6mos[
    patient_6mos$GENDER!='U' &
    patient_6mos$any_icu_hosp!=0 &
    patient_6mos$covid15hosp!=1 &
    patient_6mos$cont_jan_aug==1 &
    patient_6mos$covid==1
    ,]$PROV_ID)









#### hospital level demo table ####

hosp_demo_data <- analysis_data %>% 
  group_by(PROV_ID) %>% 
  mutate(medicaid=case_when(payor_new=='Medicaid'~1, TRUE~0),
         uninsured=case_when(payor_new=='Uninsured'~1, TRUE~0)) %>% 
  summarise(n_enc=n_distinct(PAT_KEY),
            n_medicaid=sum(medicaid),
            n_unins=sum(uninsured),
            perc_medicaid=(n_medicaid/n_enc)*100,
            perc_unins=(n_unins/n_enc)*100)
hosp_demo_data <- hosp_demo_data %>% 
  mutate(ecmo=case_when(PROV_ID %in% analysis_data[analysis_data$ecmo_hosp==1,]$PROV_ID~1, TRUE~0),
         multi_icu=case_when(ecmo==0 &
                               PROV_ID %in% analysis_data[analysis_data$n_icu>1,]$PROV_ID~1, TRUE~0),
         crrt=case_when(PROV_ID %in% analysis_data[analysis_data$n_icu==1,]$PROV_ID &
                        PROV_ID %in% analysis_data[analysis_data$crrt_hosp==1,]$PROV_ID~1, TRUE~0),
         nocrrt_noicu=case_when(PROV_ID %in% analysis_data[analysis_data$n_icu==1,]$PROV_ID &
                                  PROV_ID %in% analysis_data[analysis_data$crrt_hosp==0,]$PROV_ID~1, TRUE~0),
         tech_index=case_when(PROV_ID %in% analysis_data[analysis_data$Tech_Index_v2=='HighTech',]$PROV_ID~'HighTech',
                              PROV_ID %in% analysis_data[analysis_data$Tech_Index_v2=='MedHighTech',]$PROV_ID~'MedHighTech',
                              PROV_ID %in% analysis_data[analysis_data$Tech_Index_v2=='MedLowTech',]$PROV_ID~'MedLowTech',
                              PROV_ID %in% analysis_data[analysis_data$Tech_Index_v2=='LowTech',]$PROV_ID~'LowTech',
                              TRUE~'unk'))
subset <- analysis_data %>% 
  select(TEACHING, URBAN_RURAL, PROV_REGION, BEDS_GRP, vent_vol19, PROV_ID) %>% 
  filter(!duplicated(PROV_ID)) %>% 
  mutate(vent_vol19_perc=vent_vol19*100)
hosp_demo_data <- left_join(hosp_demo_data, subset)
  
hosp_demo_data$tech_index <- factor(hosp_demo_data$tech_index, levels=c('HighTech','MedHighTech','MedLowTech','LowTech'))
hosp_demo_table <- CreateTableOne(data=hosp_demo_data,
                                  vars=c('TEACHING','URBAN_RURAL','PROV_REGION',
                                         'BEDS_GRP','tech_index','perc_medicaid','perc_unins','vent_vol19_perc'),
                                  factorVars = c('TEACHING','URBAN_RURAL','PROV_REGION',
                                         'BEDS_GRP','tech_index'))
print_hosp_demo_table <- print(hosp_demo_table, nonnormal=c('perc_medicaid','perc_unins','vent_vol19_perc'))


hosp_month_demo_data <- analysis_data %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(remdes_hosp=sum(remdesivir_hosp),
            vent19=sum(vent_vol19),
            )



hosp_level_vars <- analysis_data_new %>% 
  mutate(acutetx=case_when(adm_src2=='Acute Care Hospital Transfer'~1, TRUE~0),
         icuvent02=case_when(PAT_KEY %in% icu_vent[icu_vent$icu_day %in% c(0,1,2),]$PAT_KEY~1, TRUE~0),
         icuventany=case_when(PAT_KEY %in% icu_vent$PAT_KEY~1, TRUE~0),
         vent_trach=case_when(icuventany==1 & trach==1~1, TRUE~0),
         icu02=case_when(PAT_KEY %in% icu_day20v3[icu_day20v3$icu_day %in% c(0,1,2),]$PAT_KEY~1, TRUE~0),
         highrisknippvday02=case_when(PAT_KEY %in% inpat20v3[inpat20v3$highrisknippv_day02==1,]$PAT_KEY~1, TRUE~0),
         covid_test_bill02=case_when(PAT_KEY %in% inpat20v3[inpat20v3$covid_test_bill02==1,]$PAT_KEY~1, TRUE~0))%>% 
  group_by(PROV_ID, ADM_MON) %>% 
  mutate(n_enc=n_distinct(PAT_KEY),
         n_remdes_hosp=sum(remdes_hosp_month),
         n_vent=sum(icuventany),
         prop_remdes=(sum(remdesivir_adm2)/n_remdes_hosp)*100,
         prop_acutetx=(sum(acutetx)/n_enc)*100,
         prop_icuvent02=(sum(icuvent02)/n_enc)*100,
         prop_venttrach=(sum(vent_trach)/n_vent)*100,
         prop_tested=(sum(covid_test_bill)/n_enc)*100,
         prop_icu02=(sum(icu02)/n_enc)*100,
         prop_nippv=(sum(highrisknippvday02)/n_enc)*100,
         prop_test=(sum(covid_test_bill02)/n_enc)*100,
         prop_arf=(sum(acute_resp_fail_poa)/n_enc)*100)%>%
  ungroup() %>% 
  distinct(PROV_ID, ADM_MON, .keep_all = T) %>% 
  mutate(ratio_noncovid_19v20=1/ratio_noncovid_20v19)

analysis_data <- analysis_data %>% 
  mutate(acutetx=case_when(adm_src2=='Acute Care Hospital Transfer'~1, TRUE~0),
         icuvent02=case_when(PAT_KEY %in% icu_vent[icu_vent$icu_day %in% c(0,1,2),]$PAT_KEY~1, TRUE~0),
         icuventany=case_when(PAT_KEY %in% icu_vent$PAT_KEY~1, TRUE~0),
         vent_trach=case_when(icuventany==1 & trach==1~1, TRUE~0),
         icu02=case_when(PAT_KEY %in% icu_day20v3[icu_day20v3$icu_day %in% c(0,1,2),]$PAT_KEY~1, TRUE~0),
         highrisknippvday02=case_when(PAT_KEY %in% inpat20v3[inpat20v3$highrisknippv_day02==1,]$PAT_KEY~1, TRUE~0),
         covid_test_bill02=case_when(PAT_KEY %in% inpat20v3[inpat20v3$covid_test_bill02==1,]$PAT_KEY~1, TRUE~0))


hosp_month_table <- CreateTableOne(data=hosp_level_vars,
                                   vars=c("prop_remdes","prop_acutetx","prop_icuvent02","prop_venttrach",
                                          "prop_tested","prop_icu02","prop_nippv","ratio_noncovid_19v20",
                                          'pat_per_attend20','prop_test'),
                                   strata='ADM_MON')
print_hosp_month_table <- print(hosp_month_table, nonnormal=c("prop_remdes","prop_acutetx","prop_icuvent02",
                                                              "prop_venttrach","prop_tested","prop_icu02",
                                                              "prop_nippv","ratio_noncovid_19v20",'pat_per_attend20','prop_test'))
write.csv(print_hosp_month_table,'I:/Sarah Warner/Premier Data/Hosp Mort Variation/hosp_month_table.csv')

hosp_month_table_all <- CreateTableOne(data=hosp_level_vars,
                                   vars=c("prop_remdes","prop_acutetx","prop_icuvent02","prop_venttrach",
                                          "prop_tested","prop_icu02","prop_nippv","ratio_noncovid_19v20",
                                          'pat_per_attend20'))
print_hosp_month_table_all <- print(hosp_month_table_all, nonnormal=c("prop_remdes","prop_acutetx","prop_icuvent02","prop_venttrach",
                                          "prop_tested","prop_icu02","prop_nippv","ratio_noncovid_19v20",'pat_per_attend20'))

ggplot(data=hosp_level_vars)+
  geom_boxplot(aes(x=as.factor(ADM_MON), y=prop_icu02, fill=as.factor(ADM_MON)))+
  #geom_boxplot(aes(x=as.factor(BEDS_GRP), y=prop_icu02, fill=as.factor(ADM_MON)),alpha=0.5)+
  #facet_grid(vars(surge_cat))+
  scale_y_continuous(name='Proportion of Encounters Admitted to ICU', limits=c(-5,105))+
  scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
  scale_fill_jama(name='Admission Month',labels=c('March','April','May','June','July','August'),alpha=0.5)+
  #scale_fill_jama(name='Hospital Bed Size Range',labels=c('0-99','100-199','200-299','300-399','400-499','500+'), alpha=0.5)+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(),
        legend.position='none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/prop_icu.tiff')

# ggplot(data=hosp_level_vars)+
#   geom_boxplot(aes(x=as.factor(ADM_MON), y=prop_nippv, fill=as.factor(ADM_MON)))+
#   scale_y_continuous(name='Proportion of Encounters Receiving NIPPV')+
#   scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
#   scale_fill_jama(name='Admission Month',labels=c('March','April','May','June','July','August'),alpha=0.5)+
#   theme(plot.background = element_blank(),
#         panel.background = element_blank(),
#         legend.key = element_blank(),
#         axis.line = element_line(),
#         legend.position='none')
ggplot(data=hosp_level_vars)+
  geom_boxplot(aes(x=as.factor(ADM_MON), y=prop_nippv, fill=as.factor(ADM_MON)))+
  scale_y_continuous(name='Proportion of Encounters Receiving NIPPV', limits=c(0,50))+
  scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
  scale_fill_jama(name='Admission Month',labels=c('March','April','May','June','July','August'),alpha=0.5)+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(),
        legend.position='none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/prop_nippv.tiff')

ggplot(data=hosp_level_vars)+
  geom_boxplot(aes(x=as.factor(ADM_MON), y=prop_icuvent02, fill=as.factor(ADM_MON)))+
  scale_y_continuous(name='Proportion of Encounters Receiving \nInvasive Mechanical Ventilation')+
  scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
  scale_fill_jama(name='Admission Month',labels=c('March','April','May','June','July','August'),alpha=0.5)+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(),
        legend.position='none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/prop_icuvent.tiff')

ggplot(data=hosp_level_vars)+
  geom_boxplot(aes(x=as.factor(ADM_MON), y=prop_arf, fill=as.factor(ADM_MON)))+
  scale_y_continuous(name='Proportion of Encoutners Admitted\nwith Acute Respiratory Failure')+
  scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
  scale_fill_jama(name='Admission Month',labels=c('March','April','May','June','July','August'),alpha=0.5)+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(),
        legend.position='none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/prop_arf.tiff')



ggplot()+
  geom_point(data=hosp_level_vars[hosp_level_vars$ADM_MON=='2020103',], 
             aes(x=as.factor(PROV_ID),y=prop_icu02, color='#00A1D5FF'))+
  geom_point(data=hosp_level_vars[hosp_level_vars$ADM_MON=='2020308',], 
             aes(x=as.factor(PROV_ID),y=prop_icu02, color='#DF8F44FF'))+
  coord_flip()
  

month_diff_icu <- hosp_level_vars %>% 
  filter(ADM_MON %in% c('2020103','2020308')) %>% 
  select(ADM_MON, PROV_ID, prop_icu02) %>% 
  pivot_wider(id_cols=PROV_ID,
              names_from=ADM_MON,
              values_from=prop_icu02) %>% 
  rename(march=`2020103`,
         august=`2020308`) %>% 
  mutate(diff=march-august) %>% 
  arrange(desc(diff)) %>% 
  tibble::rownames_to_column(var='order') %>% 
  mutate(order=as.numeric(order))
ggplot(data=month_diff_icu)+
  geom_point(aes(x=order, y=as.numeric(diff)),color='#DF8F44FF')+
  xlab('Hospitals')+
  ylab('Difference in Proportion of Admissions\nto ICU in March vs August 2020')+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/icu diff.tiff')


month_diff_icuvent <- hosp_level_vars %>% 
  filter(ADM_MON %in% c('2020103','2020308')) %>% 
  select(ADM_MON, PROV_ID, prop_icuvent02) %>% 
  pivot_wider(id_cols=PROV_ID,
              names_from=ADM_MON,
              values_from=prop_icuvent02) %>% 
  rename(march=`2020103`,
         august=`2020308`) %>% 
  mutate(diff=march-august) %>% 
  arrange(desc(diff)) %>% 
  tibble::rownames_to_column(var='order') %>% 
  mutate(order=as.numeric(order))
ggplot(data=month_diff_icuvent)+
  geom_point(aes(x=order, y=as.numeric(diff)),color='#00A1D5FF')+
  xlab('Hospitals')+
  ylab('Difference in Proportion of Admissions\n Receiving Invasive Mechanical Ventilation\nin March vs August 2020')+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/vent diff.tiff')


month_diff_nippv <- hosp_level_vars %>% 
  filter(ADM_MON %in% c('2020103','2020308')) %>% 
  select(ADM_MON, PROV_ID, prop_nippv) %>% 
  pivot_wider(id_cols=PROV_ID,
              names_from=ADM_MON,
              values_from=prop_nippv) %>% 
  rename(march=`2020103`,
         august=`2020308`) %>% 
  mutate(diff=march-august) %>% 
  arrange(desc(diff)) %>% 
  tibble::rownames_to_column(var='order') %>% 
  mutate(order=as.numeric(order))
ggplot(data=month_diff_nippv)+
  geom_point(aes(x=order, y=as.numeric(diff)),color='#79AF97FF')+
  xlab('Hospitals')+
  ylab('Difference in Proportion of Admissions\n Receiving NIPPV in March vs August 2020')+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/nippv diff.tiff')


month_diff_arf <- hosp_level_vars %>% 
  filter(ADM_MON %in% c('2020103','2020308')) %>% 
  select(ADM_MON, PROV_ID, prop_arf) %>% 
  pivot_wider(id_cols=PROV_ID,
              names_from=ADM_MON,
              values_from=prop_arf) %>% 
  rename(march=`2020103`,
         august=`2020308`) %>% 
  mutate(diff=march-august) %>% 
  arrange(desc(diff)) %>% 
  tibble::rownames_to_column(var='order') %>% 
  mutate(order=as.numeric(order))
ggplot(data=month_diff_arf)+
  geom_point(aes(x=order, y=as.numeric(diff)),color='#6A6599FF')+
  xlab('Hospitals')+
  ylab('Difference in Proportion of Admissions\n Admitted with Acute Respiratory Failure\nin March vs August 2020')+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/arf diff.tiff')







#### plots for manuscript ####

ggplot(data=total_data_covid, aes(x=as.factor(ADM_MON),y=SurgeIndexImputed))+
    geom_boxplot(width=0.5)+
    ylab('Log Surge Index')+
    scale_y_log10(breaks=c(0.01,1,10,100,1000), labels=c(0.01,1,10,100,1000))+
    scale_x_discrete(name='Admission Month, 2020',labels=c('March','April','May','June','July','August'))+
    theme(plot.background = element_blank(),
          panel.background = element_blank(),
          axis.line = element_line(),
          axis.text = element_text(size=14),
          axis.title = element_text(size=18))


total_data_covid$SurgeIndexImputed_factor <- as.factor(total_data_covid$SurgeIndexImputed)


# hosp_list <- analysis_data %>% 
#   group_by(PROV_ID) %>% 
#   summarise(n=n_distinct(PAT_KEY)) %>% 
#   select(PROV_ID)
# #write.csv(hosp_list, "C:/users/warnersr/desktop/hosp_list.csv")
# #hosp_list <- fread("C:/users/warnersr/desktop/hosp_list.csv")
# hosp_list2 <- left_join(hosp_list, new_surge_hosplevel)
# hosp_list2$SurgeIndex_WithoutRatio[is.na(hosp_list2$SurgeIndex_WithoutRatio),] <- 0 
# hosp_list2 <- left_join(hosp_list2, analysis_data_new[,c(6,7,34)])
# hosp_list3 <- hosp_list2[!duplicated(hosp_list2),]
# 
# hosp_list4 <- hosp_list3 %>% 
#   filter(SurgeIndex_WithoutRatio_imp>0)
# 

hosp_list2 <- analysis_data %>% 
  select(PROV_ID, ADM_MON, SurgeIndex_WithoutRatio, PROV_REGION)
hosp_list3 <- hosp_list2 %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  filter(!duplicated(PROV_ID, ADM_MON))
hosp_list4 <- hosp_list3

ggplot()+
  geom_count(data=hosp_list2, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio, color=PROV_REGION),
             position = position_jitterdodge(seed=1, dodge.width=0.45))+
  geom_violin(data=hosp_list4, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio),
              trim=F, scale='width',position = position_dodge(width=0.9),fill=NA, size=1)+
  geom_boxplot(data=hosp_list4, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio),
               fill=NA, size=1, color="black", width=0.15, outlier.size = 0)+
  scale_y_log10(breaks=c(0.01,0.1,1,10,100), labels=c(0.01,0.1,1,10,100), 
                 name=expression(paste('Surge Index')))+
  scale_x_discrete(name='Admission Month, 2020',
                   labels=c('March\n Hospitals=472,\n Patients=11,179','April\n Hospitals=531,\n Patients=39,615',
                            'May\n Hospitals=522,\n Patients=19,353','June\n Hospitals=529,\n Patients=18,657',
                            'July\n Hospitals=536,\n Patients=34,823','August\n Hospitals=533,\n Patients=20,489'))+
  scale_color_nejm(name='Hospital Census Region',labels=c('Midwest','Northeast','South','West'))+
  scale_size_continuous(name='Number of Encounters', breaks=c(100,250,500))+
  guides(color = guide_legend(override.aes = list(size = 5)))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text.y = element_text(size=14),
        axis.text.x = element_text(size=10),
        axis.title = element_text(size=18),
        legend.key = element_blank(),
        legend.text = element_text(size=14),
        legend.title = element_text(size=16))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 1.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 1a.tiff')



ggplot()+
  geom_count(data=hosp_list2, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio, color=PROV_REGION),
             position = position_jitterdodge(seed=1, dodge.width=0.45))+
  geom_violin(data=hosp_list4, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio),
              trim=F, scale='width',position = position_dodge(width=0.9),fill=NA, size=1)+
  geom_boxplot(data=hosp_list4, aes(x=as.factor(ADM_MON),y=SurgeIndex_WithoutRatio),
               fill=NA, size=1, color="black", width=0.15, outlier.size = 0)+
  #scale_y_log10(breaks=c(0.01,0.1,1,10,100), labels=c(0.01,0.1,1,10,100), 
  #               name=expression(paste('Surge Index')))+
  scale_y_continuous(name=expression(paste('Surge Index'), limits=c(0,20), breaks=c(0,10,20)))+
  scale_x_discrete(name='Admission Month, 2020',
                   labels=c('March\n Hospitals=472,\n Patients=11,179','April\n Hospitals=531,\n Patients=39,615',
                            'May\n Hospitals=522,\n Patients=19,353','June\n Hospitals=529,\n Patients=18,657',
                            'July\n Hospitals=536,\n Patients=34,823','August\n Hospitals=533,\n Patients=20,489'))+
  scale_color_nejm(name='Hospital Census Region',labels=c('Midwest','Northeast','South','West'))+
  scale_size_continuous(name='Number of Encounters', breaks=c(100,250,500))+
  guides(color = guide_legend(override.aes = list(size = 5)))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text.y = element_text(size=14),
        axis.text.x = element_text(size=10),
        axis.title = element_text(size=18),
        legend.key = element_blank(),
        legend.text = element_text(size=14),
        legend.title = element_text(size=16))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 1.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 1b.tiff')










describe(hosp_list4[hosp_list4$ADM_MON=='2020308' &
                      hosp_list4$PROV_REGION=='MIDWEST',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020308' &
                      hosp_list4$PROV_REGION=='NORTHEAST',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020308' &
                      hosp_list4$PROV_REGION=='SOUTH',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020308' &
                      hosp_list4$PROV_REGION=='WEST',]$SurgeIndexImputed)


describe(hosp_list4[hosp_list4$ADM_MON=='2020103',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020204',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020205',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020206',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020307',]$SurgeIndexImputed)
describe(hosp_list4[hosp_list4$ADM_MON=='2020308',]$SurgeIndexImputed)

describe(hosp_list4[hosp_list4$ADM_MON=='2020103',]$PROV_ID)
describe(hosp_list4[hosp_list4$ADM_MON=='2020204',]$PROV_ID)
describe(hosp_list4[hosp_list4$ADM_MON=='2020205',]$PROV_ID)
describe(hosp_list4[hosp_list4$ADM_MON=='2020206',]$PROV_ID)
describe(hosp_list4[hosp_list4$ADM_MON=='2020307',]$PROV_ID)
describe(hosp_list4[hosp_list4$ADM_MON=='2020308',]$PROV_ID)

describe(analysis_data[analysis_data$ADM_MON=='2020103',]$PAT_KEY)
describe(analysis_data[analysis_data$ADM_MON=='2020204',]$PAT_KEY)
describe(analysis_data[analysis_data$ADM_MON=='2020205',]$PAT_KEY)
describe(analysis_data[analysis_data$ADM_MON=='2020206',]$PAT_KEY)
describe(analysis_data[analysis_data$ADM_MON=='2020307',]$PAT_KEY)
describe(analysis_data[analysis_data$ADM_MON=='2020308',]$PAT_KEY)








# 50-75 vs 00-50	  1.1228	1.0304	1.2234
# 75-90 vs 00-50	  1.2504	1.1392	1.3724
# 90-95 vs 00-50	  1.5086	1.3586	1.6752
# 95-97.5 vs 00-50	1.64	  1.4282	1.883
# 97.5-99 vs 00-50	1.7712	1.5204	2.0634
# 99-100 vs 00-50	  2.1774	1.8357	2.5827

order <- c(1,2,3,4,5)
aor <-   c(1.1113,1.2415,1.4244,1.5925,2.0044)
lower <- c(1.007,1.1177,1.2697,1.41,1.6862)
upper <- c(1.2266,1.379,1.5979,1.7986,2.3826)
data <- cbind(order, aor)
data <- cbind(data, lower)
data <- cbind(data, upper)
data <- as.data.frame(data)

cohort_labels=c('50%-75%\nvs <50%',
                '75%-90%\nvs <50%',
                '90%-95%\nvs <50%',
                '95%-99%\nvs <50%',
                '99%+\nvs <50%')

ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4,shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept=1, linetype='dashed')+
  xlab("Surge Index Category")+
  ylab("Adjusted Odds Ratio of Mortality")+
  scale_x_continuous(labels=cohort_labels, breaks=c(1:5))+
  scale_y_continuous(limits=c(0.9,3.6), breaks=c(1,2,3), labels=c('1.0','2.0','3.0'))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=10),
        axis.title = element_text(size=12))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 2b.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 4b.tiff')


order <- c(1,2,3,4,5)
aor <-   c(1.0477,1.077,1.137,1.2757,1.507)
lower <- c(0.9332,0.9685,1.0269,1.1552,1.3546)
upper <- c(1.1762,1.1978,1.2589,1.4087,1.6766)
data <- cbind(order, aor)
data <- cbind(data, lower)
data <- cbind(data, upper)
data <- as.data.frame(data)

cohort_labels=c('50%-60%\nvs <50%',
                '60%-70%\nvs <50%',
                '70%-80%\nvs <50%',
                '80%-90%\nvs <50%',
                '90%-100%\nvs <50%')

ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4,shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept=1, linetype='dashed')+
  xlab("Surge Index Category")+
  ylab("Adjusted Odds Ratio of Mortality")+
  scale_x_continuous(labels=cohort_labels, breaks=c(1:5))+
  scale_y_continuous(limits=c(0.9,3.6), breaks=c(1,2,3), labels=c('1.0','2.0','3.0'))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=10),
        axis.title = element_text(size=12))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 2a.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 4a.tiff')







# 
# # wave=1: 50-75 vs 00-50	  1.09	0.96	1.24
# # wave=1: 75-90 vs 00-50	  1.12	0.97	1.28
# # wave=1: 90-95 vs 00-50	  1.47	1.25	1.73
# # wave=1: 95-97.5 vs 00-50	1.53	1.26	1.85
# # wave=1: 97.5-99 vs 00-50	1.51	1.26	1.81
# # wave=1: 99-100 vs 00-50	  1.89	1.56	2.28
# # wave=2: 50-75 vs 00-50	  1.18	1.05	1.32
# # wave=2: 75-90 vs 00-50	  1.48	1.3	  1.69
# # wave=2: 90-95 vs 00-50	  1.9	  1.66	2.18
# # wave=2: 95-97.5 vs 00-50	2.14	1.8	  2.53
# # wave=2: 97.5-99 vs 00-50	3.24	2.72	3.86
# # wave=2: 99-100 vs 00-50	  3.08	2.38	3.97
# 
# 
# order <- c(1,2,3,4,5,6,7,8,9,10,11,12)
# aor <- c  (1.09,1.12,1.47,1.53,1.51,1.89,1.18,1.48,1.9 ,2.14,3.24,3.08)
# lower <- c(0.96,0.97,1.25,1.26,1.26,1.56,1.05,1.3 ,1.66,1.8 ,2.72,2.38)
# upper <- c(1.24,1.28,1.73,1.85,1.81,2.28,1.32,1.69,2.18,2.53,3.86,3.97)
# wave <- c(1,1,1,1,1,1,2,2,2,2,2,2)
# data <- cbind(order, aor)
# data <- cbind(data, lower)
# data <- cbind(data, upper)
# data <- cbind(data, wave)
# data <- as.data.frame(data)
# 
# cohort_labels=c('50%-75%\nvs <50%',
#                 '75%-90%\nvs <50%',
#                 '90%-95%\nvs <50%',
#                 '95%-97.5%\nvs <50%',
#                 '97.5%-99%\nvs <50%',
#                 '99%+\nvs <50%',
#                 '50%-75%\nvs <50%',
#                 '75%-90%\nvs <50%',
#                 '90%-95%\nvs <50%',
#                 '95%-97.5%\nvs <50%',
#                 '97.5%-99%\nvs <50%',
#                 '99%+\nvs <50%')
# 
# ggplot(data=data, aes(x=order, y=aor))+
#   geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
#   geom_point(size=4,shape=15,aes(color=as.factor(wave)))+
#   geom_hline(yintercept=1)+
#   geom_vline(xintercept=6.5, linetype='dashed')+
#   annotate("text", x=2,y=3.5, hjust=0.5, size=5, 
#            label=expression(paste(bold('Wave 1: March - May'))))+
#   annotate("text", x=8.5,y=3.5, hjust=0.5, size=5, 
#            label=expression(paste(bold('Wave 2: June - August'))))+
#   xlab("Surge Index Category")+
#   ylab("Adjusted Odds Ratio of Mortality")+
#   scale_x_continuous(labels=cohort_labels, breaks=c(1:12))+
#   scale_color_jama()+
#   theme(plot.background = element_blank(),
#         panel.background = element_blank(),
#         axis.line = element_line(),
#         legend.position = 'none',
#         axis.text = element_text(size=10),
#         axis.title = element_text(size=14))
# ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/wave vs surge model aor.tiff')
# 
# 
# 
# 
# # 00-50: wave1 vs wave2	  1.26	1.08	1.47
# # 50-75: wave1 vs wave2	  1.16	1.04	1.3
# # 75-90: wave1 vs wave2	  0.95	0.85	1.06
# # 90-95: wave1 vs wave2	  0.97	0.83	1.14
# # 95-97.5: wave1 vs wave2	0.9	  0.73	1.11
# # 97.5-99: wave1 vs wave2	0.59	0.48	0.71
# # 99-100: wave1 vs wave2	0.77	0.6	  1
# 
# 
# order <- c(1,2,3,4,5,6,7)
# aor <- c  (1.26,1.16,0.95,0.97,0.9,0.59,0.77)
# lower <- c(1.08,1.04,0.85,0.83,0.73,0.48,0.6)
# upper <- c(1.47,1.3,1.06,1.14,1.11,0.71,1)
# data <- cbind(order, aor)
# data <- cbind(data, lower)
# data <- cbind(data, upper)
# data <- as.data.frame(data)
# 
# cohort_labels=c('<50%',
#                 '50%-75%',
#                 '75%-90%',
#                 '90%-95%',
#                 '95%-97.5%',
#                 '97.5%-99%',
#                 '99%+')
# 
# ggplot(data=data, aes(x=order, y=aor))+
#   geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
#   geom_point(size=4,shape=15)+
#   geom_hline(yintercept=1)+
#   xlab("Surge Index Category,\nWave 1 (March-May) vs Wave 2 (June-August)")+
#   ylab("Adjusted Odds Ratio of Mortality")+
#   scale_x_continuous(labels=cohort_labels, breaks=c(1:7))+
#   scale_color_nejm()+
#   theme(plot.background = element_blank(),
#         panel.background = element_blank(),
#         axis.line = element_line(),
#         legend.position = 'none')
# ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/wave vs surge model v2 aor.tiff')
# 
# 


lnsurge_aordata <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/lnsurge_aor_sub_v2.csv')
lnsurge_aordata3a <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/lnsurge_aor_sub_3a.csv')
lnsurge_aordata3b <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/lnsurge_aor_sub_3b.csv')
lnsurge_aordata3c <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/lnsurge_aor_sub_3c.csv')



axis_labels <- c(expression(paste('Low Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 expression(paste('Medium Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 expression(paste('High Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 expression(paste('Low Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 expression(paste('Medium Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 expression(paste('High Non-COVID Admissions'^{"f"},', Log Surge Index')),
                 
                 expression(paste('Low Previous Month Surge'^{"e"},', Log Surge Index')),
                 expression(paste('Medium Previous Month Surge'^{"e"},', Log Surge Index')),
                 expression(paste('High Previous Month Surge'^{"e"},', Log Surge Index')),
                 expression(paste('Low Previous Month Surge'^{"e"},', Log Surge Index')),
                 expression(paste('Medium Previous Month Surge'^{"e"},', Log Surge Index')),
                 expression(paste('High Previous Month Surge'^{"e"},', Log Surge Index')),
                 
                 expression(paste('Mechanical Ventilation'^"d",', Log Surge Index')), 
                 expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"},', Log Surge Index')), 
                 expression(paste('Acute Respiratory Failure POA'^{"a"},', Log Surge Index')), 
                 expression(paste('No Indicators of Acute Respiratory Failure POA, Log Surge Index')),
                 expression(paste('Mechanical Ventilation'^"d",', Log Surge Index')), 
                 expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"},', Log Surge Index')), 
                 expression(paste('Acute Respiratory Failure POA'^{"a"},', Log Surge Index')), 
                 expression(paste('No Indicators of Acute Respiratory Failure POA, Log Surge Index')),
                 # expression(paste('West Region, Log Surge Index')),
                 # expression(paste('South Region, Log Surge Index')),
                 # expression(paste('Northeast Region, Log Surge Index')),
                 # expression(paste('Midwest Region, Log Surge Index')),
                 # expression(paste('West Region, Log Surge Index')),
                 # expression(paste('South Region, Log Surge Index')),
                 # expression(paste('Northeast Region, Log Surge Index')),
                 # expression(paste('Midwest Region, Log Surge Index')),
                 # expression(paste('Previous Month Surge, Log Surge Index')), 
                 # expression(paste('Previous Month Surge, Log Surge Index')),
                 expression(paste('Log Surge Index')), 
                 expression(paste('Log Surge Index')), 
                 expression(paste('Log Surge Index')))  





ggplot(data=lnsurge_aordata, aes(x=order, y=aor, color=wave, fill=wave))+
  geom_point(size=4, shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.5, size=1)+
  geom_hline(yintercept = 1, linetype='dashed')+
  geom_vline(xintercept = c(7.5,14.5,23.5,26.5))+
  annotate('text', x=27.8, y=1.05, hjust=0.08, size=3,
           label=expression(paste(bold('Effect of Continuous Log Surge Index'))))+
  annotate('text', x=25.8, y=1.05, hjust=0.08, size=3, 
           label=expression(paste(bold('Effect of Month of Admission'))))+
  annotate('text', x=22.8, y=1.05, hjust=0.08, size=3,
           label=expression(paste(bold('Effect of Severity Indicators of COVID-19 Respiratory Failure'))))+
    annotate('text', x=13.8, y=1.05, hjust=0.08, size=3,
           label=expression(paste(bold("Effect of Duration of Hospital COVID-19 Surge"))))+
  annotate('text', x=6.8, y=1.05, hjust=0.08, size=3,
           label=expression(paste(bold("Effect of Non-COVID Caseload"))))+
  # annotate('text', x=7, y=1.05, hjust=0.08, size=3,
  #          label=expression(paste(bold("Effect of Hospital Month's 2019:2020 Non-COVID-19 Caseload"))))+
  # annotate(geom = "point", y = 1.1, x = 19, size = 2, shape = 8) +
  # annotate(geom = "point", y = 1.1, x = 20, size = 2, shape = 8) +
  # annotate(geom = "point", y = 1.1, x = 21, size = 2, shape = 8) +
  xlab('')+
  ylab('Adjusted Odds Ratio of Mortality')+
  scale_x_continuous(labels=axis_labels, limits=c(0.5,28), 
                     breaks=c(1:6, 8:13, 15:22, 24:25, 27))+
  scale_y_continuous(limits=c(0.9,1.6))+
  scale_color_jama(name='Month of Admission', labels=c('March-August', 'March-May','June-August'))+
  scale_fill_jama(name='Month of Admission', labels=c('March-August', 'March-May','June-August'))+
  coord_flip()+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        legend.key = element_blank(),
        legend.title = element_text(size=10),
        legend.text = element_text(size=8)) 

ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3 Total.tiff')





axis_labels3a <- c(expression(paste('Mechanical Ventilation'^"d")), 
                 expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"})), 
                 expression(paste('Acute Respiratory Failure POA'^{"a"})), 
                 expression(paste('No Indicators of Acute Respiratory Failure POA')),
                 expression(paste('Mechanical Ventilation'^"d")), 
                 expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"})), 
                 expression(paste('Acute Respiratory Failure POA'^{"a"})), 
                 expression(paste('No Indicators of Acute Respiratory Failure POA')),
                 expression(paste('June-August')), 
                 expression(paste('March-May'))) 
                   

ggplot(data=lnsurge_aordata3a, aes(x=order, y=aor, color=wave, fill=wave))+
  geom_point(size=4, shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.5, size=1)+
  geom_hline(yintercept = 1, linetype='dashed')+
  geom_vline(xintercept =9.5)+
  annotate('text', x=11.8, y=1.05, hjust=0.08, size=3.5, 
           label=expression(paste(bold('Effect of Month of Admission'))))+
  annotate('text', x=8.8, y=1.05, hjust=0.08, size=3.5,
           label=expression(paste(bold('Effect of Severity Indicators of COVID-19 Respiratory Failure'))))+
  annotate('text', x=12, y=0.9, hjust=0.5, size=5, label=expression(paste('[A]')))+
  annotate('text', x=6.5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.0014')))+
  annotate('text', x=2.5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.1644')))+
  annotate('text', x=10.5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.003')))+
  xlab('')+
  ylab('Adjusted Odds Ratio of Mortality')+
  scale_x_continuous(labels=axis_labels3a, limits=c(0.5,12), 
                     breaks=c(1:8, 10:11))+
  scale_y_continuous(limits=c(0.9,1.7), breaks=c(1,1.2,1.4,1.6))+
  scale_color_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  scale_fill_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  coord_flip()+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        legend.key = element_blank(),
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        legend.position = 'bottom') 

ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3a Total.tiff')



axis_labels3b <- c(expression(paste('Low Previous Month Surge'^{"e"})),
                 expression(paste('Medium Previous Month Surge'^{"e"})),
                 expression(paste('High Previous Month Surge'^{"e"})),
                 expression(paste('Low Previous Month Surge'^{"e"})),
                 expression(paste('Medium Previous Month Surge'^{"e"})),
                 expression(paste('High Previous Month Surge'^{"e"})),
                 expression(paste('June-August')), 
                 expression(paste('March-May')))

ggplot(data=lnsurge_aordata3b, aes(x=order, y=aor, color=wave, fill=wave))+
  geom_point(size=4, shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.5, size=1)+
  geom_hline(yintercept = 1, linetype='dashed')+
  geom_vline(xintercept =7.5)+
  annotate('text', x=9.8, y=1.05, hjust=0.08, size=3.5, 
           label=expression(paste(bold('Effect of Month of Admission'))))+
  annotate('text', x=6.8, y=1.05, hjust=0.08, size=3.5,
           label=expression(paste(bold('Effect of Duration of Hospital COVID-19 Surge'))))+
  annotate('text', x=10, y=0.9, hjust=0.08, size=5, label=expression(paste('[B]')))+
  annotate('text', x=2, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.0153')))+
  annotate('text', x=5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.7689')))+
  annotate('text', x=8.5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.003')))+
  xlab('')+
  ylab('Adjusted Odds Ratio of Mortality')+
  scale_x_continuous(labels=axis_labels3b, limits=c(0.5,10), 
                     breaks=c(1:6, 8:9))+
  scale_y_continuous(limits=c(0.9,1.7), breaks=c(1,1.2,1.4,1.6))+
  scale_color_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  scale_fill_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  coord_flip()+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        legend.key = element_blank(),
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        legend.position = 'bottom') 

ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3b Total.tiff')


axis_labels3c <- c(expression(paste('Low Non-COVID Volume'^{"f"})),
                 expression(paste('Medium Non-COVID Volume'^{"f"})),
                 expression(paste('High Non-COVID Volume'^{"f"})),
                 expression(paste('Low Non-COVID Volume'^{"f"})),
                 expression(paste('Medium Non-COVID Volume'^{"f"})),
                 expression(paste('High Non-COVID Volume'^{"f"})),
                 expression(paste('June-August')), 
                 expression(paste('March-May')))

ggplot(data=lnsurge_aordata3c, aes(x=order, y=aor, color=wave, fill=wave))+
  geom_point(size=4, shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.5, size=1)+
  geom_hline(yintercept = 1, linetype='dashed')+
  geom_vline(xintercept =7.5)+
  annotate('text', x=9.8, y=1.05, hjust=0.08, size=3.5, 
           label=expression(paste(bold('Effect of Month of Admission'))))+
  annotate('text', x=6.8, y=1.05, hjust=0.08, size=3.5,
           label=expression(paste(bold('Effect of Non-COVID Caseload'))))+
  annotate('text', x=10, y=0.9, hjust=0.08, size=5, label=expression(paste('[C]')))+
  annotate('text', x=2, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.1778')))+
  annotate('text', x=5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.8957')))+
  annotate('text', x=8.5, y=1.59, hjust=0.08, size=3.5, label=expression(paste('p-value=0.003')))+
  xlab('')+
  ylab('Adjusted Odds Ratio of Mortality')+
  scale_x_continuous(labels=axis_labels3c, limits=c(0.5,10), 
                     breaks=c(1:6, 8:9))+
  scale_y_continuous(limits=c(0.9,1.7), breaks=c(1,1.2,1.4,1.6))+
  scale_color_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  scale_fill_jama(name='Month of Admission', labels=c('March-May','June-August'))+
  coord_flip()+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        legend.key = element_blank(),
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        legend.position = 'bottom') 

ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3c Total.tiff')





y <-   c(1.1415,1.2876,1.5747,1.6952,1.8572,2.3029)
x <- c( 2.604626,  5.500042, 10.330439, 15.348629, 25.868704,62.344223)
data <- cbind(x,y)
data <- as.data.frame(data)
ggplot(data=data, aes(x=x, y=y))+
  geom_point(size=3)+
  geom_smooth(method = "lm")+
  scale_x_log10()+
  scale_y_log10()




# inpat20v4 <- readRDS("I:/Sarah Warner/Premier Data/working files/inpat20v4.RData")
# 
# drug_data2 <- analysis_data %>% 
#   group_by(ADM_MON, surge_cat) %>% 
#   summarise(n=n_distinct(PAT_KEY),
#             n_rem=sum(remdesivir_adm2),
#             n_steroid=sum(steroid_adm2),
#             perc_rem=n_rem/n,
#             perc_steroid=n_steroid/n)
# 
# ggplot(data=drug_data2[drug_data2$perc_rem>0,],aes(x=as.factor(ADM_MON), y=perc_rem, color=surge_cat, group=surge_cat))+
#   #facet_grid(vars(surge_cat))+
#   geom_line()+
#   geom_point()+
#   scale_y_continuous(labels=scales::percent)
#   
# ggplot(data=drug_data2[drug_data2$perc_rem>0,],aes(x=as.factor(ADM_MON), y=perc_steroid, color=surge_cat, group=surge_cat))+
#   #facet_grid(vars(surge_cat))+
#   geom_line()+
#   geom_point()+
#   scale_y_continuous(labels=scales::percent)
# 
# 
# total_data_covid <- total_data_covid %>% 
#   mutate(grade_new=case_when(grade_day02==3~4,
#                              grade_day02==2~3,
#                              acute_resp_fail_poa==1~2,
#                              TRUE~1))
# total_data_covid <- total_data_covid %>% 
#   mutate(steroid_adm=case_when(PAT_KEY %in% inpat20v3[inpat20v3$steroid_adm2==1,]$PAT_KEY~1, TRUE~0))


# drug_data3 <- analysis_data %>% 
#   group_by(ADM_MON, surge_cat, grade_new) %>% 
#   summarise(n=n_distinct(PAT_KEY),
#             n_rem=sum(remdesivir_adm2),
#             n_steroid=sum(steroid_adm2),
#             perc_rem=n_rem/n,
#             perc_steroid=n_steroid/n) 
# drug_data3$grade_new <- factor(drug_data3$grade_new, levels = c(1,2,3,4), 
#                   labels = c('Uncomplicated','Acute Respiratory\nFailure Code POA',
#                              'NIPPV or\nICU Admission','Mechanical Ventilation')) 

drug_data4 <- analysis_data %>% 
  mutate(cat_new=case_when(covid_surgeindex_percent_grps=='00-50'~'<50%',
                           covid_surgeindex_percent_grps=='50-75'~'50%-75%',
                           covid_surgeindex_percent_grps=='75-90'~'75%-90%',
                           TRUE~'90%+')) %>% 
  group_by(ADM_MON, cat_new, grade_new) %>% 
  summarise(n=n_distinct(PAT_KEY),
            n_rem=sum(remdesivir_adm2),
            n_steroid=sum(steroid_adm2),
            n_hydroxy=sum(hydroxychl_adm),
            perc_rem=n_rem/n,
            perc_steroid=n_steroid/n,
            perc_hydroxy=n_hydroxy/n) 
drug_data4$grade_new <- factor(drug_data4$grade_new, levels = c(1,2,3,4), 
                  labels = c('No Indicators of Acute\nRespiratory Failure POA',
                             'Acute Respiratory\nFailure POA',
                             'NIPPV or ICU Admission',
                             'Mechanical Ventilation')) 
drug_data4$cat_new <- factor(drug_data4$cat_new, levels=c('90%+','75%-90%','50%-75%','<50%'))

facet_labels <- data.frame(label=c('No Indicators of Acute\nRespiratory Failure POA',
                             'Acute Respiratory\nFailure POA',
                             'NIPPV or ICU Admission',
                             'Mechanical Ventilation'))


ggplot(data=drug_data4[drug_data4$perc_rem>0,],aes(x=as.factor(ADM_MON), y=perc_rem, 
                                                   color=cat_new, group=cat_new))+
  facet_grid(cols=vars(as.factor(grade_new)))+ #,labeller=labeller(grade_new=legend_labels))+
  geom_line()+
  geom_point(size=2)+
  #geom_hline(yintercept = -0.1)+
  scale_y_continuous(labels=scales::percent,name='Percent Receiving Remdesivir')+
  scale_x_discrete(labels=c('March','April','May','June','July','August'),name='Admission Month')+
  scale_color_jama(name='Surge Index Category')+
  guides(color = guide_legend(override.aes = list(size = 2)))+
  #annotate(geom='text',y=0.6,x='2020205',label=c('No Indicators of Acute Respiratory Failure POA'))+
  #geom_text(data=facet_labels, mapping = aes(x=-Inf, y=-Inf, label=label), hjust=-0.1, vjust=-1)+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        strip.background = element_blank(),
        strip.text = element_text(size=8),
        #strip.text = element_blank(),
        legend.title = element_text(size=8),
        legend.text = element_text(size=8),
        legend.position = 'top')  
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 4a.tiff')
  
ggplot(data=drug_data4[drug_data4$perc_steroid>0,],aes(x=as.factor(ADM_MON), y=perc_steroid, 
                                                       color=cat_new, group=cat_new))+
  facet_grid(cols=vars(as.factor(grade_new)))+ 
  geom_line()+
  geom_point(size=2)+
  #geom_vline(xintercept = 7)+
  scale_y_continuous(labels=scales::percent,name='Percent Receiving Corticosteroids')+
  scale_x_discrete(labels=c('March','April','May','June','July','August'),name='Admission Month')+
  scale_color_jama(name='Surge Index Category')+
  guides(color = guide_legend(override.aes = list(size = 2)))+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        strip.background = element_blank(),
        strip.text = element_text(size=8),
        #strip.text = element_blank(),
        legend.title = element_text(size=8),
        legend.text = element_text(size=8),
        legend.position = 'top',
       # panel.border = element_rect(),
        panel.ontop = F)  
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 4b.tiff')

ggplot(data=drug_data4[drug_data4$perc_hydroxy>0,],aes(x=as.factor(ADM_MON), y=perc_hydroxy, 
                                                   color=cat_new, group=cat_new))+
  facet_grid(cols=vars(as.factor(grade_new)))+ #,labeller=labeller(grade_new=legend_labels))+
  geom_line()+
  geom_point(size=2)+
  #geom_hline(yintercept = -0.1)+
  scale_y_continuous(labels=scales::percent,name='Percent Receiving Hydroxychloroquine')+
  scale_x_discrete(labels=c('March','April','May','June','July','August'),name='Admission Month')+
  scale_color_jama(name='Surge Index Category')+
  guides(color = guide_legend(override.aes = list(size = 2)))+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank(),
        axis.text = element_text(size=8),
        axis.title = element_text(size=10),
        strip.background = element_blank(),
        strip.text = element_text(size=8),
        #strip.text = element_blank(),
        legend.title = element_text(size=8),
        legend.text = element_text(size=8),
        legend.position = 'top')  
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 4c.tiff')


#write.csv(drug_data3, "I:/Sarah Warner/Premier Data/drug_data_grade.csv")


analysis_data_new <- analysis_data %>%
  mutate(anyvent=case_when(PAT_KEY %in% inpat20v3[inpat20v3$anyvent==1,]$PAT_KEY~"Vent", TRUE~"No Vent"))
# 
# drug_data4 <- analysis_data_new %>% 
#   group_by(ADM_MON, surge_cat, grade_new, anyvent) %>% 
#   summarise(n=n_distinct(PAT_KEY),
#             n_rem=sum(remdesivir_adm2),
#             n_steroid=sum(steroid_adm2),
#             perc_rem=n_rem/n,
#             perc_steroid=n_steroid/n)
# 
# ggplot(data=drug_data4[drug_data4$perc_rem>0,],aes(x=as.factor(ADM_MON), y=perc_rem, color=surge_cat, group=surge_cat))+
#   facet_grid(rows=vars(grade_new), cols=vars(anyvent))+
#   geom_line()+
#   geom_point()+
#   scale_y_continuous(labels=scales::percent)
#   
# ggplot(data=drug_data4[drug_data4$perc_rem>0,],aes(x=as.factor(ADM_MON), y=perc_steroid, color=surge_cat, group=surge_cat))+
#   facet_grid(rows=vars(grade_new), cols=vars(anyvent))+
#   geom_line()+
#   geom_point()+
#   scale_y_continuous(labels=scales::percent)
# 
# write.csv(drug_data4, "I:/Sarah Warner/Premier Data/drug_data_grade_vent.csv")
# 
# View(drug_data4)
# 

crude_mortality_percent <- analysis_data %>% 
  group_by(ADM_MON, covid_surgeindex_percent_grps) %>% 
  summarise(mort_rate=(sum(death)/n_distinct(PAT_KEY))*100) %>% 
  pivot_wider(id_cols=ADM_MON,
              names_from=covid_surgeindex_percent_grps,
              values_from=mort_rate)
crude_mortality_count <- analysis_data %>% 
  group_by(ADM_MON, covid_surgeindex_percent_grps) %>% 
  summarise(deaths=sum(death)) %>% 
  pivot_wider(id_cols=ADM_MON,
              names_from=covid_surgeindex_percent_grps,
              values_from=deaths)



crude_mortality <- analysis_data %>% 
  group_by(ADM_MON, covid_surgeindex_percent_grps, wave) %>% 
  summarise(mort_rate=sum(death)/n_distinct(PAT_KEY))
ggplot(data=crude_mortality)+
  geom_point(aes(x=as.factor(ADM_MON), y=mort_rate, color=covid_surgeindex_percent_grps), stat='identity',size=2)+
  geom_line(aes(x=as.factor(ADM_MON), y=mort_rate, color=covid_surgeindex_percent_grps, 
                group=covid_surgeindex_percent_grps),size=1)+
  scale_x_discrete(name='Admission Month',labels=c('March','April','May','June','July','August'))+
  scale_y_continuous(labels=scales::percent, name='Crude Mortality Rate', limits=c(0.0,0.30), 
                     breaks=c(0.0,0.1,0.2,0.3))+
  scale_color_jama(name='Surge Index Category',labels=c('<50%','50%-75%','75%-90%','90%-95%','95%-99%','99+%'))+
  # scale_linetype_manual(values=c('solid','solid','solid','dotted','dotted','dotted'),
  #                       name='Surge Index Category',labels=c('<50%','50%-75%','75%-90%','90%-95%','95%-99%','99+%'))+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        legend.key = element_blank(),
        axis.line = element_line(),
        legend.position = 'right')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 3.tiff')



# aor by save and stratum

# 1.0787	0.9320	1.2485
# 1.1747	1.0110	1.3649
# 1.3094	1.0997	1.5590
# 1.3417	1.1239	1.6018
# 1.5230	1.2038	1.9268
# 

order <- c(1,2,3,4,5)
aor <-   c(1.0787,1.1747,1.3094,1.3417,1.5230)
lower <- c(0.9320,1.0110,1.0997,1.129, 1.2038)
upper <- c(1.2485,1.3649,1.5590,1.6018,1.9268)
data <- cbind(order, aor)
data <- cbind(data, lower)
data <- cbind(data, upper)
data <- as.data.frame(data)

cohort_labels=c('50%-75%\nvs <50%',
                '75%-90%\nvs <50%',
                '90%-95%\nvs <50%',
                '95%-99%\nvs <50%',
                '99%+\nvs <50%')

ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4,shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept=1, linetype='dashed')+
  xlab("Surge Index Category")+
  ylab("Adjusted Odds Ratio of Mortality")+
  ggtitle('Admitted March - May 2020')+
  scale_x_continuous(labels=cohort_labels, breaks=c(1:5))+
  scale_y_continuous(limits=c(0.9,3.6), breaks=c(1,2,3), labels=c('1.0','2.0','3.0'))+
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=10),
        axis.title = element_text(size=12))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3e.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 4c.tiff')


# 1.1636	1.0235	1.323
# 1.4976	1.2826	1.7487
# 1.6864	1.4299	1.9888
# 1.9813	1.6486	2.3812
# 2.811	2.2219	3.5563

order <- c(1,2,3,4,5)
aor <-   c(1.1636,1.4976,1.6864,1.9813,2.811 )
lower <- c(1.0235,1.2826,1.4299,1.6486,2.2219)
upper <- c(1.323 ,1.7487,1.9888,2.3812,3.5563)
data <- cbind(order, aor)
data <- cbind(data, lower)
data <- cbind(data, upper)
data <- as.data.frame(data)

cohort_labels=c('50%-75%\nvs <50%',
                '75%-90%\nvs <50%',
                '90%-95%\nvs <50%',
                '95%-99%\nvs <50%',
                '99%+\nvs <50%')

ggplot(data=data, aes(x=order, y=aor))+
  geom_point(size=4,shape=15)+
  geom_errorbar(aes(ymin=lower,ymax=upper), width=0.2, size=1)+
  geom_hline(yintercept=1, linetype='dashed')+
  xlab("Surge Index Category")+
  ylab("Adjusted Odds Ratio of Mortality")+
  ggtitle('Admitted June - August 2020')+
  scale_x_continuous(labels=cohort_labels, breaks=c(1:5))+
  scale_y_continuous(limits=c(0.9,3.6), breaks=c(1,2,3), labels=c('1.0','2.0','3.0'))+  
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=10),
        axis.title = element_text(size=12))
#ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3f.tiff')
ggsave('I:/Sarah Warner/Figures for Kelly/Hosp Mort Variation - Annals Resubmit/Fig 4d.tiff')



#### models ####

lmer(formula, data = NULL, REML = TRUE, control = lmerControl(),
     start = NULL, verbose = 0L, subset, weights, na.action,
     offset, contrasts = NULL, devFunOnly = FALSE)



saveRDS(inpat20v3, 'I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')
saveRDS(total_data_covid, 'I:/Sarah Warner/Premier Data/working files/total_data_covid.RData')


inpat20v3 <- readRDS('I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')
total_data_covid <- readRDS('I:/Sarah Warner/Premier Data/working files/total_data_covid.RData')

inpat20v3 <- inpat20v3 %>% 
  mutate(cdc_liverfail_cirrhosis=case_when(cirrhosis_poa==1~1,
                                           elix_Liver==1~1,
                                           TRUE~0),
         cdc_heartdx=case_when(heart_fail_poa==1~1,
                               elix_CHF==1~1,
                               elix_Arrhythmia==1~1,
                               TRUE~0),
         cdc_hypertension=case_when(elix_HTN==1~1,
                                    TRUE~0),
         cdc_neurodx=case_when(elix_NeuroOther==1~1,
                               TRUE~0)) %>% 
  rename(cdc_cancer=cancer_poa,
         cdc_ckd=ckd_stage3_poa,
         cdc_copd=copd_poa,
         cdc_immunocomp=immunocomp_poa2,
         cdc_obese_overweight=obese_overweight_poa,
         cdc_pregnant=pregnant_poa,
         cdc_sickle_cell=sickle_cell_poa,
         cdc_diabetes=diabetes_poa,
         cdc_asthma=asthma_poa,
         cdc_cystic_fibrosis=cystic_fibrosis_poa,
         cdc_interst_lungdx=interstitial_lung_dx_poa,
         cdc_thalassemia=thalassemia_poa,
         cdc_cerebrovascular=cerebrovascular_poa)



analysis_data <- subset(inpat20v3, inpat20v3$PAT_KEY %in% total_data_covid$PAT_KEY)
analysis_data <- analysis_data %>% 
  select("PAT_KEY", "MEDREC_KEY", "DISC_MON", "DISC_MON_SEQ", "ADM_MON", "PROV_ID", "age_cat5",
"GENDER", "race4", "death", "LOS", "adm_src2", "adm_type2", "payor_new", "acute_resp_fail_poa",
"renal_fail_poa", "hepatic_fail_poa", "hematologic_fail_poa", "metabolic_fail_poa", "neurologic_fail_poa", 
"vaso_02", "remdesivir_adm2", "remdesivir_hosp", "steroid_adm2", "hydroxychl_azithro_adm", "azithro_adm", 
"hydroxychl_adm", "dnr_poa", "elixhauser_score", "URBAN_RURAL", "TEACHING", "BEDS_GRP", "PROV_REGION", 
"vent_vol19", "vent_vol20", "medicaid_vol19", "medicaid_vol20", "beam_therapy_hosp", "nonrenaltx_hosp",
"ecmo_hosp", "heartcath_hosp", "pat_per_attend20", "icuventprop_covid", "covid_test_bill", "ratio_noncovid_20v19", "acute_discharge",   "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx","cdc_cancer",
"cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight","cdc_pregnant","cdc_sickle_cell","cdc_diabetes",
"cdc_asthma","cdc_cystic_fibrosis","cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular")

analysis_data2 <- total_data_covid %>% 
  select("PAT_KEY","crrt_hosp","perc_uninsured","remdes_hosp_month","SurgeIndexImputed", "surge_cat", 
         "wave", "n_icu2", "grade_new",'trach')
         
analysis_data <- left_join(analysis_data, analysis_data2)

write.csv(analysis_data, "I:/Sarah Warner/Data for Yusuf/analysis_dataset.csv")
         
write.csv(analysis_data[,c(1,2,21,24,47,48)], "I:/Sarah Warner/Data for Yusuf/analysis_newvar.csv")
         
inpat20v3_covid <- subset(inpat20v3, inpat20v3$covid==1 &
                            inpat20v3$ADM_MON %in% c('2020103','2020204','2020205','2020206',
                                                     '2020307','2020308'))
write.csv(inpat20v3_covid[,c(1,2,157,47,158,159)], "I:/Sarah Warner/Data for Yusuf/analysis_newvar_allcovid.csv")
         
analysis_data <- fread("I:/Sarah Warner/Data for Yusuf/analysis_dataset.csv")



analysis_data <- analysis_data %>% 
  mutate(any_nippv=case_when(PAT_KEY %in% inpat20v3[inpat20v3$highrisknippv==1,]$PAT_KEY~1, TRUE~0),
         any_icu=case_when(PAT_KEY %in% icu_day20v3$PAT_KEY~1, TRUE~0),
         any_icuvent=case_when(PAT_KEY %in% icu_vent$PAT_KEY~1, TRUE~0))

cro(analysis_data$any_nippv)
cro(analysis_data$any_icu)
cro(analysis_data$any_icuvent)








#### demo tables for manuscript ####



saveRDS(analysis_data, "I:/Sarah Warner/Premier Data/analysis_data_1.27.21.RData")
saveRDS(inpat20v3, "I:/Sarah Warner/Premier Data/inpat20v3.RData")
saveRDS(total_data_covid, "I:/Sarah Warner/Premier Data/total_data_covid.RData")
         
analysis_data <- readRDS("I:/Sarah Warner/Premier Data/analysis_data_1.27.21.RData")
inpat20v3 <- readRDS("I:/Sarah Warner/Premier Data/inpat20v3.RData")
         
         

demo <- CreateTableOne(data=analysis_data, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death','surge_cat',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death','surge_cat',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"))
demo_print <- print(demo_wave,
                         nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))
write.csv(demo_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/demo table.csv')



demo_surge <- CreateTableOne(data=analysis_data, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death','wave',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm","dnr_poa",
                                    "grade_new",'death','wave',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"),
                             strata='covid_surgeindex_percent_grps')
demo_surge_print <- print(demo_surge,
                         nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))



demo_wave_surge <- CreateTableOne(data=analysis_data, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",'PROV_REGION',
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",'PROV_REGION',
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"),
                             strata=c('covid_surgeindex_percent_grps','wave'))
demo_wave_surge_print <- print(demo_wave_surge,
                         nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))
write.csv(demo_wave_surge_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/demo_wave_surge.csv')



demo_wave_surge2 <- CreateTableOne(data=analysis_data2, 
                             vars=c('adm_src2','vaso_02','hydroxychl_adm','azithro_adm','hydroxychl_azithro_adm',
                                    'death_hospice','Tech_Index_v2'),
                             factorVars=c('adm_src2','vaso_02','hydroxychl_adm','azithro_adm','hydroxychl_azithro_adm',
                                    'death_hospice','Tech_Index_v2'),
                             strata=c('covid_surgeindex_percent_grps','wave'))
demo_wave_surge_print2 <- print(demo_wave_surge2)
write.csv(demo_wave_surge_print2, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/demo_wave_surge2.csv')


         
         
demo_month_surge <- CreateTableOne(data=analysis_data, 
                             vars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                    "elixhauser_score", 
                                    "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",'PROV_REGION',
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp","vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"),
                             factorVars=c("age_cat5","GENDER","race4","adm_type2", "payor_new",
                                          "cdc_liverfail_cirrhosis","cdc_heartdx","cdc_hypertension","cdc_neurodx",
                                    "cdc_cancer","cdc_ckd","cdc_copd","cdc_immunocomp","cdc_obese_overweight",
                                    "cdc_pregnant","cdc_sickle_cell","cdc_diabetes","cdc_asthma","cdc_cystic_fibrosis",
                                    "cdc_interst_lungdx","cdc_thalassemia","cdc_cerebrovascular",
                                    "acute_resp_fail_poa","renal_fail_poa",
                                    "hepatic_fail_poa","hematologic_fail_poa","metabolic_fail_poa",
                                    "neurologic_fail_poa","remdesivir_adm2","steroid_adm2","dnr_poa",
                                    "grade_new",'death',
                                    "BEDS_GRP","TEACHING","URBAN_RURAL",'PROV_REGION',
                                    "n_icu2","ecmo_hosp","crrt_hosp","heartcath_hosp",
                                    "remdesivir_hosp"),
                             strata=c('surge_cat','ADM_MON'), na.rm=F)
demo_month_surge_print <- print(demo_month_surge,
                         nonnormal=c('elixhauser_score',"vent_vol19","medicaid_vol19",
                                    "medicaid_vol20","pat_per_attend20","perc_uninsured"))
write.csv(demo_month_surge_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/demo_month_surge.csv')
         
month_surge_region <- CreateTableOne(data=analysis_data, 
                             vars='PROV_REGION',
                             factorVars='PROV_REGION',
                             strata=c('surge_cat','ADM_MON'))
month_surge_region_print <- print(month_surge_region)
write.csv(month_surge_region_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/month_surge_region.csv')



los <- CreateTableOne(data=analysis_data, 
                             vars=c('LOS'),
                             strata=c('covid_surgeindex_percent_grps','wave'))
los_print <- print(los, nonnormal = 'LOS')
write.csv(los_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/los_wave_surge.csv')


analysis_data$age_cat5 <- factor(analysis_data$age_cat5, levels=c('<25','25-34','35-44','45-54','55-64','65-74','75-84','85+'))

age_dnr <- CreateTableOne(data=analysis_data,
                          vars='dnr_poa',
                          factorVars = 'dnr_poa',
                          strata=c('covid_surgeindex_percent_grps','wave', 'age_cat5'))
age_dnr_print <- print(age_dnr)
write.csv(age_dnr_print, 'I:/Sarah Warner/Premier Data/Hosp Mort Variation/age_dnr_wave_surge.csv')



analysis_data <- left_join(analysis_data, inpat20v3[,c(1,2,16)])


analysis_data2 <- left_join(analysis_data, analysis_data_new)

# how many covid patients were readmitted

inpat20v3 <- inpat20v3 %>% 
  mutate(covid_pat=case_when(MEDREC_KEY %in% analysis_data$MEDREC_KEY~1, TRUE~0))


describe(inpat20v3[inpat20v3$covid_pat==1,]$MEDREC_KEY)
#144116 patients
describe(inpat20v3[inpat20v3$covid_pat==1,]$PAT_KEY)
#167710
readmits <- inpat20v3 %>% 
  filter(covid_pat==1 & ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308')) %>% 
  group_by(MEDREC_KEY) %>% 
  summarise(n_enc=n_distinct(PAT_KEY))
cro(readmits$n_enc)

readmits2 <- inpat20v3 %>% 
  filter(covid_pat==1 & ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') & covid==1) %>% 
  group_by(MEDREC_KEY) %>% 
  summarise(n_enc=n_distinct(PAT_KEY))
cro(readmits2$n_enc)



hosp_count <- analysis_data %>% 
  group_by(wave, surge_cat) %>% 
  summarise(n_hosp=n_distinct(PROV_ID))

inpat20v3 <- inpat20v3 %>% 
  mutate(icu=case_when(icu_or_nippv_day02==1 & highrisknippv_day02==0~1, TRUE~0))
analysis_data <- analysis_data %>% 
  mutate(icu=case_when(PAT_KEY %in% inpat20v3[inpat20v3$icu==1,]$PAT_KEY~1, TRUE~0),
         nippv=case_when(PAT_KEY %in% 
                           inpat20v3[inpat20v3$highrisknippv_day02==1,]$PAT_KEY~1, TRUE~0),
         icuvent=case_when(PAT_KEY %in% inpat20v3[inpat20v3$icuvent_day02==1,]$PAT_KEY~1, TRUE~0),
         hosp_month=paste(PROV_ID, ADM_MON, sep='_'))

hosp_count2 <- analysis_data %>% 
  group_by(hosp_month) %>% 
  summarise(n_icu=sum(icu),
            n_nippv=sum(nippv),
            n_icu=sum(icuvent),
            n_remdesivir_hosp=sum(remdesivir_hosp),
            n_covid_test=sum(covid_test_bill),
            n_pat_dr=pat_per_attend20)































cro(analysis_data$adm_src2, analysis_data$surge_cat, analysis_data$wave)



analysis_data$surge_cat <- factor(analysis_data$surge_cat, 
                                  levels=c('<50%','50%-75%','75%-90%','90%-95%','95%-97.5%','97.5%-99%','99%+'))
analysis_data$Tech_Index_v2 <- factor(analysis_data$Tech_Index_v2, 
                                  levels=c('HighTech','MedHighTech','MedLowTech','LowTech'))

cro(analysis_data[analysis_data$wave=='wave 1',]$surge_cat, 
    analysis_data[analysis_data$wave=='wave 1',]$Tech_Index_v2)




cro(analysis_data[analysis_data$wave=='wave 2' & analysis_data$n_icu2=='single',]$surge_cat, 
    analysis_data[analysis_data$wave=='wave 2' & analysis_data$n_icu2=='single',]$crrt_hosp)

cro(analysis_data[analysis_data$wave=='wave 1' & analysis_data$n_icu2=='single',]$surge_cat, 
    analysis_data[analysis_data$wave=='wave 1' & analysis_data$n_icu2=='single',]$vaso_02)





#### interaction graphs ####

model3 <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model3 interaction.csv')


ggplot()+
  geom_ribbon(data=model3[model3$group!='both' & model3$lnsurge!=-10,],
              aes(ymin=lower, ymax=upper, x=lnsurge, group=group, fill=group), alpha=0.4)+
  geom_line(data=model3[model3$group!='both' & model3$lnsurge!=-10,],aes(x=lnsurge,y=aor,group=group,color=group,linetype=group), size=1.25)+
  # geom_ribbon(data=model3[model3$group=='both',],aes(ymin=lower, ymax=upper, x=lnsurge, group=group, fill=group), alpha=0.15)+
  # geom_line(data=model3[model3$group=='both',],aes(x=lnsurge,y=aor,group=group,color=group), size=1, linetype='dashed')+
  scale_fill_manual( values=c(#'#374E5599',
    '#DF8F44FF','#00A1D5FF'),labels=c(#'March-August',
      'March-May','June-August'),name='Admission Month')+
  scale_color_manual(values=c(#'#374E5599',
    '#DF8F44FF','#00A1D5FF'),labels=c(#'March-August',
      'March-May','June-August'),name='Admission Month')+
  scale_linetype_manual(values=c('solid','dotted'),labels=c('March-May','June-August'),name='Admission Month')+
  xlab('Log Surge Index')+
  ylab('Log Odds of Mortality')+
  #ggtitle('Interaction of Log Surge Index and Admission Month')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'right')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3b v2 short.tiff')


ggplot(data=model3)+
  geom_line(aes(x=lnsurge,y=lower, group=group, color=group), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=upper, group=group, color=group), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=aor,group=group,color=group), size=1.25)+
  scale_fill_jama(labels=c('March-May','June-August'),name='Admission Month')+
  scale_color_jama(labels=c('March-May','June-August'),name='Admission Month')+
  xlab('Log Surge Index')+
  ylab('Log Odds of Mortality')+
  ggtitle('Interaction of Log Surge Index and Admission Month')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank())



model4a <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model4a interaction2.csv')
ggplot(data=model4a)+
  geom_ribbon(aes(ymin=lower, ymax=upper, x=lnsurge, group=region, fill=region), alpha=0.5)+
  geom_line(aes(x=lnsurge,y=point,group=region,color=region), size=1)+
  scale_fill_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  scale_color_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Hospital Region, Admissions March-May')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
ggplot(data=model4a)+
  geom_line(aes(x=lnsurge,y=lower, group=region, color=region), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=upper, group=region, color=region), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=point,group=region,color=region), size=1.25)+
  #scale_fill_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  scale_color_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Hospital Region, Admissions June-August')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank())


#model4b <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model4b interaction.csv')
ggplot(data=model4b)+
  geom_ribbon(aes(ymin=lower, ymax=upper, x=lnsurge, group=region, fill=region), alpha=0.5)+
  geom_line(aes(x=lnsurge,y=point,group=region,color=region), size=1)+
  scale_fill_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  scale_color_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Hospital Region, Admissions June-August')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
ggplot(data=model4b)+
  geom_line(aes(x=lnsurge,y=lower, group=region, color=region), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=upper, group=region, color=region), linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=point,group=region,color=region), size=1.25)+
  #scale_fill_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  scale_color_jama(labels=c('Midwest','Northeast','South','West'),name='Hospital Region')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Hospital Region, Admissions June-August')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank())


model5 <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model5 interactions.csv')
legend_labels <- c(expression(paste('Uncomplicated')),
                   expression(paste('Acute Respiratory Failure POA'^{"a"})),
                   expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"})),
                   expression(paste('Mechanical Ventilation'^{"d"})))
ggplot(data=model5)+
  geom_ribbon(aes(ymin=lower, ymax=upper, x=lnsurge, group=group, fill=group), alpha=0.25)+
  geom_line(aes(x=lnsurge,y=beta,group=group,color=group), size=1)+
  scale_fill_jama(labels=legend_labels,name='Severity of Illness')+
  scale_color_jama(labels=legend_labels,name='Severity of Illness')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Severity of Illness')+
  theme(panel.background = element_blank(),
        axis.line = element_line())
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 3b.tiff')


ggplot(data=model5)+
  geom_line(aes(x=lnsurge,y=lower,group=group,color=group),linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=upper,group=group,color=group),linetype='dashed',size=1.25)+
  geom_line(aes(x=lnsurge,y=beta,group=group,color=group), size=1.25)+
  #scale_fill_jama(labels=legend_labels,name='Severity of Illness')+
  scale_color_jama(labels=legend_labels,name='Severity of Illness')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Severity of Illness')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.key = element_blank())



model8a <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model8a interactions.csv')
legend_labels <- c(expression(paste('Uncomplicated')),
                   expression(paste('Acute Respiratory Failure POA'^{"a"})),
                   expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"})),
                   expression(paste('Mechanical Ventilation'^{"d"})))
ggplot(data=model8a)+
  geom_ribbon(aes(ymin=lower, ymax=upper, x=lnsurge, group=group, fill=group), alpha=0.25)+
  geom_line(aes(x=lnsurge,y=beta,group=group,color=group), size=1)+
  scale_fill_jama(labels=legend_labels,name='Severity of Illness')+
  scale_color_jama(labels=legend_labels,name='Severity of Illness')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Severity of Illness, March-May 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'top')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 8a.tiff')


model8b <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/model8b interactions.csv')
legend_labels <- c(expression(paste('Uncomplicated')),
                   expression(paste('Acute Respiratory Failure POA'^{"a"})),
                   expression(paste('NIPPV'^{"b,c"},'or ICU Admission'^{"c"})),
                   expression(paste('Mechanical Ventilation'^{"d"})))
ggplot(data=model8b)+
  geom_ribbon(aes(ymin=lower, ymax=upper, x=lnsurge, group=group, fill=group), alpha=0.25)+
  geom_line(aes(x=lnsurge,y=beta,group=group,color=group), size=1)+
  scale_fill_jama(labels=legend_labels,name='Severity of Illness')+
  scale_color_jama(labels=legend_labels,name='Severity of Illness')+
  xlab('Log Surge Index')+
  ylab('aOR Mortality')+
  ggtitle('Interaction of Log Surge Index and Severity of Illness, June-August 2020')+
  theme(panel.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'top')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/Figure 8b.tiff')








tech_index <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Tech_index_forSarah.csv')
analysis_data <- left_join(analysis_data, tech_index)

cro(analysis_data[analysis_data$wave=='wave 1',]$surge_cat, 
    analysis_data[analysis_data$wave=='wave 1',]$Tech_Index_v2)




analysis_data <- analysis_data %>% 
  mutate(death_hospice=case_when(PAT_KEY %in% inpat20v3[inpat20v3$discharge_status=='deceased',]$PAT_KEY~'deceased',
                                 PAT_KEY %in% inpat20v3[inpat20v3$discharge_status=='hospice',]$PAT_KEY~'hospice',
                                 TRUE~'alive'))




cro(analysis_data[analysis_data$wave=='wave 1',]$surge_cat, 
    analysis_data[analysis_data$wave=='wave 1',]$death_hospice)






hosp_level <- analysis_data %>% 
  filter(!duplicated(PROV_ID, ADM_MON))





### sofa score ####

sofa_score <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/premier_sofa_partial.csv')


sofa_score[is.na(sofa_score)] <- 99

describe(sofa_score[sofa_score$bilirubin_sofa_pts!=99,]$pat_key)
# 11326
describe(sofa_score[sofa_score$bilirubin_sofa_pts==99,]$pat_key)
#6125

describe(sofa_score[sofa_score$creatinine_sofa_pts!=99,]$pat_key)
# 13506
describe(sofa_score[sofa_score$creatinine_sofa_pts==99,]$pat_key)
#3773

describe(sofa_score[sofa_score$platelet_sofa_pts!=99,]$pat_key)
# 14116
describe(sofa_score[sofa_score$platelet_sofa_pts==99,]$pat_key)
#3281





describe(sofa_score[sofa_score$bilirubin_sofa_pts!=99 &
                      sofa_score$creatinine_sofa_pts!=99&
                      sofa_score$platelet_sofa_pts!=99,]$pat_key)
#11134



describe(sofa_score$pat_key)



byday_sofa <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/byday_sofa.csv')

day1sofa <- byday_sofa %>% 
  filter(day_num==1)

otherday <- byday_sofa[!byday_sofa$pat_key %in% day1sofa$pat_key,]
otherdayfirst <- otherday %>% 
  group_by(pat_key) %>% 
  filter(day_num==min(day_num))

day1sofa <- as.data.frame(day1sofa)
otherdayfirst <- as.data.frame(otherdayfirst)
allfirst <- rbind(day1sofa, otherdayfirst)
allfirst_select <- allfirst %>% 
  select(pat_key,bilirubin_sofa_pts,creatinine_sofa_pts,platelet_sofa_pts,
         cardio_sofa_pts,respiratory_sofa_pts,total_score)


analysis_data_select <- analysis_data[analysis_data$PAT_KEY %in% allfirst_select$pat_key,]
analysis_data_select <- left_join(analysis_data_select, allfirst_select, by=c('PAT_KEY'='pat_key'))

describe(analysis_data_select$PROV_ID)

write.csv(analysis_data_select,'I:/Sarah Warner/Data for Yusuf/sofa_subset_all.csv')
write.csv(allfirst_select,'I:/Sarah Warner/Data for Yusuf/sofa_subset_scoreonly.csv')

















analysis_data_new <- left_join(analysis_data_new, inpat20v3[,c(1,2,16)])
describe(analysis_data_new[analysis_data_new$wave=='wave 2',]$AGE)



ggplot(data=analysis_data_new)+
  geom_boxplot(aes(x=AGE, y=wave))+
  geom_count(aes(x=AGE, y=wave),position = position_jitterdodge(seed=1, dodge.width=0.45))



























o2stats <- fread("I:/Sarah Warner/Premier Data/Hosp Mort Variation/cerner O2 variation.csv")
o2stats <- o2stats %>% 
  mutate(any02=case_when(low_oxygen_flow_poa_yn==1~1, 
                         high_oxygen_flow_poa_yn==1~1, 
                         TRUE~0))
o2stats_use <- subset(o2stats, o2stats$any02==1)
cro(o2stats_use$resp_fail_poa_yn,
    o2stats_use$high_oxygen_flow_poa_yn)

    
































saveRDS(analysis_data_new, 'I:/Sarah Warner/Premier Data/working files/hosp_mort_data.RData')
saveRDS(inpat20v3, 'I:/Sarah Warner/Premier Data/working files/inpat20v3.RData')

#### noncovid surge ####

non_covid <- inpat20v3 %>% 
  mutate(any_icu=case_when(PAT_KEY %in% icu_data$PAT_KEY~1, TRUE~0)) %>% 
  filter(PROV_ID %in% analysis_data$PROV_ID &
           ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') &
           covid==0)

non_covid_surgeindex <- non_covid %>% 
  mutate(mv=case_when(any_icuvent==1~1, TRUE~0),
         nippv_icu=case_when(any_icu==0 & highrisknippv==1~1,
                             any_icu==0 & any_icu==1~1,
                             TRUE~0),
         uncomp=case_when(any_icuvent==0 & nippv_icu==0~1, TRUE~0)) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(numerator=(sum(mv)*5)+(sum(nippv_icu)*2)+sum(uncomp),
            total_enc=n_distinct(PAT_KEY),
            n_mv=sum(mv),
            n_nippv_icu=sum(nippv_icu),
            n_uncomp=sum(uncomp))
            
denom <- non_covid %>% 
  select(PROV_ID, BEDS_GRP) %>% 
  filter(!duplicated(PROV_ID))

non_covid_surgeindex <- left_join(non_covid_surgeindex, denom)

non_covid_surgeindex <- non_covid_surgeindex %>% 
  mutate(denom=case_when(BEDS_GRP=='000-099'~50,
                         BEDS_GRP=='100-199'~150,
                         BEDS_GRP=='200-299'~250,
                         BEDS_GRP=='300-399'~350,
                         BEDS_GRP=='400-499'~450,
                         BEDS_GRP=='500+'~550),
         denom=as.numeric(denom)) %>%
  select(-BEDS_GRP) %>%
  mutate(surge_index=(numerator/denom)*10,
         hosp_month=paste(PROV_ID, ADM_MON, sep='_'),
         covid_hosp_month=case_when(hosp_month %in% analysis_data$hosp_month~1, TRUE~0))
write.csv(non_covid_surgeindex, 'I:/Sarah Warner/Data for Yusuf/non_covid_surgeindex_v2.csv ')

ggplot(data=non_covid_surgeindex)+
  geom_boxplot(aes(y=surge_index, x=as.factor(ADM_MON)))

describe(non_covid_surgeindex$surge_index)

non_covid_surgeindex <- fread('I:/Sarah Warner/Data for Yusuf/COVID19 Hospital Mortality Variation/non_covid_surgeindex_v2.csv')
quantile(non_covid_surgeindex$surge_index,probs=c(0.5, 0.75))

# for some reason these two values at the end weren't being reconized by the formula, maybe because of repeats?
non_covid_surgeindex <- non_covid_surgeindex %>% 
  mutate(rank=case_when(surge_index<30.5273~'low',
                        surge_index>=30.57273 & surge_index<42.04762~'med',
                        surge_index>=42.04762~'high',
                        surge_index==30.5333333333333~'med',
                        surge_index==30.5454545454545~'med',
                        TRUE~'unk'))
non_covid_surgeindex$rank <- factor(non_covid_surgeindex$rank, levels=c('low','med','high'))
non_covid_surgeindex$ADM_MON <- factor(non_covid_surgeindex$ADM_MON, levels=c('2020103','2020204','2020205','2020206',
                                                                              '2020307','2020308'),
                                       labels=c('March','April','May','June','July','August'))


hosp_count <- non_covid_surgeindex %>% 
  group_by(rank, ADM_MON) %>% 
  summarise(n=n_distinct(PROV_ID),
            perc=n/558)

ggplot(data=hosp_count, aes(x=rank, y=perc))+
  geom_bar(aes(fill=rank),stat='identity', width=0.6)+
  geom_hline(yintercept = 0)+
  geom_text(aes(label=n), vjust=-0.2)+
  facet_grid(vars(ADM_MON))+
  scale_y_continuous(labels=scales::percent, name='', limits=c(0, 0.75), breaks=c(0,0.25,0.5,0.75))+
  scale_x_discrete(labels=c('<50th%ile\nLow','50-75th%ile\nMedium','75th%ile+\nHigh'), 
                   name='Non-COVID Index Stratum')+
  scale_fill_manual(values=c('#0072B5FF','#E18727FF','#BC3C29FF'))+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        legend.position = 'none')
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript/Manuscript Figures/non covid surge.tiff')












#### updated surge calculation - used for manuscript ####






covid <- inpat20v3 %>% 
  mutate(any_icu=case_when(PAT_KEY %in% icu_data$PAT_KEY~1, TRUE~0)) %>% 
  filter(PROV_ID %in% analysis_data$PROV_ID &
           ADM_MON %in% c('2020103','2020204','2020205','2020206','2020307','2020308') &
           covid==1 &
           PAT_KEY %in% analysis_data$PAT_KEY)

covid_surgeindex <- covid %>% 
  mutate(mv=case_when(any_icuvent==1~1, TRUE~0),
         nippv_icu=case_when(any_icu==0 & highrisknippv==1~1,
                             any_icu==0 & any_icu==1~1,
                             TRUE~0),
         uncomp=case_when(any_icuvent==0 & nippv_icu==0~1, TRUE~0)) %>% 
  group_by(PROV_ID, ADM_MON) %>% 
  summarise(numerator=(sum(mv)*5)+(sum(nippv_icu)*2)+sum(uncomp),
            total_enc=n_distinct(PAT_KEY),
            n_mv=sum(mv),
            n_nippv_icu=sum(nippv_icu),
            n_uncomp=sum(uncomp))
            
denom <- non_covid %>% 
  select(PROV_ID, BEDS_GRP) %>% 
  filter(!duplicated(PROV_ID))

covid_surgeindex <- left_join(covid_surgeindex, denom)

covid_surgeindex <- covid_surgeindex %>% 
  mutate(denom=case_when(BEDS_GRP=='000-099'~50,
                         BEDS_GRP=='100-199'~150,
                         BEDS_GRP=='200-299'~250,
                         BEDS_GRP=='300-399'~350,
                         BEDS_GRP=='400-499'~450,
                         BEDS_GRP=='500+'~550),
         denom=as.numeric(denom)) %>%
  select(-BEDS_GRP) %>%
  mutate(surge_index=(numerator/denom)*10,
         hosp_month=paste(PROV_ID, ADM_MON, sep='_'),
         covid_hosp_month=case_when(hosp_month %in% analysis_data$hosp_month~1, TRUE~0))

ggplot(data=covid_surgeindex)+
  geom_boxplot(aes(y=surge_index, x=as.factor(ADM_MON)))+
  scale_y_log10()

describe(covid_surgeindex$surge_index)


quantile(covid_surgeindex$surge_index, probs = c(0.5,0.75,0.9,0.95,0.99), na.rm=F)

new_surge <- fread('C:/users/warnersr/Desktop/SurgeIndex_EncounterLevel_ForSarah.csv')
#quantile(new_surge$SurgeIndex_WithoutRatio, probs = c(0.5,0.75,0.9,0.95,0.99), na.rm=F)

analysis_data <- left_join(analysis_data, new_surge)

new_surge_hosplevel <- fread('C:/users/warnersr/Desktop/SurgeIndex_HospitalMonthLevel_ForSarah.csv')
quantile(new_surge_hosplevel$SurgeIndex_WithoutRatio_imp, probs = c(0.5,0.75,0.9,0.95,0.99), na.rm=F)


describe(new_surge_hosplevel$SurgeIndex_WithoutRatio_imp)

#### paper stats ####

t <- analysis_data %>% 
  filter(!duplicated(ADM_MON, PROV_REGION))

t <- analysis_data %>% 
  filter(ADM_MON %in% c('2020103','2020204') &
           icuvent==1) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_death=sum(death),
            n=n_distinct(PAT_KEY),
            perc_mort=(n_death/n)*100)

analysis_data %>% 
  group_by(wave, covid_surgeindex_percent_grps) %>% 
  summarise(n=n_distinct(PAT_KEY))



# old <- fread('I:/Sarah Warner/Data for Yusuf/hosp_variation_data_11.9.20.csv')

months_surging0 <- new_surge_hosplevel %>% 
  mutate(surge=case_when(covid_surgeindex_percent_grps=='00-50'~0, TRUE~1),
         top10=case_when(covid_surgeindex_percent_grps=='90-95'~1,
                         covid_surgeindex_percent_grps=='95-99'~1,
                         covid_surgeindex_percent_grps=='99-100'~1,
                         TRUE~0),
         top1=case_when(covid_surgeindex_percent_grps=='99-100'~1, TRUE~0)) %>% 
  group_by(PROV_ID) %>% 
  summarise(n_surge_months=sum(surge),
            ntop10=sum(top10),
            ntop1=sum(top1))
cro(months_surging$n_surge_months)
cro(months_surging$ntop10)
cro(months_surging$ntop1)





cro(analysis_data[analysis_data$death==1,]$race4, 
    analysis_data[analysis_data$death==1,]$covid_surgeindex_percent_grps, 
    analysis_data[analysis_data$death==1,]$wave)


cro(analysis_data$race4, 
    analysis_data$covid_surgeindex_percent_grps, 
    analysis_data$wave)












#### excess mortality ####

excess_death <- fread('I:/Sarah Warner/Premier Data/Hosp Mort Variation/excess death data waves.csv')
excess_death <- as.data.frame(excess_death)
excess_death$deaths <- as.numeric(as.character(excess_death$deaths))
excess_death$encounters <- as.numeric(as.character(excess_death$encounters))
excess_death$ed <- as.numeric(as.character(excess_death$ed))
excess_death$ed_lower <- as.numeric(as.character(excess_death$ed_lower))
excess_death$ed_upper <- as.numeric(as.character(excess_death$ed_upper))
  
  
ggplot(data=excess_death)+
  #geom_bar(aes(x=as.factor(si), y=encounters),stat='identity',fill='#79AF97FF',width=0.8, alpha=0.8)+
  geom_bar(aes(x=as.factor(desc(order)), y=deaths,fill='#00A1D5FF'),stat='identity',width=0.8, alpha=0.8)+
  geom_bar(aes(x=as.factor(desc(order)), y=ed,fill='#B24745FF'),stat='identity',width=0.8, alpha=1)+
  geom_errorbar(aes(ymin=ed_lower,ymax=ed_upper,x=as.factor(desc(order))),width=0.1, size=0.75)+
  scale_x_discrete(name='Surge Index Categories', labels=c('June-August Patients=5,645',
                                                           'March-May Patients=21,961','',
                                                           'June-August Patients=15,445',
                                                           'March-May Patients=14,264','',
                                                           'June-August Patients=12,447',
                                                           'March-May Patients=8,382','',
                                                           'June-August Patients=18,365',
                                                           'March-May Patients=11,345','',
                                                           'June-August Patients=15,666',
                                                           'March-May Patients=8,555',''))+
  annotate(geom='text', x=15, y=500, hjust=0.5, label=expression(paste('50-75% v <50%')), size=4)+
  annotate(geom='text', x=12, y=500, hjust=0.5, label=expression(paste('75-90% v <50%')), size=4)+
  annotate(geom='text', x=9, y=500, hjust=0.5, label=expression(paste('90-95% v <50%')), size=4)+
  annotate(geom='text', x=6, y=500, hjust=0.5, label=expression(paste('95-99% v <50%')), size=4)+
  annotate(geom='text', x=3, y=500, hjust=0.5, label=expression(paste('99+% v <50%')), size=4)+
  scale_y_continuous(name='No. of COVID-19 Deaths in Study Cohort', labels=c('2,000','4,000','6,000'), 
                     breaks=c(2000,4000,6000), limits=c(-200,6000))+
  scale_fill_manual(name='',values=c('#00A1D5FF','#B24745FF'), 
                    labels=c('Total Deaths','Caseload Surge-Attributable Deaths'))+
  coord_flip()+
  theme(panel.background = element_blank(),
        plot.background = element_blank(),
        axis.line = element_line(),
        axis.text = element_text(size=10),
        #axis.text.x = element_text(angle=45, hjust=1),
        axis.title = element_text(size=10),
        legend.position = 'top',
        legend.text = element_text(size=8))
ggsave('I:/Sarah Warner/Premier Data/Hosp Mort Variation/Manuscript Figures/excess mortalityv2.tiff')  










 
### heat map of surge index by month ####
quantile(analysis_data$SurgeIndex_WithoutRatio, probs = c(0.5,0.75,0.9,0.95,0.975,0.99), na.rm=T)

analysis_data <- analysis_data %>% 
  mutate(surge_cat_new=case_when(SurgeIndex_WithoutRatio<5.266667~'<50%',
                                 SurgeIndex_WithoutRatio>=5.266667 & SurgeIndex_WithoutRatio<11.090909 ~'50-74%',
                                 SurgeIndex_WithoutRatio>=11.090909 & SurgeIndex_WithoutRatio<21.666667~'75-89%',
                                 SurgeIndex_WithoutRatio>=21.666667 & SurgeIndex_WithoutRatio<31.472727~'90-94%',
                                 SurgeIndex_WithoutRatio>=31.472727 & SurgeIndex_WithoutRatio<33.160000~'95-98%',
                                 SurgeIndex_WithoutRatio>= 33.160000 & SurgeIndex_WithoutRatio<37.890909~'99%',
                                 SurgeIndex_WithoutRatio>=37.890909~'>99%',
                                 TRUE~'Unk'),
         surge_cat_num=case_when(SurgeIndex_WithoutRatio<5.266667~0,
                                 SurgeIndex_WithoutRatio>=5.266667 & SurgeIndex_WithoutRatio<11.090909 ~1,
                                 SurgeIndex_WithoutRatio>=11.090909 & SurgeIndex_WithoutRatio<21.666667~1,
                                 SurgeIndex_WithoutRatio>=21.666667 & SurgeIndex_WithoutRatio<31.472727~1,
                                 SurgeIndex_WithoutRatio>=31.472727 & SurgeIndex_WithoutRatio<33.160000~1,
                                 SurgeIndex_WithoutRatio>= 33.160000 & SurgeIndex_WithoutRatio<37.890909~1,
                                 SurgeIndex_WithoutRatio>=37.890909~1,
                                 TRUE~0),
         surge_cat_ordinal=case_when(SurgeIndex_WithoutRatio<5.266667~1,
                                 SurgeIndex_WithoutRatio>=5.266667 & SurgeIndex_WithoutRatio<11.090909 ~2,
                                 SurgeIndex_WithoutRatio>=11.090909 & SurgeIndex_WithoutRatio<21.666667~3,
                                 SurgeIndex_WithoutRatio>=21.666667 & SurgeIndex_WithoutRatio<31.472727~4,
                                 SurgeIndex_WithoutRatio>=31.472727 & SurgeIndex_WithoutRatio<33.160000~5,
                                 SurgeIndex_WithoutRatio>= 33.160000 & SurgeIndex_WithoutRatio<37.890909~6,
                                 SurgeIndex_WithoutRatio>=37.890909~7,
                                 TRUE~0))


# hosp_month <- analysis_data %>% 
#   select(ADM_MON, PROV_ID, SurgeIndex_WithoutRatio) %>% 
#   group_by(PROV_ID, ADM_MON, SurgeIndex_WithoutRatio) %>% 
#   summarise(n_months=n_distinct(ADM_MON)) %>% 
#   select(-n_months)

hosp_month <- analysis_data %>% 
  select(ADM_MON, PROV_ID, surge_cat_ordinal) %>% 
  group_by(PROV_ID, ADM_MON, surge_cat_ordinal) %>% 
  summarise(n_months=n_distinct(ADM_MON)) %>% 
  select(-n_months)


# hosp_month <- hosp_month %>% 
#   mutate(peak_month=case_when(start==1 & ADM_MON=='2020103'~1,
#                               start==1 & ADM_MON=='2020204'~2,
#                               start==1 & ADM_MON=='2020205'~3,
#                               start==1 & ADM_MON=='2020206'~4,
#                               start==1 & ADM_MON=='2020307'~5,
#                               start==1 & ADM_MON=='2020308'~6,
#                               TRUE~0))
# peak_month <- hosp_month %>%
#   ungroup() %>% 
#   select(PROV_ID, peak_month) %>%
#   group_by(PROV_ID) %>% 
#   filter(peak_month==max(peak_month)) %>% 
#   rename(peak_month_full=peak_month)

hosp_month_heatmap <- hosp_month %>% 
  select(PROV_ID, ADM_MON, surge_cat_ordinal) %>% 
  group_by(PROV_ID)# %>% 
  #arrange(peak_month_full) %>%
  # pivot_wider(id_cols = PROV_ID,
  #             values_from = SurgeIndex_WithoutRatio, 
  #             names_from = ADM_MON) %>% 
  # rename(March = `2020103`,
  #        April = `2020204`,
  #        May = `2020205`,
  #        June = `2020206`,
  #        July = `2020307`,
  #        August = `2020308`) 

#hosp_month_heatmap[is.na(hosp_month_heatmap)] <- 0

first_surge <- analysis_data %>% 
  select(ADM_MON, PROV_ID, surge_cat_num) %>% 
  filter(surge_cat_num==1) %>% 
  group_by(PROV_ID) %>% 
  filter(ADM_MON==min(ADM_MON)) %>% 
  filter(!duplicated(PROV_ID)) %>% 
  mutate(first_surge_month=case_when(ADM_MON=='2020103'~1,
                                     ADM_MON=='2020204'~2,
                                     ADM_MON=='2020205'~3,
                                     ADM_MON=='2020206'~4,
                                     ADM_MON=='2020307'~5,
                                     ADM_MON=='2020308'~6,
                                     TRUE~0)) %>% 
  select(PROV_ID, first_surge_month)

#hosp_month_heatmap <- left_join(hosp_month_heatmap, peak_month)
hosp_month_heatmap <- left_join(hosp_month_heatmap, first_surge)

hosp_month_all <- inpat20v3 %>% 
  mutate(study_hosp=case_when(PROV_ID %in% analysis_data$PROV_ID~1, TRUE~0)) %>% 
  filter(study_hosp==1) %>% 
  filter(ADM_MON %in% c('2020103','2020204','2020205',
                        '2020206','2020307','2020308')) %>% 
  select(PROV_ID, ADM_MON) %>% 
  mutate(prov_month=paste(PROV_ID, ADM_MON, sep='_')) %>% 
  filter(!duplicated(prov_month)) %>% 
  select(-prov_month)


# hosp_month_all <- analysis_data %>% 
#   select(PROV_ID, ADM_MON) 
# hosp_month_all <- hosp_month_all[!duplicated(hosp_month_all),]


hosp_month_heatmap2 <- left_join(hosp_month_all, hosp_month_heatmap)

hosp_month_heatmap2[is.na(hosp_month_heatmap2)] <- 0

hosp_month_heatmap2 <- hosp_month_heatmap2 %>% 
  #group_by(PROV_ID) %>% 
  #column_to_rownames(var='PROV_ID') %>% 
  select(-first_surge_month) %>% 
  #ungroup() %>% 
  #mutate(order=row_number()) %>% 
  #select(-PROV_ID) 
  pivot_wider(id_cols=PROV_ID,
              names_from=ADM_MON,
              values_from=surge_cat_ordinal) %>% 
  rename(March  = `2020103`,
         April  = `2020204`,
         May    = `2020205`,
         June   = `2020206`,
         July   = `2020307`,
         August = `2020308`)

hosp_month_heatmap2 <- left_join(hosp_month_heatmap2, first_surge)
hosp_month_heatmap2$first_surge_month[is.na(hosp_month_heatmap2$first_surge_month)] <- 7

hosp_month_heatmap2 <- hosp_month_heatmap2 %>%
  arrange(desc(first_surge_month)) %>% 
  select(-first_surge_month) %>% 
  mutate(number=row_number()) %>% 
  column_to_rownames(var='number') %>% 
  select(-PROV_ID)
  

hosp_month_heatmap3 <- hosp_month_heatmap2[,c(1,2,4,3,6,5)]
#hosp_month_heatmap3[is.na(hosp_month_heatmap3)] <- 0

#library(RColorBrewer) 
hosp_month_heatmap3 <- as.matrix(hosp_month_heatmap3) 
heatmap(hosp_month_heatmap3, Colv = NA, Rowv = NA, scale='column',
        col = colorRampPalette(c('yellow','red'))(7)) 
legend(x='right',legend = c('No COVID-19','<50% Surge','50-75% Surge','75-90% Surge',
                            '90-95% Surge','95-99% Surge','99%+ Surge'),
       fill = colorRampPalette(c('yellow','red'))(7)) 






ggplot(data=hosp_month_heatmap2, aes(x=as.factor(ADM_MON), y=as.factor(PROV_ID), 
                                    fill=SurgeIndex_WithoutRatio))+
  geom_tile()+
  #scale_fill_gradient2(high='red',mid='yellow',low='white',
  #                     #na.value='blue', 
  #                     midpoint=median(hosp_month_heatmap$SurgeIndex_WithoutRatio, na.rm=T),
  #                     name='Surge Index')+
  scale_fill_gradient2(high='red',mid='green',low='green',
                       #na.value='blue', 
                       midpoint=median(hosp_month_heatmap$SurgeIndex_WithoutRatio, na.rm=T),
                       name='Surge Index',
                       #low='green',high='red'
                       )+
  ylab('Hospitals')+
  scale_x_discrete(name='Admission Month', labels=c('March','April','May','June','July','August'))
# +
#   theme(axis.text.y=element_blank(),
#         axis.ticks.y=element_blank(),
#         panel.background = element_rect(fill='gray'))


















  
  
