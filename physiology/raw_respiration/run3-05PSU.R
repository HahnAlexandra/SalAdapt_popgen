#respiration script
#5 PSU WH and SW08
#measurement from 16.7.2024 

#install.packages("respR")
library(respR)
library(readxl)

setwd("~/Documents/Experiments/Respiration/")

resp_05 <- read_excel("2024-07-16A5_Oxygen.xls", skip = 12)
str(resp_15)

inspect_5 <- inspect(resp_05, time = 2, oxygen = 3:26)

#usually exclude first 20-30 minutes so respiration rates can stabilise
#values should not fall below 60-65 % O2 --> exclude if necessary
resp_05 <- subset_data(resp_05, from = 9, to = 37, by = "row")


#controls

c1 <- inspect(resp_05, time = 2, oxygen = 3, plot = TRUE)
c2 <- inspect(resp_05, time = 2, oxygen = 9, plot = TRUE)
c3 <- inspect(resp_05, time = 2, oxygen = 15, plot = TRUE)
c4 <- inspect(resp_05, time = 2, oxygen = 21, plot = TRUE)
c5 <- inspect(resp_05, time = 2, oxygen = 6, plot = TRUE) 
c6 <- inspect(resp_05, time = 2, oxygen = 12, plot = TRUE) 
c7 <- inspect(resp_05, time = 2, oxygen = 18, plot = TRUE)
c8 <- inspect(resp_05, time = 2, oxygen = 24, plot = TRUE)

#controls look ok

#populations
wh1 <- inspect(resp_05, time = 2, oxygen = 10, plot = TRUE)  
wh2 <- inspect(resp_05, time = 2, oxygen = 11, plot = TRUE)
wh3 <- inspect(resp_05, time = 2, oxygen = 22, plot = TRUE) 
wh4 <- inspect(resp_05, time = 2, oxygen = 23, plot = TRUE)   
wh5 <- inspect(resp_05, time = 2, oxygen = 7, plot = TRUE)  
wh6 <- inspect(resp_05, time = 2, oxygen = 8, plot = TRUE)
wh7 <- inspect(resp_05, time = 2, oxygen = 19, plot = TRUE)
wh8 <- inspect(resp_05, time = 2, oxygen = 20, plot = TRUE) 


sw1 <- inspect(resp_05, time = 2, oxygen = 4, plot = TRUE) 
sw2 <- inspect(resp_05, time = 2, oxygen = 5, plot = TRUE)  
sw3 <- inspect(resp_05, time = 2, oxygen = 13, plot = TRUE) 
sw4 <- inspect(resp_05, time = 2, oxygen = 14, plot = TRUE) 
sw5 <- inspect(resp_05, time = 2, oxygen = 16, plot = TRUE)
sw6 <- inspect(resp_05, time = 2, oxygen = 17, plot = TRUE)  
sw7 <- inspect(resp_05, time = 2, oxygen = 25, plot = TRUE) 
sw8 <- inspect(resp_05, time = 2, oxygen = 26, plot = TRUE)


#calculate background resp

bg_insp <- inspect(resp_05, time = 2, oxygen = c(3,6,9,12,15,18,21,24))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration
ratewh1 <- calc_rate(wh1)
ratewh2 <- calc_rate(wh2)
ratewh3 <- calc_rate(wh3) 
ratewh4 <- calc_rate(wh4)
ratewh5 <- calc_rate(wh5)
ratewh6 <- calc_rate(wh6) 
ratewh7 <- calc_rate(wh7)
ratewh8 <- calc_rate(wh8)

ratesw1 <- calc_rate(sw1) 
ratesw2 <- calc_rate(sw2)
ratesw3 <- calc_rate(sw3) 
ratesw4 <- calc_rate(sw4)
ratesw5 <- calc_rate(sw5)
ratesw6 <- calc_rate(sw6) 
ratesw7 <- calc_rate(sw7) 
ratesw8 <- calc_rate(sw8) 
#check how the output looks like


#correct rate with the background respiration for each chamber
a.ratewh1 <- adjust_rate(ratewh1, bg_rate)
a.ratewh2 <- adjust_rate(ratewh2, bg_rate)
a.ratewh3 <- adjust_rate(ratewh3, bg_rate)
a.ratewh4 <- adjust_rate(ratewh4, bg_rate)
a.ratewh5 <- adjust_rate(ratewh5, bg_rate)
a.ratewh6 <- adjust_rate(ratewh6, bg_rate)
a.ratewh7 <- adjust_rate(ratewh7, bg_rate)
a.ratewh8 <- adjust_rate(ratewh8, bg_rate)


a.ratesw1 <- adjust_rate(ratesw1, bg_rate)
a.ratesw2 <- adjust_rate(ratesw2, bg_rate)
a.ratesw3 <- adjust_rate(ratesw3, bg_rate)
a.ratesw4 <- adjust_rate(ratesw4, bg_rate)
a.ratesw5 <- adjust_rate(ratesw5, bg_rate)
a.ratesw6 <- adjust_rate(ratesw6, bg_rate)
a.ratesw7 <- adjust_rate(ratesw7, bg_rate)
a.ratesw8 <- adjust_rate(ratesw8, bg_rate)


#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finalwh1 <- convert_rate(a.ratewh1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour", #use ml/hour instead 
                        S=5,
                        t= 15.5,
                        P=1.009,# output unit
                        volume = 0.00008)   

finalwh2 <- convert_rate(a.ratewh2,         # rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=5,
                        t= 15.5,
                        P=1.009,# output unit
                        volume = 0.00008)   

finalwh3 <- convert_rate(a.ratewh3,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=5,
                        t= 15.5,
                        P=1.009,# output unit
                        volume = 0.00008)   

finalwh4 <- convert_rate(a.ratewh4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008) 

finalwh5 <- convert_rate(a.ratewh5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)

finalwh6 <- convert_rate(a.ratewh6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)

finalwh7 <- convert_rate(a.ratewh7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)  

finalwh8 <- convert_rate(a.ratewh8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008) 

finalsw1 <- convert_rate(a.ratesw1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=5,
                        t= 15.5,
                        P=1.009,# output unit
                        volume = 0.00008)

finalsw2 <- convert_rate(a.ratesw2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)

finalsw3 <- convert_rate(a.ratesw3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008) 

finalsw4 <- convert_rate(a.ratesw4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008) 

finalsw5 <- convert_rate(a.ratesw5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)  

finalsw6 <- convert_rate(a.ratesw6,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S= 5,
                        t= 15.5,
                        P=1.009,# output unit
                        volume = 0.00008) 

finalsw7 <- convert_rate(a.ratesw7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S= 5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)   

finalsw8 <- convert_rate(a.ratesw8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S= 5,
                         t= 15.5,
                         P=1.009,# output unit
                         volume = 0.00008)   


#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finalwh1),
  s2 <- summary(finalwh2),
  s3 <- summary(finalwh3),
  s4 <- summary(finalwh4),
  s5 <- summary(finalwh5),
  s6 <- summary(finalwh6),
  s7 <- summary(finalwh7),
  s8 <- summary(finalwh8),
  s9 <- summary(finalsw1),
  s10 <- summary(finalsw2),
  s11 <- summary(finalsw3),
  s12 <- summary(finalsw4),
  s13 <- summary(finalsw5),
  s14 <- summary(finalsw6),
  s15 <- summary(finalsw7),
  s16 <- summary(finalsw8)
)

