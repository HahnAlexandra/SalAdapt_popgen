#respiration script
 #15 PSU Gdynia and Boknis Eck
#measurement from 25.9.2024 
#most GDY samples had unusually low oxygen levels from beginning --> exclude


#install.packages("respR")
library(respR)
library(readxl)


resp_15 <- read_excel("2024-09-25-A15PSU_Oxygen.xls", skip = 12)
str(resp_15)

inspect_15 <- inspect(resp_15, time = 2, oxygen = 3:26)

#usually exclude first 20-30 minutes so respiration rates can stabilise
#values should not fall below 60-65 %O2 --> exclude if necessary
resp_15 <- subset_data(resp_15, from = 11, to = 33, by = "row")
inspect_15 <- inspect(resp_15, time = 2, oxygen = 3:26)

#controls

c1 <- inspect(resp_15, time = 2, oxygen = 3, plot = TRUE)
c2 <- inspect(resp_15, time = 2, oxygen = 7, plot = TRUE)
c3 <- inspect(resp_15, time = 2, oxygen = 9, plot = TRUE)
c4 <- inspect(resp_15, time = 2, oxygen = 13, plot = TRUE)
c5 <- inspect(resp_15, time = 2, oxygen = 15, plot = TRUE)
c6 <- inspect(resp_15, time = 2, oxygen = 19, plot = TRUE) 
c7 <- inspect(resp_15, time = 2, oxygen = 21, plot = TRUE)
c8 <- inspect(resp_15, time = 2, oxygen = 25, plot = TRUE)#jumps up again, exclude

#controls look ok

#populations
bk1 <- inspect(resp_15, time = 2, oxygen = 6, plot = TRUE)  
bk2 <- inspect(resp_15, time = 2, oxygen = 8, plot = TRUE)  
bk3 <- inspect(resp_15, time = 2, oxygen = 10, plot = TRUE)  
bk4 <- inspect(resp_15, time = 2, oxygen = 11, plot = TRUE)  
bk5 <- inspect(resp_15, time = 2, oxygen = 18, plot = TRUE)  
bk6 <- inspect(resp_15, time = 2, oxygen = 20, plot = TRUE)  
bk7 <- inspect(resp_15, time = 2, oxygen = 22, plot = TRUE)  
bk8 <- inspect(resp_15, time = 2, oxygen = 23, plot = TRUE)

gd1 <- inspect(resp_15, time = 2, oxygen = 4, plot = TRUE)  
gd2 <- inspect(resp_15, time = 2, oxygen = 5, plot = TRUE) # already low at start - exclude
gd3 <- inspect(resp_15, time = 2, oxygen = 12, plot = TRUE) # already low at start - exclude
gd4 <- inspect(resp_15, time = 2, oxygen = 14, plot = TRUE) # already low at start - exclude
gd5 <- inspect(resp_15, time = 2, oxygen = 16, plot = TRUE) # already low at start - exclude
gd6 <- inspect(resp_15, time = 2, oxygen = 17, plot = TRUE) # already low at start - exclude
gd7 <- inspect(resp_15, time = 2, oxygen = 24, plot = TRUE) # already low at start - exclude
gd8 <- inspect(resp_15, time = 2, oxygen = 26, plot = TRUE) # already low at start - exclude

#check lines in which o2% are lower than 65% - they need to be excluded

#calculate background resp

bg_insp <- inspect(resp_15, time = 2, oxygen = c(3,7,9,13,15,19,21))
bg_rate <- calc_rate.bg(bg_insp)

#calculate copepod respiration
ratebk1 <- calc_rate(bk1)
ratebk2 <- calc_rate(bk2)
ratebk3 <- calc_rate(bk3)
ratebk4 <- calc_rate(bk4)
ratebk5 <- calc_rate(bk5)
ratebk6 <- calc_rate(bk6) 
ratebk7 <- calc_rate(bk7) 
ratebk8 <- calc_rate(bk8)

rategd1 <- calc_rate(gd1)
#check how the output looks like

#correct rate with the background respiration for each chamber
a.ratebk1 <- adjust_rate(ratebk1, bg_rate)
a.ratebk2 <- adjust_rate(ratebk2, bg_rate)
a.ratebk3 <- adjust_rate(ratebk3, bg_rate)
a.ratebk4 <- adjust_rate(ratebk4, bg_rate)
a.ratebk5 <- adjust_rate(ratebk5, bg_rate)
a.ratebk6 <- adjust_rate(ratebk6, bg_rate)
a.ratebk7 <- adjust_rate(ratebk7, bg_rate)
a.ratebk8 <- adjust_rate(ratebk8, bg_rate)

a.rategd1 <- adjust_rate(rategd1, bg_rate)

#conversion of results into the correct unit
# volume chambers 80 ul
#adjust daily pressure
#adjust treatment salinity

#calculation

finalbk1 <- convert_rate(a.ratebk1,         #  rate adjusted for background
                        oxy.unit = "%Oxy",     # oxygen units of the original raw data
                        time.unit = "min",     # time units of the original raw data
                        output.unit = "uL/hour",
                        S=15,
                        t= 15.5,
                        P=1.002,# output unit
                        volume = 0.00008) 

finalbk2 <- convert_rate(a.ratebk2,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 

finalbk3 <- convert_rate(a.ratebk3,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008)

finalbk4 <- convert_rate(a.ratebk4,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 

finalbk5 <- convert_rate(a.ratebk5,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 

finalbk6 <- convert_rate(a.ratebk6,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 

finalbk7 <- convert_rate(a.ratebk7,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 

finalbk8 <- convert_rate(a.ratebk8,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 



finalgd1 <- convert_rate(a.rategd1,         #  rate adjusted for background
                         oxy.unit = "%Oxy",     # oxygen units of the original raw data
                         time.unit = "min",     # time units of the original raw data
                         output.unit = "uL/hour",
                         S=15,
                         t= 15.5,
                         P=1.002,# output unit
                         volume = 0.00008) 


#print summaries and use rate.output value in Respiration.csv
summaries <- list(
  s1<- summary(finalbk1),
  s2 <- summary(finalbk2),
  s3 <- summary(finalbk3),
  s4 <- summary(finalbk4),
  s5 <- summary(finalbk5),
  s6 <- summary(finalbk6),
  s7 <- summary(finalbk7),
  s8 <- summary(finalbk8),
  s9 <- summary(finalgd1),
  
)
