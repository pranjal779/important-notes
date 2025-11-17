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


gcloud compute ssh gcelab --zone $ZONE

