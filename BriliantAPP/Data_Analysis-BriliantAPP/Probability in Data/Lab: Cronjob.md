# Lab: Cronjob

<img width="1570" height="1067" alt="image" src="https://github.com/user-attachments/assets/25f7d8c3-5788-44da-9aec-dbc219fc639a" />

<img width="1016" height="703" alt="image" src="https://github.com/user-attachments/assets/d77ed259-f3d3-447a-a31c-8ab9c5a0c396" />
<img width="1912" height="737" alt="image" src="https://github.com/user-attachments/assets/0f39a7c4-fb14-49fb-894b-53f5f01062ef" />
<img width="1020" height="738" alt="image" src="https://github.com/user-attachments/assets/a26821cd-b4e6-4109-81cf-39d971832c32" />
<img width="1867" height="753" alt="image" src="https://github.com/user-attachments/assets/6f23b62f-9b13-4bfa-8fda-4ea3f62413ef" />
<img width="985" height="675" alt="image" src="https://github.com/user-attachments/assets/d5527f56-f706-4141-adc4-061dbe6c7b7b" />
<img width="1007" height="366" alt="image" src="https://github.com/user-attachments/assets/1d226f84-3c15-432f-89a6-849b5039013d" />
<img width="1912" height="822" alt="image" src="https://github.com/user-attachments/assets/d39fab4e-26e2-43e8-955a-6c5bd1b9f12f" />
<img width="1058" height="866" alt="image" src="https://github.com/user-attachments/assets/c78a877f-a520-4521-9cd9-8c7725025da5" />
<img width="1060" height="645" alt="image" src="https://github.com/user-attachments/assets/bf011d98-997e-471e-9639-5f515a22fb05" />

Inspect the cronjobs scheduled.
The Day of the Week (5th column) should be Tuesday = 2

The hour(2nd column) should be 11 PM = 23

The minute (1st column) should be 11 minutes = 11

This transalates to 11 23 * * 2. The script that runs at this specific schedule is /usr/local/bin/system-identifier.sh

Bonus Hint: Use this handy site to predict a outcome of a Cron configuration:
https://cronjob.xyz/
<img width="1943" height="967" alt="image" src="https://github.com/user-attachments/assets/bf93f285-cc98-41e4-b70a-fc9f4cfbb03f" />
<img width="1045" height="611" alt="image" src="https://github.com/user-attachments/assets/5e007a26-55a4-4343-963c-b131a0a9af0a" />
<img width="1772" height="663" alt="image" src="https://github.com/user-attachments/assets/df0df81d-21cd-43b8-9812-b9e56df8dfe0" />

Use: Run crontab -e. This will open the crontab in the VI Editor. Add the below line to the file:
0 6 1 * * /usr/local/bin/last-reboot.sh

<img width="1782" height="787" alt="image" src="https://github.com/user-attachments/assets/8b1e92d6-893c-4716-87bf-d083aed66246" />
<img width="1007" height="735" alt="image" src="https://github.com/user-attachments/assets/ac4e4fd6-b021-4b43-abfb-b9a4ee20d89c" />
<img width="1027" height="602" alt="image" src="https://github.com/user-attachments/assets/be43bd13-1116-4f57-bca7-3a0fc724d85c" />
The first column is 11 = 11th minute

The second column is 23 = 11 PM

The third column is * = every day in a month (1st to the last day of the month)

The fourth column is 2 = only the month of February

The fifth column is * = every day if the week (Monday to Sunday)

This means the script will run at 11 minutes past 11 PM on all days in the month of February

<img width="1852" height="923" alt="image" src="https://github.com/user-attachments/assets/669be473-c4b9-4a56-b0db-62051cf5d5e9" />
<img width="1026" height="646" alt="image" src="https://github.com/user-attachments/assets/5b920bc0-5692-4cf6-aeac-171a4a939680" />

<img width="1002" height="682" alt="image" src="https://github.com/user-attachments/assets/915248e5-5d0e-46be-be2d-f62b8069e2bc" />

<img width="1005" height="441" alt="image" src="https://github.com/user-attachments/assets/29454fe9-27fb-4107-b2bc-0ec86e487cd8" />

Use Step values for the minute column = */30 OR

Specify the minute column as 00,30 both of which mean at minute zero then minute 30.
To sum up, add this to the crontab:
*/30 * * * * /usr/local/bin/system-debugger.sh


**original file**
11 11 * * 3 /usr/local/bin/system-reporter.sh
23 11 * * 2 /usr/local/bin/system-checker.sh
23 23 * * 2 /usr/local/bin/system-debugger.sh
11 23 * * * /usr/local/bin/system-tester.sh
11 23 * 2 * /usr/local/bin/system-troubleshooter.sh
11 23 * * 2 /usr/local/bin/system-identifier.sh
0 6 1 * * /usr/local/bin/last-reboot.sh

**Edited file**
11 11 * * 3 /usr/local/bin/system-reporter.sh
23 11 * * 2 /usr/local/bin/system-checker.sh
*/30 * * * * /usr/local/bin/system-debugger.sh
11 23 * * * /usr/local/bin/system-tester.sh
11 23 * 2 * /usr/local/bin/system-troubleshooter.sh
11 23 * * 2 /usr/local/bin/system-identifier.sh
0 6 1 * * /usr/local/bin/last-reboot.sh
<img width="1831" height="518" alt="image" src="https://github.com/user-attachments/assets/1d1b2125-aaf3-4d97-b11d-cd4d1a7c3293" />

<img width="1918" height="740" alt="image" src="https://github.com/user-attachments/assets/bfdb19f1-8757-4cd1-9d15-8422950b5f6b" />
