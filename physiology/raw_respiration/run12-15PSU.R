#respiration script
 #15 PSU H21 and Gdynia
#measurement from 04.10.2024 


#install.packages("respR")
library(respR)
library(readxl)


setwd("~/Documents/Experiments/Respiration/")

resp_15 <- read_excel("2024-10-04-A15PSU_Oxygen.xls", skip = 12)
str(resp_15)

inspect_15 <- inspect(resp_15, time = 2, oxygen = 3:26)

#usually exclude first 20-30 minutes so respiration rates can stabilise
#values should not fall below 60-65 %O2 --> exclude if necessary
resp_15 <- subset_data(resp_15, from = 11, to = 31, by = "row")#33
inspect_15 <- inspect(resp_15, time = 2, oxygen = 3:26)

#controls

c1 <- inspect(resp_15, time = 2, oxygen = 4, plot = TRUE)
c2 <- inspect(resp_15, time = 2, oxygen = 8, plot = TRUE)
c3 <- inspect(resp_15, time = 2, oxygen = 10, plot = TRUE)
c4 <- inspect(resp_15, time = 2, oxygen = 14, plot = TRUE)
c5 <- inspect(resp_15, time = 2, oxygen = 16, plot = TRUE)
c6 <- inspect(resp_15, time = 2, oxygen = 20, plot = TRUE) 
c7 <- inspect(resp_15, time = 2, oxygen = 22, plot = TRUE)
c8 <- inspect(resp_15, time = 2, oxygen = 26, plot = TRUE)

#populations
h1 <- inspect(resp_15, time = 2, oxygen = 6, plot = TRUE)  
h2 <- inspect(resp_15, time = 2, oxygen = 7, plot = TRUE)  
h3 <- inspect(resp_15, time = 2, oxygen = 9, plot = TRUE)  
h4 <- inspect(resp_15, time = 2, oxygen = 11, plot = TRUE)  
h5 <- inspect(resp_15, time = 2, oxygen = 15, plot = TRUE)  
h6 <- inspect(resp_15, time = 2, oxygen = 17, plot = TRUE)  
h7 <- inspect(resp_15, time = 2, oxygen = 24, plot = TRUE)  
h8 <- inspect(resp_15, time = 2, oxygen = 25, plot = TRUE)

gd1 <- inspect(resp_15, time = 2, oxygen = 3, plot = TRUE)  
gd2 <- inspect(resp_15, time = 2, oxygen = 5, plot = TRUE)  
gd3 <- inspect(resp_15, time = 2, oxygen = 12, plot = TRUE) 
gd4 <- inspect(resp_15, time = 2, oxygen = 13, plot = TRUE) 
gd5 <- inspect(resp_15, time = 2, oxygen = 18, plot = TRUE)  
gd6 <- inspect(resp_15, time = 2, oxygen = 19, plot = TRUE) # already low at start - exclude
gd7 <- inspect(resp_15, time = 2, oxygen = 21, plot = TRUE)  
gd8 <- inspect(resp_15, time = 2, oxygen = 23, plot = TRUE)

#check lines in which o2% are lower than 65% - they need to be excluded

#calculate background resp

bg_insp <- inspect(resp_15, time = 2, oxygen = c(4,8,10,14,16,20,22,26))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration

rateh1 <- calc_rate(h1)
rateh2 <- calc_rate(h2)
rateh3 <- calc_rate(h3)
rateh4 <- calc_rate(h4)
rateh5 <- calc_rate(h5)
rateh6 <- calc_rate(h6) 
rateh7 <- calc_rate(h7) 
rateh8 <- calc_rate(h8)

rategd1 <- calc_rate(gd1)
rategd2 <- calc_rate(gd2)
rategd3 <- calc_rate(gd3)
rategd4 <- calc_rate(gd4)
rategd5 <- calc_rate(gd5)
rategd7 <- calc_rate(gd7) 
rategd8 <- calc_rate(gd8)
#check how the output looks like

#correct rate with the backgrownd respiration for each chamber
a.rateh1 <- adjust_rate(rateh1, bg_rate)
a.rateh2 <- adjust_rate(rateh2, bg_rate)
a.rateh3 <- adjust_rate(rateh3, bg_rate)
a.rateh4 <- adjust_rate(rateh4, bg_rate)
a.rateh5 <- adjust_rate(rateh5, bg_rate)
a.rateh6 <- adjust_rate(rateh6, bg_rate)
a.rateh7 <- adjust_rate(rateh7, bg_rate)
a.rateh8 <- adjust_rate(rateh8, bg_rate)

a.rategd1 <- adjust_rate(rategd1, bg_rate)
a.rategd2 <- adjust_rate(rategd2, bg_rate)
a.rategd3 <- adjust_rate(rategd3, bg_rate)
a.rategd4 <- adjust_rate(rategd4, bg_rate)
a.rategd5 <- adjust_rate(rategd5, bg_rate)
a.rategd7 <- adjust_rate(rategd7, bg_rate)
a.rategd8 <- adjust_rate(rategd8, bg_rate)


#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finalh1 <- convert_rate(a.rateh1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.022,# output unit
                        volume = 0.00008) 

finalh2 <- convert_rate(a.rateh2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalh3 <- convert_rate(a.rateh3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008)

finalh4 <- convert_rate(a.rateh4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalh5 <- convert_rate(a.rateh5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalh6 <- convert_rate(a.rateh6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalh7 <- convert_rate(a.rateh7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalh8 <- convert_rate(a.rateh8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 



finalgd1 <- convert_rate(a.rategd1,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalgd2 <- convert_rate(a.rategd2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalgd3 <- convert_rate(a.rategd3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008)

finalgd4 <- convert_rate(a.rategd4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalgd5 <- convert_rate(a.rategd5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalgd7 <- convert_rate(a.rategd7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 

finalgd8 <- convert_rate(a.rategd8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.022,# output unit
                         volume = 0.00008) 


#install.packages("openxlsx")

#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finalh1),
  s2 <- summary(finalh2),
  s3 <- summary(finalh3),
  s4 <- summary(finalh4),
  s5 <- summary(finalh5),
  s6 <- summary(finalh6),
  s7 <- summary(finalh7),
  s8 <- summary(finalh8),
  s9 <- summary(finalgd1),
  s10 <- summary(finalgd2),
  s11 <- summary(finalgd3),
  s12 <- summary(finalgd4),
  s13 <- summary(finalgd5),
  s14 <- summary(finalgd7),
  s15 <- summary(finalgd8)
  
)
