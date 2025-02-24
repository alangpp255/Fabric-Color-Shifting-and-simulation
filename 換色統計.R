library("ggplot2")
df <- read.csv(file = "C:/Users/Alan/Desktop/Bilab/Weaver/�Ϲ����ѽפ�/����/result.csv", encoding="Big5")
head(df)
attach(df)

#EDA

#TG3D RMSE by color
CarPlot <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = TG3D_RMSE)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot + ggtitle("TG3D AVG RMSE by Color")+ coord_cartesian(ylim=c(0,0.4))+ ylab("RMSE")

#TG3D H�t�� by color
CarPlot <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = (T_H-H)/180)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot + ggtitle("TG3D Hue�t�� by Color")+ ylab("TG3D���y�ɦ�ծt��")

#EPSON RMSE by color
CarPlot2 <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = EPSON_RMSE)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot2 + ggtitle("EPSON AVG RMSE by Color")+ coord_cartesian(ylim=c(0,0.4))+ ylab("RMSE")

#EPSON H�t�� by color
CarPlot <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = (E_H-H)/180)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot + ggtitle("EPSON Hue�t�� by Color")+ ylab("EPSON���y�ɦ�ծt��")

#�h������
df<-df[-3,]
attach(df)


# First scatter plot
#Hue
plot(H, T_H-H, pch=1, lwd=1, xlab="Nike QTX H", ylab="TG3D���y�ɻPQTX H �t��")
y=T_H-H
abline(lm(y~H), lwd=2)
title("TG3D �����ծt~���(H)", lwd=2)


#saturation
plot(S, TG3D_RMSE, pch=1, lwd=1, xlab="Nike QTX S")
abline(lm(TG3D_RMSE~S), lwd=2)
title("TG3D RMSE~ ���M��(S)  ", lwd=2)

plot(S, T_S-S, pch=1, lwd=1, xlab="Nike QTX S", ylab="TG3D���y�ɻPQTX S �t��")
y=T_S-S
abline(lm(y~S), lwd=2)
title("TG3D ���⹡�M�׮t~���M��(S)", lwd=2)


#value
plot(V, TG3D_RMSE, pch=1, lwd=1, xlab="Nike QTX V")
abline(lm(TG3D_RMSE~V), lwd=2)
title("TG3D RMSE~ �G��(V)", lwd=2)

plot(V, (T_V-V)/255, pch=1, lwd=1,xlab="Nike QTX V", ylab="TG3D���y�ɻPQTX V �t��")
y=(T_V-V)/255
abline(lm(y~V), lwd=2)
title("TG3D ����G�׮t~�G��(V)", lwd=2)






#saturation
plot(S, EPSON_RMSE, pch=1, lwd=1)
abline(lm(EPSON_RMSE~S), lwd=2)
title("EPSON  RMSE~ ���M��(S)", lwd=2)

y=(E_S-S)/255
plot(S, y, pch=1, lwd=1, xlab="Nike QTX S", ylab="EPSON���y�ɻPQTX S �t��")
abline(lm(y~S), lwd=2)
title("EPSON ���⹡�M�׮t~���M��(S)", lwd=2)

#Value
plot(V, EPSON_RMSE, pch=1, lwd=1)
abline(lm(EPSON_RMSE~V), lwd=2)
title("EPSON RMSE~ �G��(V)", lwd=2)

plot(V, (E_V-V)/255, pch=1, lwd=1)
y=(E_V-V)/255
abline(lm(y~V), lwd=2,xlab="Nike QTX V", ylab="EPSON���y�ɻPQTX V �t��")
title("EPSON ����G�׮t~�G��(V)", lwd=2)



#regresion
lm <- lm(TG3D_RMSE ~ scale(S) +scale(V))
summary(lm)

lm <- lm(EPSON_RMSE ~ scale(S) +scale(V))
summary(lm)


lm$fitted;		fitted(lm)
lm$residual;	residuals(lm)
qqnorm(residuals(lm), ylab="Residuals")
qqline(residuals(lm))







