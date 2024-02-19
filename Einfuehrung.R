# Mit dem Raute-Zeichen (#) werden Kommentarzeilen markiert
# Der Text in Kommentarzeilen dient nur als 
# Anmerkung und wird von R nicht ausgefuehrt

# Es ist meist hilfreich seinen eigenen Code zu kommentieren, 
# damit man ihn auch später noch versteht

# Die Grundrechenarten in R: 
# Addition + 
# Subtraktion - 
# Multiplikation * 
# Division /

(3*3-6)/3+10441 

# Um das Ergebnis einer Berechnung zu speichern, kann es in einer Variable festgehalten werden
# Es gibt zwei Wege einer Variable einen Wert zuzuweisen:
Nummer <- 3
Nummer = 3
# = und <- haben in diesem Fall die gleiche Funktion


# Um das Ergebnis spaeter aufzurufen, muss lediglich der Variablenname ausgefuehrt werden
# In der Konsole wird dann der Befehl erneut angezeigt, gefolgt vom Wert der Variable
Nummer

Nummer <- 3
NuMmEr <- 4

Nummer

NuMmEr

Number <- 3

Character <- "Hallo"

Logical <- TRUE
Logical <- T
# Dies sind fuers Erste die wichtigsten Variablenklassen

# Wenn ich den selben Variablennamen zweimal verwende, 
# wird der erste Wert ueberschrieben
Logical <- FALSE

Logical

?mean

# Variablen koennen auch mehr als einen Wert beinhalten 
# (Datenreihen / Arrays / Vektoren und Matrizen)
# Mithilfe der combine Funktion c() können mehrere Werte zu einem Vektor verbunden werden

MyVector <- c(1,2,3)

MyVector

# Mit der mean() Funktion kann man dann z.B. den Mittelwert berechnen
mean(MyVector)

# In diesem Fall ist das Eingabeargument eine Datenreihe (1,2,3) 
# und das Ausgabeargument der zugehörige Mittelwert

MyNewVector <- c(1,2,3,NA)
# Bei NA-Werten funktioniert die mean-Funktion nicht
mean(MyNewVector)

# Ein zweites Eingabeargument schafft Abhilfe
mean(x = MyNewVector, na.rm = TRUE)

# Auch die Ergebnisse von Funktionen koennen in einer Variable gespeichert werden
MeanMyVector <- mean(MyVector)

# Ergebnis aufrufen
MeanMyVector

# Zeilen (rows) verbinden
MyMatrix <- rbind(MyVector, MyVector, MyVector)
MyMatrix

# Spalten (columns) verbinden
MyMatrix <- cbind(c(1,0,0), c(0,1,0), c(0,1,0))
MyMatrix

# Die Klasse einer Variable herausfinden:
# Die class() Funktion 
Number <- 3
class(Number)

# Auch das Ergebnis dieser Funktion kann ich in einer neuen Variable speichern
ClassOfNumber <- class(Number)

# Und was hat das Ergebnis für eine Klasse? 
class(ClassOfNumber)

# Auch dieses Ergebnis könnte ihr wieder in einer Variable speichern
ClassOfClassOfNumber <- class(ClassOfNumber)
ClassOfClassOfNumber

mean(MyVector)
min(MyVector)
max(MyVector)
sd(MyVector)
summary(MyVector)
length(MyVector)

# Ich kann auch etwas auf einen Variablenwert aufaddieren und dies in der selben Variable speichern
# (der alte Wert ist dann aber geloescht)
Number

Number <- Number + 8
Number

# Anführungszeichen markieren für R eine character-Variable
Number <- "3"

# Das geht nicht
Number <- Number + 8

class(Number)

# Die Funktion as.numeric() wandelt eine andere Variablenklasse in einen numerischen Wert um
Number <- as.numeric(Number)
class(Number)

# Jetzt geht es wieder
Number <- Number + 8
Number

# Es muss aber eine moegliche Umformung sein
as.numeric("a")

# Matrizenrechnung ist auch moeglich
MyMatrix

MyMatrix - 1 

# Ich kann alle Berechnungen in einer neuen Variable speichern
MyNewMatrix <- MyMatrix + 3
MyNewMatrix

class(MyNewMatrix)

# Wenn man mit (Forschungs-)Datensaetzen arbeitet, bietet es sich meistens an diese als dataframe 
# zu speichern, da bei der Matrix-Klasse alle Werte die gleiche Datenklasse haben muessen
MyNewMatrix <- data.frame(MyNewMatrix)
class(MyNewMatrix)

# Hier erstellen wir einen dataframe mit drei Spalten: x, y und z
# Spalte x hat die Klasse numeric (bedeutet 1 bis 3)
# Spalte y hat die Klasse character
# Spalte z hat die Klasse logical
my_df <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  z = c(T,F,F)
)

my_df

# Alternativ ginge es auch so:
x <- 1:3
y <- c("a", "b", "c")
z <- c(T,F,F)

my_df <- data.frame(x,y,z)
my_df

# Mit eckigen Klammern kann ich auch spezifische Elemente eines dataframes adressieren
# Zeilen und Spalten werden dabei mit einem Komma getrennt: [Zeile, Spalte]
# Die Zeilen und Spalten sind dafuer durchnummeriert
my_df[1,2]

# Wenn ich einen der Werte leer lasse, bekomme ich die komplette Zeile oder Spalte ausgegeben
my_df[1,]

my_df[,2]

# Wenn Spalten und/oder Zeilen benannt sind, können auch die Namen verwendet werden
# Wir haben die Spalten mit x, y und z benannt, die Zeilen haben keine Namen
my_df[1,"x"]

# Wenn man mehrere Zeilen oder Spalten auf einmal aufrufen möchte, muss
# man wieder die combine-Funktion verwenden
my_df[c(1,2), c("x","y")]

# Um benannte Spalten einzeln aufzurufen, gibt es noch den $ Operator
my_df$x
# entspricht:
my_df[,"x"]

# Hier kriegen wir einen Warnhinweis:
mean(my_df)

# Aber wenn wir nur die numerische Spalte verwenden, funktioniert es:
mean(my_df[,"x"])

# Was könnte der Wert bei logischen Daten bedeuten?
mean(my_df[,"z"])

# Jetzt erstellen wir einen Übungsdatensatz:
names <- c("Robert", "Christian", "Nancy", "Annalena", "Marco", "Hubertus", "Boris", "Cem", "Lisa", "Karl", "Volker", "Steffi", "Bettina", "Svenja", "Klara", "Wolfgang")
gender = factor(c("m", "m", "w", "w", "m", "m", "m", "m", "w", "m", "m", "w", "w", "w", "w", "m"))
age = c(54, 44, 53, 43, 46, 51, 63, 58, 55, 60, 53, 55, 55, 55, 47, 53)

# Die IQ-Werte werden anhand einer Normalverteilung zufällig generiert
# Indem wir den seed festlegen, bekommen wir alle die gleichen Zufallszahlen
set.seed(3425)
iq = rnorm(16, mean = 100, sd = 15)

# Jetzt erstellen wir den data.frame
sample_data <- data.frame(names,gender,age,iq)

mean(iq)
mean(sample_data[,"iq"])

mean(age)
mean(sample_data[,"age"])
mean(sample_data[,3])

table(sample_data[,"gender"])

# Bei der ersten Nutzung muss die Bibliothek zunächst installiert werden:
install.packages("psych")
install.packages("Rtools")

# Um die Bibliothek zu nutzen, muss sie dann in jeder R-Instanz neu geladen werden
library(psych)

# Die describe-Funktion bietet einen Überblick über verschiedene Kennwerte der Variablen des Datensatzes
describe(sample_data, check = F)

# Die violin-Funktion erstellt Violin-plots
violin(age ~ gender, data = sample_data)

# Durch das R-Projekt weiß in welchem Ordner es nach der Datei suchen muss
# Mit der read()-Funktion können wir einen Datensatz aus einer csv-Datei einlesen
fb_data <- read.csv2("Daten Fragebogen.csv")

# Die head()-Funktion ermöglicht uns einen Überblick über die Variablen im Datensatz
head(fb_data)

# Berechnung der Skala Odd Believes & Magical Thinking - Items 3, 12, 21, 30, 39, 47, 55

# Zunächst schauen wir uns mit Hilfe der alpha()-Funktion aus der psych-Bibliothek 
# das Cronbach's Alpha und weitere Parameter für die Itemanalyse an
alpha(fb_data[,c("spq3", "spq12", "spq21", "spq30", "spq39", "spq47", "spq55")])

# Die rowMeans()-Funktion berechnet zeilenweise den Mittelwert für den Datensatz im Eingabeargument
# Diese Datenreihe von Mittelwerten wird dann als neue Spalte OBMT in unserem Datensatz gespeichert
fb_data[,"OBMT"] <- rowMeans(fb_data[,c("spq3", "spq12", "spq21", "spq30", "spq39", "spq47", "spq55")], na.rm = T)

rowMeans(fb_data[,c("spq3", "spq12", "spq21", "spq30", "spq39", "spq47", "spq55")], na.rm = T)

fb_data[,"OBMT"]

#### ESA - Skala 
alpha(fb_data[,c("spq2", "spq11", "spq20", "spq29", "spq38", "spq46", "spq54", "spq71")])

fb_data[,"ESA"] <- rowMeans(fb_data[,c("spq2", "spq11", "spq20", "spq29", "spq38", "spq46", "spq54", "spq71")], na.rm = T)

mean(fb_data[,"ESA"], na.rm = T)
