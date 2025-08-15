# Import Data
library(readr)
Det_Buffer_6M <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Entfaltungspuffer_6M_GdmCl.csv")
Ntrl_Buffer <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_GlycineBuffer.csv")
Lys_Det_6M <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_entfaltet_verduennt.csv")
Lys_Stock <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_native_stock.csv")
Lys_Ntrl_20mM <- read_csv("~/Desktop/Biophysik/Module 2/Experiment 2/Data/Grp1_Lysozyme_native_verduennt.csv")

# Data Cleansing
Lys_Ntrl_20mM$Absorbance = Lys_Ntrl_20mM$Absorbance-Ntrl_Buffer$Absorbance
Lys_Det_6M$Absorbance = Lys_Det_6M$Absorbance-Det_Buffer_6M$Absorbance
Lys_Det_6M = Lys_Det_6M[1:140,]
Lys_Stock = Lys_Stock[1:146,]

# Plot
plot(Lys_Ntrl_20mM$Wavelength, Lys_Ntrl_20mM$Absorbance, type = 'l', main = 'Absorption of Lysozyme', xlab = "Wavelength [nm]", ylab = 'Absorption [a.u.]', col = 'green3', ylim =c(-0.05,1.3), xlim = c(205, 305), lwd=3)
lines(Lys_Det_6M$Wavelength, Lys_Det_6M$Absorbance, col = 'orange2', lwd=3)
lines(Lys_Stock$Wavelength, Lys_Stock$Absorbance, col = 'blue3', lwd=3)

# Plot Labels
abline(v = min(Lys_Det_6M$Wavelength), col=2, lwd = 3)
legend('topright', inset = 0.03, bty='n', legend=c('Concentrated Solution','+ 20 mM Glycin pH 2.5', '+ 6 M GdnHCl/GdmCl'), lty=1, lwd=3, col = c('blue3','green3', 'orange2'), cex =1.4)
text(218, 0.8,'HV > 900', col =2, cex=1.5, font =2)
mtext('Comparison of Stock, Neutral Buffer and Denaturation Buffer', line = 0.4)
mtext('211',1, at=211, line =1, col=2)
axis(1, 211, labels = FALSE, col =2)
segments(280, -1, 280, 0.185, lty = 2, col = 8, lwd=2)
