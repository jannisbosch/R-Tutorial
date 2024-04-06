#### ---------------
# Lest zunächst den Datensatz ein
mydata <- readRDS(file.path("dateien", "experiment_data.rds"))

# Schaut euch dann die Struktur des Datensatzes in RStudio an

#### ---------------
# Im Datensatz sind Items aus acht verschiedenen Skalen
# Erstellt nun zunächst für jede Skala einen Vektor mit den Item-Namen im Datensatz
sc1_items <- c("sc1_1", "sc1_2_rev", "sc1_3", "sc1_4_rev") # self-concept (pre-test)
sc2_items <- c("sc2_1", "sc2_2_rev", "sc2_3", "sc2_4_rev") # self-concept (post-test)
int1_items <- c("int1_1", "int1_2", "int1_3", "int1_4") # interest (pre-test)
int2_items <- c("int2_1", "int2_2", "int2_3", "int2_4") # interest (post-test)
sco_ability_items <- c("SCO1", "SCO2", "SCO3", "SCO4", "SCO5_rev", "SCO6") # social comparison orientation ability
sco_opinion_items <- c("SCO7", "SCO8", "SCO9", "SCO10", "SCO11_rev") # social comparison orientation opinion
identification_items <- c("Ident1", "Ident2", "Ident3", "Ident4") # university identification
enjoyment_items <- c("End1", "End2_rev", "End3") # enjoyment of the task

# Diese Variablen können wir später zur Berechnung der Skalenmittelwerte nutzen

#### ---------------
# psych-Bibliothek laden
library(psych)
alpha(mydata[,sc1_items]) # entspricht: alpha(mydata[,c("sc1_1", "sc1_2_rev", "sc1_3", "sc1_4_rev")])

#### ---------------
# Wie beim letzten mal erstellen wir jetzt neue Spalten für die 
# Skalenmittelwerte mit der rowMeans()-Funktion
mydata[,"sc1_mean"] <- rowMeans(mydata[,sc1_items], na.rm = T)
mydata[,"sc2_mean"] <- rowMeans(mydata[,sc2_items], na.rm = T)
mydata[,"int1_mean"] <- rowMeans(mydata[,int1_items], na.rm = T)
mydata[,"int2_mean"] <- rowMeans(mydata[,int2_items], na.rm = T)
mydata[,"sco_ability_mean"] <- rowMeans(mydata[,sco_ability_items], na.rm = T)
mydata[,"sco_opinion_mean"] <- rowMeans(mydata[,sco_opinion_items], na.rm = T)
mydata[,"identification_mean"] <- rowMeans(mydata[,identification_items], na.rm = T)
mydata[,"enjoyment_mean"] <- rowMeans(mydata[,enjoyment_items], na.rm = T)

####  ---------------
# Die Bibliothek installieren
install.packages("tidyverse")

# Und die Bibliothek laden
library(tidyverse)

#### ---------------
# Zur besseren Übersicht bietet es sich nach Berechnung der Skalenmittelwerte 
# an einen neuen Datensatz zu erstellen, der die Einzelitems nicht beinhaltet 
mydata_scales <- select(mydata, !c(all_of(c(int1_items, int2_items, sc1_items, sc2_items, sco_ability_items, sco_opinion_items, enjoyment_items, identification_items)), "sc1_2", "sc1_4", "sc2_2", "sc2_4", "SCO5", "SCO11", "End2"))

#### ---------------
# Das geht auch mit der pipe
mydata_scales <- mydata |>
  select(!c(all_of(c(int1_items, int2_items, sc1_items, sc2_items, sco_ability_items, sco_opinion_items, enjoyment_items, identification_items)), "sc1_2", "sc1_4", "sc2_2", "sc2_4", "SCO5", "SCO11", "End2"))

# entspricht:
# select(mydata, !c(all_of(c(int1_items, int2_items, sc1_items, sc2_items, sco_ability_items, sco_opinion_items, enjoyment_items, identification_items)), "sc1_2", "sc1_4", "sc2_2", "sc2_4", "SCO5", "SCO11", "End2"))

# Die pipe nutzt die Variable vor der pipe |> als erstes Argument für die Funktion nach der pipe |>
# Teilweise wird auch %>% als pipe verwendet
# Für unsere heutigen Bedürfnisse sind beide pipes äquivalent
# %>% kommt aus der tidyverse-Bibliothek (bzw. aus magrittr), |> aus base R (keine Bibliothek nötig)^

#### ---------------
# Unsere Daten sind nicht ganz konsistent benannt
# Alter und Geschlecht sind groß geschrieben und auf Deutsch

# So können wir die Spalte neu benennen 
mydata_scales <- mydata_scales |>
  rename(age = Alter, gender = Geschlecht)

#### ---------------
# Verschaffen wir uns mal einen Überblick
describe(mydata_scales)

#### ---------------
# So können wir uns die deskriptiven Statistiken getrennt nach Gruppen ausgeben lassen
describeBy(mydata_scales ~ sozpos)

#### ---------------
# Korrelationsvariablen festlegen
cor_vars <- c("sc1_mean", "sc2_mean", "int1_mean", "int2_mean", "sco_ability_mean", "sco_opinion_mean", "enjoyment_mean", "identification_mean")

# Korrelationsparamater für diese Variablen berechnen
corr.test(mydata_scales[,cor_vars])
corr.test(mydata_scales[,c("sc1_mean", "sc2_mean", "int1_mean", "int2_mean", "sco_ability_mean", "sco_opinion_mean", "enjoyment_mean", "identification_mean")])

#### ---------------
# Die corr.test()-Funktion hat keinen "eingebauten" Gruppenvergleich
# Verschiedene andere Funktionen können diese Lücke aber schließen
# Mit der subset()-Funktion kann ich einen Teil der Fälle ausschließen
corr.test(subset(mydata_scales, sozpos == "low social position")[,cor_vars])

#### ---------------
# Die filter()-Funktion wird etwas anders verwendet,
# das Ergebnis ist aber das gleiche wie bei der subset()-Funktion.
# Beide Funktionen stehen für zwei unterschiedliche Programmierlogiken,
# die in R parallel bestehen und je nach Anlass ausgewählt werden können.
mydata_scales |>
  filter(sozpos == "high social position") |>
  select(all_of(cor_vars)) |>
  corr.test()
