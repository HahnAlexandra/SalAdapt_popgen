#respiration script
 #15 PSU BB23 and KB03
#measurement from 19.6.2024 

#install.packages("respR")
library(respR)
library(readxl)


resp_15 <- read_excel("2024-06-19_A15PSU_export_Oxygen.xls", skip = 12)
str(resp_15)


inspect_15 <- inspect(resp_15, time = 2, oxygen = 3:26)
#usually exclude first 20-30 minutes so respiration rates can stabilise
#since this starts after 20 minutes it is already fine
#values should not fall below 60-65 % O2 --> exclude if necessary

#controls

c1 <- inspect(resp_15, time = 2, oxygen = 3, plot = TRUE)
c2 <- inspect(resp_15, time = 2, oxygen = 9, plot = TRUE)
c3 <- inspect(resp_15, time = 2, oxygen = 15, plot = TRUE)
c4 <- inspect(resp_15, time = 2, oxygen = 21, plot = TRUE)
c5 <- inspect(resp_15, time = 2, oxygen = 7, plot = TRUE)
c6 <- inspect(resp_15, time = 2, oxygen = 13, plot = TRUE) 
c7 <- inspect(resp_15, time = 2, oxygen = 19, plot = TRUE)
c8 <- inspect(resp_15, time = 2, oxygen = 25, plot = TRUE)

#controls look ok

# populations
bb1 <- inspect(resp_15, time = 2, oxygen = 5, plot = TRUE)  
bb2 <- inspect(resp_15, time = 2, oxygen = 8, plot = TRUE)  
bb3 <- inspect(resp_15, time = 2, oxygen = 10, plot = TRUE) # 1 animal
bb4 <- inspect(resp_15, time = 2, oxygen = 12, plot = TRUE)  
bb5 <- inspect(resp_15, time = 2, oxygen = 17, plot = TRUE)  
bb6 <- inspect(resp_15, time = 2, oxygen = 20, plot = TRUE)  
bb7 <- inspect(resp_15, time = 2, oxygen = 22, plot = TRUE)  
bb8 <- inspect(resp_15, time = 2, oxygen = 24, plot = TRUE)


kb1 <- inspect(resp_15, time = 2, oxygen = 4, plot = TRUE) 
kb2 <- inspect(resp_15, time = 2, oxygen = 6, plot = TRUE) 
kb3 <- inspect(resp_15, time = 2, oxygen = 11, plot = TRUE)  
kb4 <- inspect(resp_15, time = 2, oxygen = 14, plot = TRUE)  
kb5 <- inspect(resp_15, time = 2, oxygen = 16, plot = TRUE)
kb6 <- inspect(resp_15, time = 2, oxygen = 18, plot = TRUE)  
kb7 <- inspect(resp_15, time = 2, oxygen = 23, plot = TRUE)  
kb8 <- inspect(resp_15, time = 2, oxygen = 26, plot = TRUE)


#calculate background resp
bg_insp <- inspect(resp_15, time = 2, oxygen = c(3,7,9,13,15,19,21,25))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration
ratebb1 <- calc_rate(bb1)
ratebb2 <- calc_rate(bb2)
ratebb3 <- calc_rate(bb3)
ratebb4 <- calc_rate(bb4)
ratebb5 <- calc_rate(bb5)
ratebb6 <- calc_rate(bb6) 
ratebb7 <- calc_rate(bb7) 
ratebb8 <- calc_rate(bb8)

ratekb1 <- calc_rate(kb1) 
ratekb2 <- calc_rate(kb2)
ratekb3 <- calc_rate(kb3) 
ratekb4 <- calc_rate(kb4) 
ratekb5 <- calc_rate(kb5) 
ratekb6 <- calc_rate(kb6) 
ratekb7 <- calc_rate(kb7)
ratekb8 <- calc_rate(kb8) 
#check how the output looks like

#correct rate with the background respiration for each chamber
a.ratebb1 <- adjust_rate(ratebb1, bg_rate)
a.ratebb2 <- adjust_rate(ratebb2, bg_rate)
a.ratebb3 <- adjust_rate(ratebb3, bg_rate)
a.ratebb4 <- adjust_rate(ratebb4, bg_rate)
a.ratebb5 <- adjust_rate(ratebb5, bg_rate)
a.ratebb6 <- adjust_rate(ratebb6, bg_rate)
a.ratebb7 <- adjust_rate(ratebb7, bg_rate)
a.ratebb8 <- adjust_rate(ratebb8, bg_rate)

a.ratekb1 <- adjust_rate(ratekb1, bg_rate)
a.ratekb2 <- adjust_rate(ratekb2, bg_rate)
a.ratekb3 <- adjust_rate(ratekb3, bg_rate)
a.ratekb4 <- adjust_rate(ratekb4, bg_rate)
a.ratekb5 <- adjust_rate(ratekb5, bg_rate)
a.ratekb6 <- adjust_rate(ratekb6, bg_rate)
a.ratekb7 <- adjust_rate(ratekb7, bg_rate)
a.ratekb8 <- adjust_rate(ratekb8, bg_rate)



#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finalbb1 <- convert_rate(a.ratebb1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008)   

finalbb2 <- convert_rate(a.ratebb2,         # rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008)   

finalbb3 <- convert_rate(a.ratebb3,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008)  

finalbb4 <- convert_rate(a.ratebb4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalbb5 <- convert_rate(a.ratebb5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalbb6 <- convert_rate(a.ratebb6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008)

finalbb7 <- convert_rate(a.ratebb7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalbb8 <- convert_rate(a.ratebb8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalkb1 <- convert_rate(a.ratekb1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008) 

finalkb2 <- convert_rate(a.ratekb2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalkb3 <- convert_rate(a.ratekb3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalkb4 <- convert_rate(a.ratekb4,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S= 15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008)   

finalkb5 <- convert_rate(a.ratekb5,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S= 15,
                        t= 15.5,
                        P=1.016,# output unit
                        volume = 0.00008)  

finalkb6 <- convert_rate(a.ratekb6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S= 15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalkb7 <- convert_rate(a.ratekb7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S= 15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

finalkb8 <- convert_rate(a.ratekb8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S= 15,
                         t= 15.5,
                         P=1.016,# output unit
                         volume = 0.00008) 

#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finalbb1),
  s2 <- summary(finalbb2),
  s3 <- summary(finalbb3),
  s4 <- summary(finalbb4),
  s5 <- summary(finalbb5),
  s6 <- summary(finalbb6),
  s7 <- summary(finalbb7),
  s8 <- summary(finalbb8),
  s9 <- summary(finalkb1),
  s10 <- summary(finalkb2),
  s11 <- summary(finalkb3),
  s12 <- summary(finalkb4),
  s13 <- summary(finalkb5),
  s14 <- summary(finalkb6),
  s15 <- summary(finalkb7),
  s16 <- summary(finalkb8)
  
)
