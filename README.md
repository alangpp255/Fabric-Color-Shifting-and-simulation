# fabric_color_shift

### 研究目標:  
模擬布料換色後的圖樣  

### 研究方法:  
利用KD-tree分類法，找到預換色布料的主色位置，再將每個分類完的像素點進行顏色調整 
1. 預換色布料:  
![image](https://user-images.githubusercontent.com/86472351/153798289-6ad84330-849e-48a6-bf8d-2d93f7a13ca1.png)  
2. 主色:  
![image](https://user-images.githubusercontent.com/86472351/153798140-ce385557-2411-487e-bc3e-2c112f25e33b.png)  
3. KD-tree辨識位置:  
![image](https://user-images.githubusercontent.com/86472351/153798204-a23d8efe-5c31-4792-bc6f-1ceeb47af314.png)  

4. 計算HSV差異:  
![image](https://user-images.githubusercontent.com/86472351/153798404-aa9a9c4b-6e02-4df9-a68d-6efc06155dc2.png)
![image](https://user-images.githubusercontent.com/86472351/153798545-9cfa49a9-1a28-47bf-af22-010fa99ed692.png)

5. 依照辨識的位置調整顏色

### 研究結果
![image](https://user-images.githubusercontent.com/86472351/153798702-c24b6b2e-ecc4-4b85-be6c-6d4e88bc2b83.png)





### 資料集連結:  
https://drive.google.com/drive/folders/1pCbm_5bAt-eo5OD7rg2Aa69tab6fd-Dm?usp=sharing
