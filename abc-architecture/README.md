# Architecture for ABC Tech

![alt text](https://github.com/chinelo-obitube/abc-article/blob/main/abc-architecture/abc-architecture.drawio.png)

1. A virtual private cloud (VPC) is used to create the private network to make it isolated from other users of Google cloud.
2. GCP Compute Engine (GCE) is used to host the application and handle http traffic and will be created in a public network inside the vpc.
3. The database will be a managed database Cloud SQL(MySQL) if its a relational database. And for high availability, A read replica database will be created in another availability zone to handle read requests. 
4. To allow the database and the compute engine communicate with each other, a cloud sql proxy will be used.
5. A load balancer will sit infront of the web servers to handle traffic and route requests to the servers. GCP cloud loadbalancer on both Layer 4 to handle TCP/UDP requests and on Layer 7 to handle HTTP requests(Layer 4 and Layer 7 Load balancing).
6. To reduce cost while handling traffic inconsistency, Autoscaling will be done using Managed Instance group will be used to scale out when demand is high and scale in when demand is low and distribute traffic across all the instances in the group.
To use MIG and enable autoscaling, metrics are added like CPU utilization eg. to scale out when CPU utilization is more that 75%.