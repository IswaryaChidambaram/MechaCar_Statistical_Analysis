
# Deliverable 1
install.packages("dplyr")
library(dplyr)
MechaCar_df<- read.csv(file='MechaCar_mpg.csv')

model<-lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=MechaCar_df)
summary_model<-summary(model)

# Deliverable 2
coil_df<-read.csv(file='Suspension_Coil.csv')
coil_summary<-coil_df%>%summarize(Mean=round(mean(PSI),2),Median=median(PSI),Variance=round(var(PSI),5),SD=round(sd(PSI),6),.groups = 'keep')

lot_summary <- coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=round(mean(PSI),2),Median=round(median(PSI),1),Variance=round(var(PSI),7),SD=round(sd(PSI),6),.groups = 'keep')%>%
  as.data.frame() #create summary table


# Deliverable 3
coil_df$PSI
t.test(coil_df$PSI, mu = 1500)

lot1_df=coil_df %>% filter(Manufacturing_Lot == "Lot1")
t.test(lot1_df$PSI, mu = 1500)

lot2_df=coil_df %>% filter(Manufacturing_Lot == "Lot2")
t.test(lot2_df$PSI, mu = 1500)

lot3_df=coil_df %>% filter(Manufacturing_Lot == "Lot3")
t.test(lot3_df$PSI, mu = 1500)
