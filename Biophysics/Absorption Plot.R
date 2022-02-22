# --- PLot ---
plot(`2fold`, type='l', lwd= 3, col = '7', main = 'Absorption Spectrum of Dye', ylab= 'Absorption [a.u.]', xlab ='Wavelength [nm]')
lines(`4fold`, lwd = 3, col = '3')
lines(`8fold`, lwd = 3, col = '4')
lines(`16fold`, lwd = 3, col = '5')
lines(`32fold`, lwd = 3, col = '6')

# --- Add-Ons ---
two_fold = `2fold`
abline(v = two_fold$nm[which.max(two_fold$Abs)], lwd = 2, col = 8)
text(480, 2.7, expression(paste('A'['max']*' = 520 nm')), cex = 1.5)
mtext('Two-fold Dilution Series', line = 0.4)
text(570, 2.5, '[1:2]', col = 7, cex = 1.5, font = 2)
text(570, 1.5, '[1:4]', col = 3, cex = 1.5,font = 2)
text(570, 0.9, '[1:8]', col = 4, cex = 1.5,font = 2)
text(570, 0.55, '[1:16]', col = 5, cex = 1.5,font = 2)
text(570, 0.2, '[1:32]', col = 6, cex = 1.5,font = 2)

