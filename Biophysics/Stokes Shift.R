normalize = function(x) {(x-min(x))/(max(x)-min(x))}

matplot(norm_Em_all$Em_16fold.nm, av_em, type = 'l', lty=1, xlim = c(475, 590), ylim = c(0, 1.1), col = c('red3'), lwd =3, main ='Stoke\'s Shift',ylab='Relative Values', xlab = 'Wavelength [nm]')
lines(norm_values, col = 'dodgerblue3', lwd=3)
mtext('of Absorption and Emission Spectrum', line=0.4)
legend('topright', inset=0.04, legend = c('Absorption', 'Emission'), lty = 1, lwd = 3, col = c('dodgerblue3', 'red'), bty='n', cex =1.5)
text(532.5, 1.05 ,'shift of ~25 nm', cex = 1.5)
segments(x0 =521, x1=543, y0=1, lwd = 3)
segments(x0 = 521, y0 =1, y1=-1 ,lty=2, col = 8, lwd = 3)
segments(x0 = 543, y0 =1, y1=-1 ,lty=2, col = 8, lwd = 3)

#max_value for Em = 543nm
#max_value for Ab = 521nm
