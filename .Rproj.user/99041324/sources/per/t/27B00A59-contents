### Arbeiten mit R(-Studio)

# Mit dem Raute-Zeichen (#) werden Kommentarzeilen markiert
# Der Text in Kommentarzeilen dient nur als Anmerkung und wird von R nicht ausgefuehrt

























## Einfache Berechnungen 

# Die Grundrechenarten in R: 
# Addition + 
# Subtraktion - 
# Multiplikation * 
# Division /
(3*3-6)/3+10441 

3*3-6/3+10441
# R berechnet Punkt- vor Strichrechnung













## Variablen deklarieren
# Um das Ergebnis einer Berechnung zu speichern, kann es in einer Variable festgehalten werden
# Es gibt zwei Wege einer Variable einen Wert zuzuweisen:
Nummer <- 3
Nummer = 3
# = und <- haben die gleiche Funktion

Nummer
# Um das Ergebnis spaeter aufzurufen, muss lediglich der Variablenname ausgefuehrt werden
# In der Konsole wird dann der Befehl erneut angezeigt, gefolgt vom Wert der Variable

NuMmEr <- 3
# Gross- und Kleinschreibung beachten














## Variablenklassen
Number <- 3

Character <- "Hallo"

Logical <- TRUE
Logical <- T

# Dies sind fuers Erste die wichtigsten Variablenklassen


Logical <- FALSE
# Wenn ich den selben Variablennamen zweimal verwende, wird der erste Wert ueberschrieben
















## Funktionen
# Wie bei Excel gibt es auch bei R Funktionen

# Variablen koennen auch mehr als einen Wert beinhalten (Vektoren und Matrizen)
# Ein Vektor
MyVector <- c(1,2,3)
MyVector

mean(MyVector)
# Mit der mean() Funktion kann man den Mittelwert einer Variablen berechnen



# Auch die Ergebnisse von Funktionen koennen in einer Variable gespeichert werden
MeanMyVector <- mean(MyVector)


# Eine Matrix
# Zeilen (rows) verbinden
MyMatrix <- rbind(MyVector, MyVector, MyVector)
MyMatrix

# Spalten (columns) verbinden
MyMatrix <- cbind(c(1,0,0), c(0,1,0), c(0,1,0))
MyMatrix






## Wichtige Funktionen in R

# Die Klasse einer Variable herausfinden
# Die class() Funktion 
class(Number)
ClassOfNumber <- class(Number)
ClassOfClassOfNumber <- class(ClassOfNumber)
ClassOfClassOfNumber

# Die Hilfe gibt weitere Informationen ueber eine Funktion:
?class
















# Mehrere Werte aneinanderreihen (combine)
1,2,3
# funktioniert nicht
c(1,2,3)
# funktioniert

# Weitere Funktionen
MyVector
mean(MyVector)
?mean
max(MyVector)
?max
?min
?sd
summary(MyVector)
?summary
length(MyVector)
?length










## Rechnen mit R


# Ich kann auch etwas auf einen Variablenwert aufaddieren und dies in der selben Variable speichern
# (der alte Wert ist dann aber geloescht)
Number
Number <- Number + 8
Number




Number <- "3"
Number <- Number + 8
# Das geht nicht
class(Number)

Number <- as.numeric(Number)
# Die Funktion as.numeric() wandelt eine andere Variablenklasse in einen numerischen Wert um

Number <- Number + 8
# Jetzt geht es wieder

as.numeric("a")
# Es muss aber eine moegliche Umformung sein
# NA ist der fehlende Wert in R


# Matrizenrechnung ist auch moeglich
MyMatrix
MyMatrix - 1 

# Ich kann alle Berechnungen in einer neuen Variable speichern
MyNewMatrix <- MyMatrix + 3
class(MyNewMatrix)
MyNewMatrix <- data.frame(MyNewMatrix)
class(MyNewMatrix)
# Wenn man mit (Forschungs-)Datensaetzen arbeitet, bietet es sich meistens an diese als dataframe 
# zu speichern, da bei der Matrix-Klasse alle Werte die gleiche Datenklasse haben muessen
# Fuer Interessierte: Mehr Informationen zu Datentypen gibt es hier (Kapitel 3.6 fuer dataframes): https://adv-r.hadley.nz/vectors-chap.html
















## Uebungsaufgaben
names <- c("Cem", "Bettina", "Hubertus", "Nancy")
gender = factor(c("m", "w", "m", "w"))
age = c(35, 19, 28, 55)
points = c(19, 12, 5, 10)

# Aufgabe 1: Erstelle einen dataframe mit cbind(), der die Variablen names, gender, age und points als 
# Spalten beinhaltet

# Aufgabe 2: Nutze die data.frame(), cbind() und rownames() Funktionen um eine Matrix zu erstellen, die 
# age, gender und points als Spalten enthaelt und names als Zeilennamen. Nutzt die Hilfe um mehr Informationen 
# ueber die rownames() Funktion zu erhalten
?rownames


## Aufrufen einzelner Werte
# Mit Variablenname[Zeile,Spalte] koennen einzelne Werte aufgerufen werden

Datensatz[2,1]
# Ruft den Wert in Zeile 2, Spalte 1 der Variable Datensatz auf

# Das funktioniert auch fuer gesamte Zeilen oder Spalten

Datensatz[2,]
# Ruft alle Werte der zweiten Zeile auf
Datensatz[,2]
# Ruft alle Werte der zweiten Spalte auf

Datensatz["Bettina",]
Datensatz[,"gender"]
# Wenn die Zeilen und/oder Spalten benannt sind, koennen auch die Zeilen- oder Spaltennamen 
# genutzt werden


# Das kann man auch Nutzen um mit der mean() Funktion den Mittelwert einzelner Spalten oder 
# Zeilen aufzurufen
Datensatz
mean(Datensatz[,3])
mean(Datensatz[,"points"])
# Ruft den Mittelwert der dritten Spalte (points) auf




# Aufgabe 3: Ruft nur die Punkte von Hubertus auf
# Aufgabe 4: Ruft den Mittelwert der age-Variable auf

