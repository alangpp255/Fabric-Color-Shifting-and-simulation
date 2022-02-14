library("ggplot2")
df <- read.csv(file = "C:/Users/Alan/Desktop/Bilab/Weaver/圖像辨識論文/換色/result.csv", encoding="Big5")
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

#TG3D H差異 by color
CarPlot <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = (T_H-H)/180)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot + ggtitle("TG3D Hue差異 by Color")+ ylab("TG3D掃描檔色調差異")

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

#EPSON H差異 by color
CarPlot <- ggplot(data= df ) +
  aes(x = factor(Color),
      y = (E_H-H)/180)+
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean", fill="darkgray") + 
  stat_summary(aes(label=round(..y..,4)), fun=mean, geom="text", size=4,
               vjust = -0.5)
CarPlot + ggtitle("EPSON Hue差異 by Color")+ ylab("EPSON掃描檔色調差異")

#去除極端
df<-df[-3,]
attach(df)


# First scatter plot
#Hue
plot(H, T_H-H, pch=1, lwd=1, xlab="Nike QTX H", ylab="TG3D掃描檔與QTX H 差異")
y=T_H-H
abline(lm(y~H), lwd=2)
title("TG3D 換色色調差~色調(H)", lwd=2)


#saturation
plot(S, TG3D_RMSE, pch=1, lwd=1, xlab="Nike QTX S")
abline(lm(TG3D_RMSE~S), lwd=2)
title("TG3D RMSE~ 飽和度(S)  ", lwd=2)

plot(S, T_S-S, pch=1, lwd=1, xlab="Nike QTX S", ylab="TG3D掃描檔與QTX S 差異")
y=T_S-S
abline(lm(y~S), lwd=2)
title("TG3D 換色飽和度差~飽和度(S)", lwd=2)


#value
plot(V, TG3D_RMSE, pch=1, lwd=1, xlab="Nike QTX V")
abline(lm(TG3D_RMSE~V), lwd=2)
title("TG3D RMSE~ 亮度(V)", lwd=2)

plot(V, (T_V-V)/255, pch=1, lwd=1,xlab="Nike QTX V", ylab="TG3D掃描檔與QTX V 差異")
y=(T_V-V)/255
abline(lm(y~V), lwd=2)
title("TG3D 換色亮度差~亮度(V)", lwd=2)






#saturation
plot(S, EPSON_RMSE, pch=1, lwd=1)
abline(lm(EPSON_RMSE~S), lwd=2)
title("EPSON  RMSE~ 飽和度(S)", lwd=2)

y=(E_S-S)/255
plot(S, y, pch=1, lwd=1, xlab="Nike QTX S", ylab="EPSON掃描檔與QTX S 差異")
abline(lm(y~S), lwd=2)
title("EPSON 換色飽和度差~飽和度(S)", lwd=2)

#Value
plot(V, EPSON_RMSE, pch=1, lwd=1)
abline(lm(EPSON_RMSE~V), lwd=2)
title("EPSON RMSE~ 亮度(V)", lwd=2)

plot(V, (E_V-V)/255, pch=1, lwd=1)
y=(E_V-V)/255
abline(lm(y~V), lwd=2,xlab="Nike QTX V", ylab="EPSON掃描檔與QTX V 差異")
title("EPSON 換色亮度差~亮度(V)", lwd=2)



#regresion
lm <- lm(TG3D_RMSE ~ scale(S) +scale(V))
summary(lm)

lm <- lm(EPSON_RMSE ~ scale(S) +scale(V))
summary(lm)


lm$fitted;		fitted(lm)
lm$residual;	residuals(lm)
qqnorm(residuals(lm), ylab="Residuals")
qqline(residuals(lm))







