#respiration script
#5 PSU IU7
#measurement from 23.7.2024 

#install.packages("respR")
library(respR)
library(readxl)

setwd("~/Documents/Experiments/Respiration/")

resp_05 <- read_excel("2024-07-23A5_Oxygen.xls", skip = 12)
str(resp_05)

inspect_5 <- inspect(resp_05, time = 2, oxygen = 3:26)

#usually exclude first 20-30 minutes so respiration rates can stabilise
#values should not fall below 60-65 %O2 --> exclude if necessary
resp_05 <- subset_data(resp_05, from = 11, to = 54, by = "row")
inspect_5 <- inspect(resp_05, time = 2, oxygen = 3:26)


#controls

c1 <- inspect(resp_05, time = 2, oxygen = 8, plot = TRUE)
c2 <- inspect(resp_05, time = 2, oxygen = 9, plot = TRUE)
c3 <- inspect(resp_05, time = 2, oxygen = 10, plot = TRUE)
c4 <- inspect(resp_05, time = 2, oxygen = 11, plot = TRUE)
c5 <- inspect(resp_05, time = 2, oxygen = 12, plot = TRUE) 
c6 <- inspect(resp_05, time = 2, oxygen = 13, plot = TRUE) 
c7 <- inspect(resp_05, time = 2, oxygen = 14, plot = TRUE)
c8 <- inspect(resp_05, time = 2, oxygen = 15, plot = TRUE)
c9 <- inspect(resp_05, time = 2, oxygen = 21, plot = TRUE)
c10 <- inspect(resp_05, time = 2, oxygen = 22, plot = TRUE)
c11 <- inspect(resp_05, time = 2, oxygen = 23, plot = TRUE)
c12 <- inspect(resp_05, time = 2, oxygen = 24, plot = TRUE)
c13 <- inspect(resp_05, time = 2, oxygen = 25, plot = TRUE)
c14 <- inspect(resp_05, time = 2, oxygen = 26, plot = TRUE)

#controls look ok

#populations
iu1 <- inspect(resp_05, time = 2, oxygen = 3, plot = TRUE) # 
iu2 <- inspect(resp_05, time = 2, oxygen = 4, plot = TRUE)
iu3 <- inspect(resp_05, time = 2, oxygen = 5, plot = TRUE) 
iu4 <- inspect(resp_05, time = 2, oxygen = 6, plot = TRUE) #  
iu5 <- inspect(resp_05, time = 2, oxygen = 7, plot = TRUE) # 
iu6 <- inspect(resp_05, time = 2, oxygen = 16, plot = TRUE)
iu7 <- inspect(resp_05, time = 2, oxygen = 17, plot = TRUE)
iu8 <- inspect(resp_05, time = 2, oxygen = 18, plot = TRUE)# 
iu9 <- inspect(resp_05, time = 2, oxygen = 19, plot = TRUE)# 
iu10 <- inspect(resp_05, time = 2, oxygen = 20, plot = TRUE)# 

#calculate background resp

bg_insp <- inspect(resp_05, time = 2, oxygen = c(8,9,10,11,12,13,14,15,21,22,23,24,25,26))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration
rateiu1 <- calc_rate(iu1)
rateiu2 <- calc_rate(iu2)
rateiu3 <- calc_rate(iu3) 
rateiu4 <- calc_rate(iu4)
rateiu5 <- calc_rate(iu5)
rateiu6 <- calc_rate(iu6) 
rateiu7 <- calc_rate(iu7)
rateiu8 <- calc_rate(iu8)
rateiu9 <- calc_rate(iu9)
rateiu10 <- calc_rate(iu10)
#check how the output looks like

#correct rate with the background respiration for each chamber
a.rateiu1 <- adjust_rate(rateiu1, bg_rate)
a.rateiu2 <- adjust_rate(rateiu2, bg_rate)
a.rateiu3 <- adjust_rate(rateiu3, bg_rate)
a.rateiu4 <- adjust_rate(rateiu4, bg_rate)
a.rateiu5 <- adjust_rate(rateiu5, bg_rate)
a.rateiu6 <- adjust_rate(rateiu6, bg_rate)
a.rateiu7 <- adjust_rate(rateiu7, bg_rate)
a.rateiu8 <- adjust_rate(rateiu8, bg_rate)
a.rateiu9 <- adjust_rate(rateiu9, bg_rate)
a.rateiu10 <- adjust_rate(rateiu10, bg_rate)


#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finaliu1 <- convert_rate(a.rateiu1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour", #use ml/hour instead 
                        S=5,
                        t= 15.5,
                        P=1.014,# output unit
                        volume = 0.00008)   

finaliu2 <- convert_rate(a.rateiu2,         # rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=5,
                        t= 15.5,
                        P=1.014,# output unit
                        volume = 0.00008)   

finaliu3 <- convert_rate(a.rateiu3,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=5,
                        t= 15.5,
                        P=1.014,# output unit
                        volume = 0.00008)   

finaliu4 <- convert_rate(a.rateiu4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008) 

finaliu5 <- convert_rate(a.rateiu5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008)

finaliu6 <- convert_rate(a.rateiu6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008)

finaliu7 <- convert_rate(a.rateiu7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008)  

finaliu8 <- convert_rate(a.rateiu8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008) 

finaliu9 <- convert_rate(a.rateiu9,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008) 

finaliu10 <- convert_rate(a.rateiu10,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.014,# output unit
                         volume = 0.00008) 


#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finaliu1),
  s2 <- summary(finaliu2),
  s3 <- summary(finaliu3),
  s4 <- summary(finaliu4),
  s5 <- summary(finaliu5),
  s6 <- summary(finaliu6),
  s7 <- summary(finaliu7),
  s8 <- summary(finaliu8),
  s9 <- summary(finaliu9),
  s10 <- summary(finaliu10)
  
)

