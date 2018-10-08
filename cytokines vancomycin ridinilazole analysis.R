df <- read.csv(file.choose(), header = T)
dim(df)
head(df)
summary(df)
str(df)
df<- df[, c("Agent", "PARAM", "AVAL", "visitn", "ESCMID1", "ESCMID2")]

str(df)

summary(df)
df[which(df$ESCMID2==''), ]$ESCMID2 <- NA
df[which(df$ESCMID1==''), ]$ESCMID1 <- NA
df[which(df$visitn==''), ]$visitn <-NA

df$visitn <-droplevels(df$visitn)
df$ESCMID1 <- droplevels(df$ESCMID1)
df$ESCMID2 <- droplevels(df$ESCMID2)

summary <- ddply(df, c("visitn", "ESCMID2",  "PARAM"), summarise, mean = mean(AVAL, na.rm=T), sem=sd(AVAL, na.rm=T)/sqrt(sum(!is.na(AVAL))), N=length(AVAL))

IL8_summary <- summary[summary$PARAM=="Interleukin 8 (ng/g)", ]
Calp_summary <- summary[summary$PARAM=="Calprotectin (ug/g)", ]
IL1b_summary <- summary[summary$PARAM=="Interleukin 1 Beta (ng/g)", ]
IL1RA_summary <- summary[summary$PARAM=="Interleukin 1 Receptor Antagonist (ng/g)", ]
IL23_summary <- summary[summary$PARAM=="Interleukin 23 (pg/g)", ]
LF_summary <- summary[summary$PARAM=="Lactoferrin (ug/g)", ]
TNF_summary <- summary[summary$PARAM=="Tumor Necrosis Factor (pg/g)", ]




summary(df)










rm(IL8)
IL8 <- df[df$PARAM=="Interleukin 8 (ng/g)", ]
dim(IL8)
summary(IL8)
str(IL8)
IL8$PARAM <- droplevels(IL8$PARAM)
summary(IL8)
summary(is.na(IL8$PARAM))
IL8[is.na(IL8$AVAL), ]

#remove 10 patients with missing IL8 concentration
IL8.comp <- IL8[!is.na(IL8$AVAL),]
str(IL8.comp)
summary(IL8.comp)
IL8.comp[which(IL8.comp$ESCMID2==''), ]$ESCMID2 <- NA
IL8.comp[which(IL8.comp$ESCMID1==''), ]$ESCMID1 <- NA
IL8.comp[which(IL8.comp$visitn==''), ]$visitn <-NA

IL8.comp$visitn <-droplevels(IL8.comp$visitn)
IL8.comp$ESCMID1 <-droplevels(IL8.comp$ESCMID1)
IL8.comp$ESCMID2 <-droplevels(IL8.comp$ESCMID2)
str(IL8.comp)
summary(IL8.comp)

















