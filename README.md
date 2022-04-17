# ELK-Stack-Project
This repository contains the first project undertaken by me during KU's Cyber Security Bootcamp
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

**Note**: The following image link needs to be updated. Replace `diagram_filename.png` with the name of your diagram image file.  

![TODO](ELK-Stack-Project/Diagrams/v_net_diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, 
select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file. ELK-Stack_Project/Ansible/

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resilient, in addition to restricting access to the network.
- Load balancers ensure availability by ensuring that nodes don't get overloaded. By using a Jumpbox to access internal networks, one can reduce the attack surface on the 
open web.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the /etc/passwd/ or other sensitive files and system uptime.
- _TODO: What does Filebeat watch for? - Filebeat collects data about the file system - who is accessing, editing or adding files.
- _TODO: What does Metricbeat record? - Metricbeat collects machine metrics, such as uptime, CPU usage, memory usage, software running.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    |Web Server| 10.0.0.8   | Linux            |
| Web-2    |Web Server| 10.0.0.9   | Linux            |
| Web-3    |Web Server| 10.0.0.10  | Linux            |
| Red-ELK  |ELK Server| 10.1.0.5   | Linux            |   
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Gateway machine, my Jump-Box-Provisioner can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses - 136.35.208.154

Machines within the network can only be accessed by the Gateway machine, my Jump-Box-Provisioner
- _TODO: Which machine did you allow to access your ELK VM? I allowed my Jump-Box-Provisioner to access my ELK Server. What was its IP address? That Jump Box's IP is 
104.208.97.65

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 136.35.208.154       |
| Web-1    | No                  |                      |
| Web-2    | No                  |                      |
| Web-3    | No                  |                      |
| Red-ELK  | No                  |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible? - The main advantage of automating configuration with Ansible is that you can configure 
multiple VM's rapidly and without errors that may occur with manual configuration. 

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ... Install Docker.io - In this step I've installed Docker onto the ELK VM so that I can easily configure a container.
- ... Install pip3 - Installing the package manager for Python 3 allows me to install Python and other third party software.
- ... Install Docker Python Module - Installs Python code that I'd like to be able to use in this container.
- ... Use More Memory - Allows my container on this VM to use additional memory when it's operating. 
- ... download and launch a docker elk container - This builds the ELK stack container on the VM.
- ... Enable service docker on boot - This starts the ELK container on boot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

ELK-Stack-Project/Ansible/docker_ps_output

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
       - 10.0.0.4
       - 10.0.0.8
       - 10.0.0.9
       - 10.0.0.10
We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
       - I've installed Filebeat and Metricbeat. 

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we 
use to track user logon events, etc._
       - I've installed Filebeat which collects and forwards log information to Logstash or Elastisearch. We can see log data - who's doing what and when on these servers.
       - I've also installed Metricbeat that can collect information about CPU and memory usage, or other services running on a system. Metricbeat send the collected data 
to Logstash and Elastisearch.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK config file to the ansible machine, the Jump Box.
- Update the hosts file to include the ELK VM.
- Run the playbook, and navigate to the ELK server to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? The playbook is the file that configures the docker container on the ELK VM. Where do you copy it? You place this file on the Jump Box 
machine so Ansible can run it. 
- _Which file do you update to make Ansible run the playbook on a specific machine? You update Ansible's Hosts file to specify which machines to run a playbook on.  How do 
I specify which machine to install the ELK server on versus which to install 
Filebeat on? There's an ELK section in the Hosts file, and that's where you specify the ELK machine. The Web server machines are listed in the [webservers] section. These 
machines are the ones that you install filebeat and metricbeat on. 
- _Which URL do you navigate to in order to check that the ELK server is running? You navigate to the IP address of your ELK machine that will be running Kibana, but you 
have to specify which port to access that site with. 

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

