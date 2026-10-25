# Final Challenges

<img width="808" height="1187" alt="image" src="https://github.com/user-attachments/assets/e327be8c-c302-48d4-b766-023986a2ed8e" />
<img width="716" height="1402" alt="image" src="https://github.com/user-attachments/assets/6a2ce09f-f87c-40d5-8b27-9cd04731bfe3" />
<img width="1632" height="1407" alt="image" src="https://github.com/user-attachments/assets/d364980b-a99c-45be-ab71-44da425e4395" />
<img width="2177" height="1436" alt="image" src="https://github.com/user-attachments/assets/56195251-e6b4-4998-980a-47aa14cb3a76" />


```sh
#!/bin/bash

# Loop through all files in the downloads directory
for file in downloads/*; do
    
    # Ensure it's a file, not a directory
    if [ -f "$file" ]; then
        
        # Extract just the filename from the path
        filename=$(basename "$file")
        
        # Extract the extension from the filename
        ext="${filename##*.}"
        
        # Create a folder for that extension inside downloads if it doesn't exist
        mkdir -p "downloads/$ext"
        
        # Move the file into its corresponding extension folder
        mv "$file" "downloads/$ext/"
        
        # Print the exact required output message
        echo "Moved $filename to $ext/"
    fi
done
```

<img width="1367" height="1382" alt="image" src="https://github.com/user-attachments/assets/600f209c-35a8-4c48-858c-67e1db24de74" />
<img width="2028" height="1417" alt="image" src="https://github.com/user-attachments/assets/8dfa3b68-a1fd-46fd-9fa6-05b7445f7a99" />
<img width="2092" height="1436" alt="image" src="https://github.com/user-attachments/assets/bd591660-5a52-4282-892c-559865838bcd" />
<img width="2217" height="1437" alt="image" src="https://github.com/user-attachments/assets/0d1e6161-313b-427a-ac63-239fe141c1ee" />



## Word Frequency Counter

<img width="2112" height="1436" alt="image" src="https://github.com/user-attachments/assets/b2fa8ae2-ce1c-4be5-a537-7d3134d5134a" />
<img width="672" height="962" alt="image" src="https://github.com/user-attachments/assets/31a0be0f-c704-4bab-9f53-d28968cdac70" />

```sh
cat article.txt | tr ' ' '\n' | sort | uniq -c | sort -rn
```


<img width="2417" height="1437" alt="image" src="https://github.com/user-attachments/assets/608e95fc-263f-447b-8cbc-1b5db6820fe6" />
<img width="2111" height="1431" alt="image" src="https://github.com/user-attachments/assets/d12af03a-fee6-42d0-ad52-6b35c3b4c8fe" />


## System Health Checker

<img width="1255" height="1077" alt="image" src="https://github.com/user-attachments/assets/81fe33ec-4dbf-41bc-97f3-bd223dbbbdb5" />
<img width="2095" height="1172" alt="image" src="https://github.com/user-attachments/assets/56d7004e-f5d6-47b8-98ae-02d2abe22b82" />
<img width="2080" height="1410" alt="image" src="https://github.com/user-attachments/assets/fe096f49-fe04-4cdd-99e7-4aada1a39b01" />
<img width="1238" height="917" alt="image" src="https://github.com/user-attachments/assets/7d00d972-f583-48d5-af0e-0f7534e3a610" />
<img width="1056" height="920" alt="image" src="https://github.com/user-attachments/assets/1e18b4b1-cbfa-4998-8eca-e9ca2d0c832b" />
<img width="2240" height="1431" alt="image" src="https://github.com/user-attachments/assets/f1ed11b2-7183-42e6-9f5e-34af257471bf" />
<img width="2066" height="1435" alt="image" src="https://github.com/user-attachments/assets/b71f522e-0e19-4c86-ad60-e66fa98c561d" />

<img width="805" height="1387" alt="image" src="https://github.com/user-attachments/assets/705c7fab-741b-457c-afc6-772dda2849e2" />









