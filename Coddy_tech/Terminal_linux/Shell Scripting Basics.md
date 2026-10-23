# Shell Scripting Basics

<img width="836" height="1172" alt="image" src="https://github.com/user-attachments/assets/dad8a640-fd5f-4942-8540-ad364d3916dc" />
<img width="730" height="972" alt="image" src="https://github.com/user-attachments/assets/d17b52b7-1bc9-46f0-ae8f-4ec7df65e559" />
<img width="2116" height="1100" alt="image" src="https://github.com/user-attachments/assets/0fde2b3f-fbff-4dc0-838a-71ec9a28d887" />
<img width="992" height="1042" alt="image" src="https://github.com/user-attachments/assets/a85ba1cf-4969-453f-be27-2d4c52529579" />
<img width="1017" height="1045" alt="image" src="https://github.com/user-attachments/assets/94964f6f-b201-4f70-a088-93cf6230a8c2" />  
<img width="1012" height="1032" alt="image" src="https://github.com/user-attachments/assets/fc1cd090-703d-4a62-9c1e-100a7fef5d38" />
<img width="967" height="1030" alt="image" src="https://github.com/user-attachments/assets/05cb3aac-94e0-4a33-9486-e12ee7dfcf2c" />
<img width="731" height="966" alt="image" src="https://github.com/user-attachments/assets/c246aabf-967e-4427-a334-199ed9b836d5" />
<img width="1522" height="1026" alt="image" src="https://github.com/user-attachments/assets/21e78a96-d5ca-4d05-bba1-228dfc6265e2" />
<img width="2142" height="1143" alt="image" src="https://github.com/user-attachments/assets/d1c7be49-04d1-4cf6-ab7e-af69c78eb19c" />
<img width="722" height="1115" alt="image" src="https://github.com/user-attachments/assets/87d7f3a7-2dea-4869-b5bc-1a7302b00abf" />
<img width="2001" height="1097" alt="image" src="https://github.com/user-attachments/assets/2e70d479-01b3-491f-b32d-04bdc523c8ba" />
<img width="1057" height="1042" alt="image" src="https://github.com/user-attachments/assets/15ea668a-5659-42ba-a016-8fd7ac819912" />
<img width="1057" height="1062" alt="image" src="https://github.com/user-attachments/assets/dd14c189-4630-4264-a81b-47b743f4c91e" />
<img width="1015" height="1067" alt="image" src="https://github.com/user-attachments/assets/ef1b21af-bd13-4a90-a055-7bd839ed811f" />
<img width="1072" height="1037" alt="image" src="https://github.com/user-attachments/assets/15bf17e0-0350-4c36-a720-8f38b428e1fa" />
<img width="1027" height="1056" alt="image" src="https://github.com/user-attachments/assets/c1d54103-2ce0-43de-8349-12394d3ed322" />
<img width="1037" height="1037" alt="image" src="https://github.com/user-attachments/assets/5328d53f-feab-4a28-bdc1-090d5194bce8" />
<img width="1947" height="1200" alt="image" src="https://github.com/user-attachments/assets/673e0008-95d2-4c3c-9d40-72b7d23617ac" />


## Variables In Scripts

<img width="742" height="1142" alt="image" src="https://github.com/user-attachments/assets/2f97ad28-bd1e-4ee5-ac72-0ad6aed931ed" />
<img width="1062" height="1045" alt="image" src="https://github.com/user-attachments/assets/937258a7-0456-452f-b3f2-2c7f31042ca0" />
<img width="1117" height="1066" alt="image" src="https://github.com/user-attachments/assets/d287df75-0a04-4de1-bce3-11ebe155223b" />
<img width="980" height="1022" alt="image" src="https://github.com/user-attachments/assets/d4d9748a-a7f9-4216-a64f-cc5287c29e6b" />
<img width="1052" height="1037" alt="image" src="https://github.com/user-attachments/assets/0af65f70-1116-4a29-b14e-659790f242d9" />
<img width="1073" height="1056" alt="image" src="https://github.com/user-attachments/assets/b9e2b062-5b82-47c8-a89c-7ad77959919b" />
<img width="722" height="1215" alt="image" src="https://github.com/user-attachments/assets/852d8f14-ab16-4ddb-83ea-bd043d37a53d" />
<img width="2000" height="1437" alt="image" src="https://github.com/user-attachments/assets/1e98ca45-afce-476f-9976-133e21e66dca" />

## User Input in Scripts

<img width="740" height="1110" alt="image" src="https://github.com/user-attachments/assets/2b220a86-264a-4669-8219-e2be367c5a51" />
<img width="1037" height="1037" alt="image" src="https://github.com/user-attachments/assets/3e50509a-2378-4fa5-aa28-9b06d3524cc9" />
<img width="1021" height="1055" alt="image" src="https://github.com/user-attachments/assets/1588f87b-5b09-4321-b996-7ab296ede272" />
<img width="1027" height="1032" alt="image" src="https://github.com/user-attachments/assets/ac6f01bc-c415-439d-b231-7fba5f388687" />
<img width="1042" height="1047" alt="image" src="https://github.com/user-attachments/assets/02959075-bd4a-4045-b0ae-19b483ff5fd3" />
<img width="1008" height="1046" alt="image" src="https://github.com/user-attachments/assets/908183e0-193d-4ac3-823d-8599124e4a09" />
<img width="1087" height="1357" alt="image" src="https://github.com/user-attachments/assets/ab9b779c-04ca-4b9a-abaa-dbeea01d7ad2" />


```sh
user:/home$ touch greeter.sh
user:/home$ echo '#/bin/bash' > greeter.sh
user:/home$ echo 'read -p "What is your favorite color? " color' >> greeter.sh
user:/home$ echo "Nice! $color is a great color!" >> greeter.sh
user:/home$ cat greeter.sh
#/bin/bash
read -p "What is your favorite color? " color
Nice!  is a great color!
user:/home$ echo "blue" | ./greeter.sh
sh: ./greeter.sh: Permission denied
user:/home$ chmod 400 ./greeter.sh
user:/home$ ls -l
total 4
-r-------- 1 1097 1097 82 Oct 21 15:32 greeter.sh
user:/home$ ls -ll
total 4
-r-------- 1 1097 1097 82 Oct 21 15:32 greeter.sh
user:/home$ ls -a
.
..
.cache
.tmp
greeter.sh
user:/home$ ls
greeter.sh
user:/home$ chmod +x ./greeter.sh
user:/home$ ls -l
total 4
-r-x--x--x 1 1097 1097 82 Oct 21 15:32 greeter.sh
user:/home$ 
```

<img width="1975" height="927" alt="image" src="https://github.com/user-attachments/assets/3d2529b3-8e45-43ba-b7d7-83fbfccbcc7a" />
<img width="2023" height="1211" alt="image" src="https://github.com/user-attachments/assets/b9095968-4055-41be-bf90-9da73c75c539" />


## If Statement

<img width="737" height="1232" alt="image" src="https://github.com/user-attachments/assets/63cbe707-164c-435a-9bb2-829d4c7f24cb" />
<img width="995" height="1025" alt="image" src="https://github.com/user-attachments/assets/d1da1a6e-e4a8-41dc-811d-72d732dd7644" />
<img width="1011" height="1033" alt="image" src="https://github.com/user-attachments/assets/983f8c95-b62d-417d-b44d-efe0deb8d3e6" />
<img width="972" height="1022" alt="image" src="https://github.com/user-attachments/assets/84e29c63-788a-4e39-aee1-20f4286303ad" />
<img width="1037" height="1036" alt="image" src="https://github.com/user-attachments/assets/e93db176-d586-4815-9dfa-7ffa1beb74e8" />
<img width="1041" height="1030" alt="image" src="https://github.com/user-attachments/assets/77715ebf-516d-4f12-bf0a-a713ed54a023" />
<img width="1000" height="1042" alt="image" src="https://github.com/user-attachments/assets/0e4f4c3c-5dca-4dad-963d-d24ce9eb24f8" />
<img width="1002" height="1011" alt="image" src="https://github.com/user-attachments/assets/6df305fa-e26a-4e6e-bfef-640a699e090b" />
<img width="626" height="502" alt="image" src="https://github.com/user-attachments/assets/100cbc46-17a4-436e-b0b1-797ad05a4ba6" />
<img width="1563" height="1052" alt="image" src="https://github.com/user-attachments/assets/c5e282d0-274e-48f4-b60c-9bd9af53495d" />
<img width="1475" height="1106" alt="image" src="https://github.com/user-attachments/assets/bed2e3a3-5006-4dd2-a55e-896a769d903f" />
<img width="1528" height="1437" alt="image" src="https://github.com/user-attachments/assets/c11ec53e-b29b-4aee-8bd1-1e720993677c" />


## For Loop







---
