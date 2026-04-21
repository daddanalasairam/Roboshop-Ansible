# RoboShop Automation using Ansible

## **Project Overview**

This project automates the deployment of the RoboShop microservices application using Ansible with a role-based architecture. Each service is configured independently using reusable roles to enable scalable and maintainable infrastructure automation.

---

## **Objective**

* Automate multi-server application deployment
* Replace manual shell scripting with scalable automation
* Follow Infrastructure as Code (IaC) practices
* Implement reusable and modular configurations

---

## **Architecture**

The application consists of the following services:

* Frontend (Nginx)
* Catalogue (NodeJS)
* User (NodeJS)
* Cart (NodeJS)
* Shipping (Java + Maven)
* Payment (Python)
* Dispatch (Golang)
* MongoDB
* MySQL
* Redis
* RabbitMQ

---

## **Technologies Used**

* Linux (RHEL 9)
* Ansible
* AWS EC2
* Nginx
* NodeJS, Python, Java, Golang
* MongoDB, MySQL, Redis, RabbitMQ

---

## **Project Structure**

```
roboshop-ansible/
│
├── Roboshop.yml
├── inventory
│
├── roles/
│   ├── frontend/
│   ├── catalogue/
│   ├── user/
│   ├── cart/
│   ├── shipping/
│   ├── payment/
│   ├── dispatch/
│   ├── mongodb/
│   ├── mysql/
│   ├── redis/
│   ├── rabbitmq/
│   └── common/
│
├── templates/
│   ├── nginx.conf
│   ├── *.service
│
├── files/
│   ├── mongodb.repo
│   ├── rabbitmq.repo
```

---

## **Key Features**

### **Role-Based Architecture**

Each microservice is implemented as an independent role, improving modularity and reusability.

### **Common Role Reusability**

Common setup tasks such as NodeJS, Python, Maven, and Golang are centralized.

```
- name: Load NodeJS
  ansible.builtin.include_role:
    name: common
    tasks_from: nodejs
```

### **Idempotency**

Tasks execute only when changes are required, ensuring consistent and safe deployments.

### **Dynamic Configuration**

Variables are used for flexibility and environment-based deployments.

```
{{ component }}
{{ env }}
```

### **Service Management**

System services are managed using systemd.

```
ansible.builtin.systemd_service:
  name: nginx
  state: restarted
  enabled: yes
```

### **Template Management**

Configuration files are dynamically managed using templates.

```
ansible.builtin.template:
  src: nginx.conf
  dest: /etc/nginx/nginx.conf
```

### **Loop Implementation**

Used to handle repetitive tasks efficiently.

```
loop:
  - schema
  - app-user
  - master-data
```

---

## **Future Enhancements**

* CI/CD integration (Jenkins / GitHub Actions)
* Infrastructure provisioning using Terraform
* Containerization using Docker
* Monitoring using Prometheus and Grafana

---

## **Conclusion**

This project demonstrates real-world DevOps practices by automating the deployment of a microservices-based application using Ansible with a scalable and maintainable architecture.

---

## **Author**

Sairam
