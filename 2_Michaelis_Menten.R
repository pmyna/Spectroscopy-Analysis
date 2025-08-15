# --- Import Data --- (Tabellen wie im Skript in Excel erstellt und importiert)
library(readr)
No_Inhibitor <- read_delim("Tables/1 - NI-Messreihe 1 - No Inhibitor.csv", 
                                             ";", escape_double = FALSE, trim_ws = TRUE)
With_Inhibitor <- read_delim("Tables/2 - WI-Messreihe 2 - With Inhibitor.csv", 
                                               ";", escape_double = FALSE, trim_ws = TRUE)
# benötigtes package:
library(drc)

# -- Data Prep --
S = No_Inhibitor$S
v = No_Inhibitor$v
vmax =0.0681


# -- Plot --
mich = data.frame(v, S) # benötigte Spalten in ein Dataframe zusammenkopiert
m1 = drm(v ~ S, data = mich, fct = MM.2()) # nicht-lineares Model für MM-Kurve
plot(m1, log = '', pch = 20, main = "Fitted Michelis Menten Curve", col = 4, lwd=3, xlab = 'Substrate Concentration [µMol]', ylab = 'Reaction Rate [Mol/min]', ylim = c(0.02,0.07))


# -- Plot Labels --
abline(h = max(mich$v), lty=2, col = 8, lwd=2) # linie vmax

# Linien vmax/2 & KM
segments(x0 = 0, x1= 110, y0 = vmax/2, lty = 3, col =8, lwd = 2)
segments(x0 =110, x1=110, y0=0, y1= 0.034, lty = 3, col =8, lwd=2)
segments(x0 = -50, x1 = 81, y0 = 0, y1 = 0.029, lwd = 3, col =4)


text(90, 0.0695, expression('v'['max']), cex = 1.5, col =8, font =2)
text(180, vmax/2-0.002, expression('1/2 v'['max']), cex = 1.5, col =8, font =2)
text(190, 0.02,expression('K'['M']*' ~ 110'), cex = 1.5, col =2)