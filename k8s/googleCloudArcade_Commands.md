# Commands to remember:

kubectl get nodes

kubectl apply -f release/kubernetes-manifests.yaml

kubectl get pods


curl -o /dev/null -s -w "%{http_code}\n"  http://${EXTERNAL_IP}

student_01_02ea6d1de01c@cloudshell:~/microservices-demo (qwiklabs-gcp-03-ce76d0050505)$ curl -o /dev/null -s -w "%{http_code}\n"  http://34.85.251.79
200
student_01_02ea6d1de01c@cloudshell:~/microservices-demo (qwiklabs-gcp-03-ce76d0050505)$ 



**[Creating a Persistent Disk](https://www.skills.google/games/6878/labs/42728)**

gcloud compute instances create gcelab --zone $ZONE --machine-type e2-standard-2

gcloud compute disks create mydisk --size=200GB \
--zone $ZONE


gcloud compute instances attach-disk gcelab --disk mydisk --zone $ZONE

gcloud compute ssh --zone "us-east4-c" "gcelab" --project "qwiklabs-gcp-00-ae0ad68a8898"


gcloud compute ssh gcelab --zone $ZONE


student-01-a4de3a29d738@gcelab:~$ ls -l /dev/disk/by-id/
total 0
lrwxrwxrwx 1 root root  9 Nov 17 08:27 google-persistent-disk-0 -> ../../sda
lrwxrwxrwx 1 root root 10 Nov 17 08:27 google-persistent-disk-0-part1 -> ../../sda1
lrwxrwxrwx 1 root root 11 Nov 17 08:27 google-persistent-disk-0-part14 -> ../../sda14
lrwxrwxrwx 1 root root 11 Nov 17 08:27 google-persistent-disk-0-part15 -> ../../sda15
lrwxrwxrwx 1 root root  9 Nov 17 08:27 google-persistent-disk-1 -> ../../sdb
lrwxrwxrwx 1 root root  9 Nov 17 08:27 scsi-0Google_PersistentDisk_persistent-disk-0 -> ../../sda
lrwxrwxrwx 1 root root 10 Nov 17 08:27 scsi-0Google_PersistentDisk_persistent-disk-0-part1 -> ../../sda1
lrwxrwxrwx 1 root root 11 Nov 17 08:27 scsi-0Google_PersistentDisk_persistent-disk-0-part14 -> ../../sda14
lrwxrwxrwx 1 root root 11 Nov 17 08:27 scsi-0Google_PersistentDisk_persistent-disk-0-part15 -> ../../sda15
lrwxrwxrwx 1 root root  9 Nov 17 08:27 scsi-0Google_PersistentDisk_persistent-disk-1 -> ../../sdb
student-01-a4de3a29d738@gcelab:~$ 


<img width="882" height="677" alt="image" src="https://github.com/user-attachments/assets/f2efc59d-9b22-4e32-a7d1-e560d3b82fba" />

<img width="1123" height="966" alt="image" src="https://github.com/user-attachments/assets/ecd7d056-7eda-41f0-b74e-4a6780f10db8" />


[Hello Node Kubernetes](https://www.skills.google/games/6878/labs/42729)
<img width="643" height="1292" alt="image" src="https://github.com/user-attachments/assets/a4939356-ddb7-491c-8ac9-4c4185d8ad7d" />


docker build -t hello-node:v1 .

docker run -d -p 8080:8080 hello-node:v1

curl http://localhost:8080

docker ps

docker stop [CONTAINER ID]

gcloud artifacts repositories create my-docker-repo \
    --repository-format=docker \
    --location=us-east1 \
    --project=qwiklabs-gcp-01-79f3fdf7db55


gcloud auth configure-docker

docker tag hello-node:v1 us-east1-docker.pkg.dev/qwiklabs-gcp-01-79f3fdf7db55/my-docker-repo/hello-node:v1

docker push us-east1-docker.pkg.dev/qwiklabs-gcp-01-79f3fdf7db55/my-docker-repo/hello-node:v1

gcloud config set project PROJECT_ID

gcloud container clusters create hello-world \
                --num-nodes 2 \
                --machine-type e2-medium \
                --zone "us-east1-c"



**Task 4. Create your pod**

kubectl create deployment hello-node \
    --image=us-east1-docker.pkg.dev/PROJECT_ID/my-docker-repo/hello-node:v1

kubectl get deployments

kubectl get pods
kubectl cluster-info
kubectl config view
kubectl get events
kubectl logs <pod-name>

**Task 5. Allow external traffic**

kubectl expose deployment hello-node --type="LoadBalancer" --port=8080

kubectl get services

**Task 6. Scale up your service**

kubectl scale deployment hello-node --replicas=4

kubectl get deployment

<img width="913" height="831" alt="image" src="https://github.com/user-attachments/assets/bee77103-2062-4715-b64e-0bb2d18e92e0" />

**Task 7. Roll out an upgrade to your service**

docker build -t hello-node:v2 .

docker tag hello-node:v2 us-east1-docker.pkg.dev/qwiklabs-gcp-01-79f3fdf7db55/my-docker-repo/hello-node:v2 

docker push us-east1-docker.pkg.dev/qwiklabs-gcp-01-79f3fdf7db55/my-docker-repo/hello-node:v2

kubectl edit deployment hello-node

kubectl get deployments

