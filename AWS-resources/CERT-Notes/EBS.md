<img width="2507" height="950" alt="image" src="https://github.com/user-attachments/assets/5d5f0b49-215a-4854-97db-52c5f089f747" />

Based on the image and transcript provided, here are the key takeaways regarding Amazon EBS (Elastic Block Store) volumes:   
- **Availability Zone Lock:** EBS volumes are strictly linked to a specific Availability Zone (AZ) and cannot be moved to a different AZ without being recreated.  
- **Attachment Limits:** Typically, one EBS volume can only be attached to a single EC2 instance at a time.  
- **Multiple Volumes per Instance:** You can attach multiple EBS volumes to a single EC2 instance, similar to plugging multiple USB sticks into one machine.  
- **Multi-Attach Exception:** Some specialized EBS volume types allow for "Multi-Attach," which permits connecting a single volume to multiple instances in the same AZ.   


<img width="452" height="692" alt="image" src="https://github.com/user-attachments/assets/8b4c485a-2b95-4594-9bee-f1ba47029395" />
<img width="2527" height="1386" alt="image" src="https://github.com/user-attachments/assets/c83da000-776a-44cb-afdc-3bcbe3359c18" />
