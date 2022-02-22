# -- Data Prep --
burke = data.frame(With_Inhibitor$`1_S`, With_Inhibitor$`1_v`)
no_inh = data.frame(No_Inhibitor$`1_S`, No_Inhibitor$`1_v`)

# -- Plot --  
plot(burke$With_Inhibitor..1_S., burke$With_Inhibitor..1_v., main="Enzyme Inhibition", xlab="1/[S]",  ylab="1/v", pch=16, col= 'orange', xlim = c(-1.3,1.3), ylim = c(-2e+05,8.5e+05))
points(no_inh$No_Inhibitor..1_S., no_inh$No_Inhibitor..1_v., pch= 16, col = 4)

# -- LM Model --
inh_model = lm(burke$With_Inhibitor..1_v~burke$With_Inhibitor..1_S.)
no_inh_model = lm(no_inh$No_Inhibitor..1_v.~no_inh$No_Inhibitor..1_S.)
abline(inh_model, col="orange3", lwd = 3)
abline(no_inh_model, col = 'blue4', lwd=3)
legend('topleft', legend = c('No Inhibitor', 'With Inhibitor'), col = c('blue4', 'orange3'), lty = 1, bty='n', inset = 0.03, lwd = 3, cex=1.5)

# -- Add zero lines -- 
abline(h = 0, col =8)
abline(v = 0, col =8)

# -- Add circles ---
library(plotrix)
draw.circle(0,1.5e+05,0.04,border= 2,lwd=2)
draw.circle(-0.27,0,0.04,border= 2,lwd=2)
draw.circle(-1.15,0,0.04,border= 2,lwd=2)

# -- Comments ----
segments(-0.4,3.5e+05,-0.035,1.7e+05, lwd =1.5, col = 1, lty=1)
text(-0.5, 4e05, expression('v'['max']*' uneffected'))
text(-0.5, 3.7e05, expression('by inhibition'))
arrows(-1.1,-0.5e05,-0.5,-0.5e05, lwd= 1.5)
text(-0.85, -0.8e05, expression('K'['M']*' increases'))
text(-0.85, -1.1e05, expression('with inhibition'))