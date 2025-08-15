# Rescaling
res_F_U = apply(Fluor_Urea[191,2:12], 1, rescale)
res_CD = data.frame(apply(B_H0_CD[,2], 2, rescale),apply(B_H1_CD[,2], 2, rescale), apply(B_H2_CD[,2], 2, rescale), apply(B_H3_CD[,2], 2, rescale), apply(B_H4_CD[,2], 2, rescale), apply(B_H5_CD[,2], 2, rescale), apply(B_H6_CD[,2], 2, rescale), apply(B_H7_CD[,2], 2, rescale), apply(B_H8_CD[,2], 2, rescale),apply(B_H9_CD[,2], 2, rescale))

#Data Prep
res_F_U = data.frame(res_F_U, conc_F) # at 345 nm
res_F_U = res_F_U[1:10,]
res_CD_79 = res_CD[75,] # at 223 nm
res_CD_79 = t(res_CD_79)
res_CD_79 = data.frame(res_CD_79, conc_CD)

library(ggplot2)
#Plot
p = ggplot(res_F_U, aes(x = conc_F, y =res_F_U))+ 
    geom_smooth(col = 'green3', se =F, lwd =1.4)+
    geom_smooth(data = res_CD_79, aes(x = conc_CD,y = X75), se = F, lwd=1.4, col = 4)+
    labs(title = "Comparison of Measurement Methods", subtitle = "Denaturation Curves of Fluorescence and CD Spectrum", x = "Concentration [M]", y="Relative Unfolding Degree")+
    # white background
    theme_bw()+
    #get rid of grid
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ 
    #adjust Title to the middle
    theme(plot.title = element_text(hjust = 0.5))+
    theme(plot.subtitle = element_text(hjust = 0.5))+
    scale_x_continuous(n.breaks = 10)
    

print(p)
