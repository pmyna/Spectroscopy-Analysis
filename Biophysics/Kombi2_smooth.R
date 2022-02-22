# Rescaling
res_F_U = apply(Fluor_Urea[191,2:12], 1, rescale)
res_F_G = apply(Fluor_GdmCl[151,2:10], 1, rescale)

#Data Prep
res_F_U = data.frame(res_F_U, conc_F) # at 345.5 nm
res_F_U = res_F_U[1:10,]
res_F_G = data.frame(res_F_G, conc_F2) # at 350.5nm
res_F_G = res_F_G[1:9,]

library(ggplot2)
#Plot
p = ggplot(res_F_U, aes(x = conc_F, y = res_F_U))+ 
  geom_smooth(col = 'orange2', se =F, lwd =1.4)+
  geom_point(col = 'orange3', data = res_F_U, cex = 2)+
  geom_smooth(data = res_F_G, aes(x = conc_F2,y = res_F_G), se = F, lwd=1.4, col = 6)+
  geom_point(data = res_F_G, aes(x = conc_F2, y =res_F_G), col = 'darkviolet', cex = 2)+
  labs(title = "Strength of Denaturants", subtitle = "Comparison of Urea and Guanidinium Chloride", x = "Concentration [M]", y="Relative Unfolding Degree")+
  # white background
  theme_bw()+
  #get rid of grid
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ 
  #adjust Title to the middle
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.subtitle = element_text(hjust = 0.5))


print(p)