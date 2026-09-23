#respiration script
#5 PSU SK and LL17
#measurement from 11.9.2024 
#new calibration

#install.packages("respR")
library(respR)
library(readxl)

setwd("~/Documents/Experiments/Respiration/")

resp_05 <- read_excel("2024-09-11A5_Oxygen.xls", skip = 12)
str(resp_05)

inspect_5 <- inspect(resp_05, time = 2, oxygen = 3:26)

#usually exclude first 20-30 minutes so respiration rates can stabilise
#values should not fall below 60-65 %O2 --> exclude if necessary
resp_05 <- subset_data(resp_05, from = 11, to = 43, by = "row")
inspect_5 <- inspect(resp_05, time = 2, oxygen = 3:26)

#controls

c1 <- inspect(resp_05, time = 2, oxygen = 5, plot = TRUE)
c2 <- inspect(resp_05, time = 2, oxygen = 8, plot = TRUE)# exclude, probably openend
c3 <- inspect(resp_05, time = 2, oxygen = 11, plot = TRUE)
c4 <- inspect(resp_05, time = 2, oxygen = 14, plot = TRUE)
c5 <- inspect(resp_05, time = 2, oxygen = 17, plot = TRUE) 
c6 <- inspect(resp_05, time = 2, oxygen = 20, plot = TRUE) 
c7 <- inspect(resp_05, time = 2, oxygen = 23, plot = TRUE)
c8 <- inspect(resp_05, time = 2, oxygen = 26, plot = TRUE)

#controls look ok

#populations
sk1 <- inspect(resp_05, time = 2, oxygen = 3, plot = TRUE) 
sk2 <- inspect(resp_05, time = 2, oxygen = 4, plot = TRUE)
sk3 <- inspect(resp_05, time = 2, oxygen = 12, plot = TRUE) 
sk4 <- inspect(resp_05, time = 2, oxygen = 13, plot = TRUE)   
sk5 <- inspect(resp_05, time = 2, oxygen = 15, plot = TRUE) 
sk6 <- inspect(resp_05, time = 2, oxygen = 16, plot = TRUE)
sk7 <- inspect(resp_05, time = 2, oxygen = 24, plot = TRUE)
sk8 <- inspect(resp_05, time = 2, oxygen = 25, plot = TRUE) 

ll1 <- inspect(resp_05, time = 2, oxygen = 6, plot = TRUE) 
ll2 <- inspect(resp_05, time = 2, oxygen = 7, plot = TRUE)
ll3 <- inspect(resp_05, time = 2, oxygen = 9, plot = TRUE) 
ll4 <- inspect(resp_05, time = 2, oxygen = 10, plot = TRUE)   
ll5 <- inspect(resp_05, time = 2, oxygen = 18, plot = TRUE)  
ll6 <- inspect(resp_05, time = 2, oxygen = 19, plot = TRUE)
ll7 <- inspect(resp_05, time = 2, oxygen = 21, plot = TRUE)
ll8 <- inspect(resp_05, time = 2, oxygen = 22, plot = TRUE) 

#calculate background resp

bg_insp <- inspect(resp_05, time = 2, oxygen = c(5,11,14,17,20,23,26))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration
ratesk1 <- calc_rate(sk1)
ratesk2 <- calc_rate(sk2)
ratesk3 <- calc_rate(sk3) 
ratesk4 <- calc_rate(sk4)
ratesk5 <- calc_rate(sk5)
ratesk6 <- calc_rate(sk6) 
ratesk7 <- calc_rate(sk7)
ratesk8 <- calc_rate(sk8)

ratell1 <- calc_rate(ll1)
ratell2 <- calc_rate(ll2)
ratell3 <- calc_rate(ll3) 
ratell4 <- calc_rate(ll4)
ratell5 <- calc_rate(ll5)
ratell6 <- calc_rate(ll6) 
ratell7 <- calc_rate(ll7)
ratell8 <- calc_rate(ll8)
#check how the output looks like

#correct rate with the background respiration for each chamber
a.ratesk1 <- adjust_rate(ratesk1, bg_rate)
a.ratesk2 <- adjust_rate(ratesk2, bg_rate)
a.ratesk3 <- adjust_rate(ratesk3, bg_rate)
a.ratesk4 <- adjust_rate(ratesk4, bg_rate)
a.ratesk5 <- adjust_rate(ratesk5, bg_rate)
a.ratesk6 <- adjust_rate(ratesk6, bg_rate)
a.ratesk7 <- adjust_rate(ratesk7, bg_rate)
a.ratesk8 <- adjust_rate(ratesk8, bg_rate)

a.ratell1 <- adjust_rate(ratell1, bg_rate)
a.ratell2 <- adjust_rate(ratell2, bg_rate)
a.ratell3 <- adjust_rate(ratell3, bg_rate)
a.ratell4 <- adjust_rate(ratell4, bg_rate)
a.ratell5 <- adjust_rate(ratell5, bg_rate)
a.ratell6 <- adjust_rate(ratell6, bg_rate)
a.ratell7 <- adjust_rate(ratell7, bg_rate)
a.ratell8 <- adjust_rate(ratell8, bg_rate)


#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finalsk1 <- convert_rate(a.ratesk1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour", #use ml/hour instead 
                        S=5,
                        t= 15.5,
                        P=0.999,# output unit
                        volume = 0.00008)

finalsk2 <- convert_rate(a.ratesk2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)  

finalsk3 <- convert_rate(a.ratesk3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)

finalsk4 <- convert_rate(a.ratesk4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)  

finalsk5 <- convert_rate(a.ratesk5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 

finalsk6 <- convert_rate(a.ratesk6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 
finalsk7 <- convert_rate(a.ratesk7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)
finalsk8 <- convert_rate(a.ratesk8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 

finalll1 <- convert_rate(a.ratell1,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)

finalll2 <- convert_rate(a.ratell2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)  

finalll3 <- convert_rate(a.ratell3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)

finalll4 <- convert_rate(a.ratell4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)  

finalll5 <- convert_rate(a.ratell5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 

finalll6 <- convert_rate(a.ratell6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 
finalll7 <- convert_rate(a.ratell7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008)
finalll8 <- convert_rate(a.ratell8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour", #use ml/hour instead 
                         S=5,
                         t= 15.5,
                         P=0.999,# output unit
                         volume = 0.00008) 




#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finalsk1),
  s2 <- summary(finalsk2),
  s3 <- summary(finalsk3),
  s4 <- summary(finalsk4),
  s5 <- summary(finalsk5),
  s6 <- summary(finalsk6),
  s7 <- summary(finalsk7),
  s8 <- summary(finalsk8),
  s9 <- summary(finalll1),
  s10 <- summary(finalll2),
  s11 <- summary(finalll3),
  s12 <- summary(finalll4),
  s13 <- summary(finalll5),
  s14 <- summary(finalll6),
  s15 <- summary(finalll7),
  s16 <- summary(finalll8)
  
)

