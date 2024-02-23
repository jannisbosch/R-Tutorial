library(tidyverse)

load(file = file.path("dateien", "study3_excluded.RData"))  

persondata <- persondata %>%
  select(!c(contains("trial"), X.1, uni, bemerkt, X, bemerkt2, int_dif, perf_dif, Gruppe, Gruppe_label, sc_dif, unipos, unitest, sc1mean_z, sc2mean_z, sc_dif_z, int_dif_z, rating_z, int1mean, int2mean, sc1mean, sc2mean, Identification, SCOopinion, SCOability, int1mean_z, int2mean_z, SCOability_z, Identification_complete, Identification_z, Enjoyment))

persondata[,"sozpos"] <- factor(persondata[,"sozpos"], levels = c("low social position", "high social position"))

saveRDS(persondata, file = file.path("dateien", "experiment_data.rds"))

mydata <- readRDS(file.path("dateien", "experiment_data.rds"))

c("sc1_1", "sc1_2_rev", "sc1_3", "sc1_4_rev")
c("sc2_1", "sc2_2_rev", "sc2_3", "sc2_4_rev")
c("int1_1", "int1_2", "int1_3", "int1_4")
c("int2_1", "int2_2", "int2_3", "int2_4")
c("SCO1", "SCO2", "SCO3", "SCO4", "SCO5_rev", "SCO6")
c("SCO7", "SCO8", "SCO9", "SCO10", "SCO11_rev")
c("Ident1", "Ident2", "Ident3", "Ident4")
c("End1", "End2_rev", "End3")


mydata_scales |>
  describeBy(mydata_scales ~ sozpos*Geschlecht)
