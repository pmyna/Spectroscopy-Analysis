# Import Data
library(readr)
Det_Buffer_6M <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Entfaltungspuffer_6M_GdmCl.csv")
Ntrl_Buffer <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_GlycineBuffer.csv")
Lys_Det_6M <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_entfaltet_verduennt.csv")
Lys_Stock <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_native_stock.csv")
Lys_Ntrl_20mM <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_native_verduennt.csv")

# Data Cleansing
Lys_Ntrl_20mM$CircularDichroism = Lys_Ntrl_20mM$CircularDichroism-Ntrl_Buffer$CircularDichroism
Lys_Det_6M$CircularDichroism = Lys_Det_6M$CircularDichroism-Det_Buffer_6M$CircularDichroism
Lys_Det_6M = Lys_Det_6M[1:140,]
Lys_Stock = Lys_Stock[1:146,]

# Plot
plot(Lys_Ntrl_20mM$Wavelength, Lys_Ntrl_20mM$CircularDichroism, type = 'l', main = 'Circular Dichroism of Lysozyme', xlab = "Wavelength [nm]", ylab = '', col = 'green3', xlim= c(194, 270),ylim = c(-70,30), lwd=3)
lines(Lys_Det_6M$Wavelength, Lys_Det_6M$CircularDichroism, col = 'orange2', lwd=3)
lines(Lys_Stock$Wavelength, Lys_Stock$CircularDichroism, col = 'blue3', lwd=3)
title(ylab = expression(Phi), line = 2.4)

# Plot Labels
legend('topright', inset = 0.04, bty='n', legend=c('Concentrated Solution','+ 20 mM Glycin pH 2.5', '+ 6 M GdnHCl/GdmCl'), lty=1, lwd=3, col = c('blue3','green3','orange2'), cex =1.4)
segments(x0 = min(Lys_Det_6M$Wavelength), y0 = 2, y1=-11, col=2, lwd = 3)
text(207, 0.5,'HV > 900', col =2, cex=1.4, font =2)
segments(x0 = min(Lys_Stock$Wavelength), y0 = -71, y1=-58, col=2, lwd = 3)
text(201, -60,'HV > 900', col =2, cex=1.4, font =2)
mtext('Comparison of Stock, Neutral Buffer and Denaturation Buffer', line = 0.4)
text(249,-32,expression(paste(alpha, '-helix')), cex=1.7)
segments(x0 = 234.8, x1= 245, y0=-20, y1 = -30, lwd =2)

# Error Bars
arrows(x0 = 229, y0=-34, y1 = -41, code =3, angle=90, length = 0.1, lwd = 2)
arrows(x0 = 207, y0=-64.5, y1 = -71.5, code =3, angle=90, length = 0.1, lwd = 2)
arrows(x0 = 229, y0=-6, y1 = -13, code =3, angle=90, length = 0.1, lwd = 2)
arrows(x0 = 207, y0=-12.5, y1 = -19.5, code =3, angle=90, length = 0.1, lwd = 2)
arrows(x0 = 192, y0=23.5, y1 =16.5, code =3, angle=90, length = 0.1, lwd = 2)