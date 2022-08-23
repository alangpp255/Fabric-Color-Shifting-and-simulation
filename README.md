# fabric_color_shift

### Objectives:  
Simulate the pattern of the cloth after color changing

### Methods:  
Use the KD-tree classification method to find the main color position of the objective fabric, and then adjust the color of each classified pixel point
1. Objective Fabrics:  
![image](https://user-images.githubusercontent.com/86472351/153798289-6ad84330-849e-48a6-bf8d-2d93f7a13ca1.png)  
2. main colors:  
![image](https://user-images.githubusercontent.com/86472351/153798140-ce385557-2411-487e-bc3e-2c112f25e33b.png)  
3. The position identified  KD-tree:  
![image](https://user-images.githubusercontent.com/86472351/153798204-a23d8efe-5c31-4792-bc6f-1ceeb47af314.png)  

4. Calculate HSV color space Differences:  
![image](https://user-images.githubusercontent.com/86472351/153798404-aa9a9c4b-6e02-4df9-a68d-6efc06155dc2.png)
![image](https://user-images.githubusercontent.com/86472351/153798545-9cfa49a9-1a28-47bf-af22-010fa99ed692.png)

5. Adjust the color according to the recognized position

### Outcome 
![image](https://user-images.githubusercontent.com/86472351/153798702-c24b6b2e-ecc4-4b85-be6c-6d4e88bc2b83.png)  
PPT: https://docs.google.com/presentation/d/1Jb20ELxFrx3rhvVg4niJpuYPqwpMWSJk/edit?usp=sharing&ouid=101846707532909146197&rtpof=true&sd=true  





### Dataset Link:  
https://drive.google.com/drive/folders/1pCbm_5bAt-eo5OD7rg2Aa69tab6fd-Dm?usp=sharing
