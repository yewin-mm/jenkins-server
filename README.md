# spring-boot-jpa-docker-compose
<!-- PROJECT SHIELDS -->

<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/yewin-mm/jenkins-server.svg?style=for-the-badge
[contributors-url]: https://github.com/yewin-mm/jenkins-server/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/yewin-mm/jenkins-server.svg?style=for-the-badge
[forks-url]: https://github.com/yewin-mm/jenkins-server/network/members
[stars-shield]: https://img.shields.io/github/stars/yewin-mm/jenkins-server.svg?style=for-the-badge
[stars-url]: https://github.com/yewin-mm/jenkins-server/stargazers
[issues-shield]: https://img.shields.io/github/issues/yewin-mm/jenkins-server.svg?style=for-the-badge
[issues-url]: https://github.com/yewin-mm/jenkins-server/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/ye-win-1a33a292/

# jenkins-server
* This is a guide to create Jenkins server with Docker compose.
* You can check out step-by-step guide in [Instruction](#instruction) section.

<!-- TABLE OF CONTENTS -->
## Table of Contents
- [About The Project](#about-the-project)
    - [Built With](#built-with)
- [Getting Started](#getting-started)
    - [Before you begin](#before-you-begin)
    - [Clone Project](#clone-project)
    - [Prerequisites](#prerequisites)
    - [Instruction](#instruction)
      -  [Run Jenkins Server](#run)
      -  [Unlock Jenkins](#unlock)
      -  [Install Suggested Plugins](#install-plugins)
      -  [Create Admin User](#create-user)
      -  [Configure Portal Access Link](#configure)
    - [Setting Up](#setup)
      - [Add Maven Tools](#maven)
      - [Add Docker Hub Credentials](#docker)
    - [Testing](#testing)
- [Contact Me](#contact)
- [Contributing](#Contributing)


<a name="about-the-project"></a>
## ⚡️About The Project
This is the guide to setup Jenkins Server with docker compose. <br>
Jenkins help to automate the software for building, testing, deploying, Continuous Integration and Continuous Delivery (CI/CD). <br>
There are many ways to install Jenkins Server like installer, install with docker, install with brew (MacOs).<br>
Below guild is to install Jenkins Server with Docker.


<a name="built-with"></a>
### 🪓 Built With
This project is built with
* [Docker](https://www.docker.com/products/docker-desktop/)


<a name="getting-started"></a>
## 🔥 Getting Started
See the [Prerequisites](#prerequisites) sections for basic knowledge and go as per below [Instruction](#instruction) section.


<a name="before-you-begin"></a>
### 🔔 Before you begin
If you are new in Git, GitHub and new in Spring Boot configuration structure, <br>
You should see basic detail instructions first in here [Spring Boot Application Instruction](https://github.com/yewin-mm/spring-boot-app-instruction)<br>
If you are not good enough in basic Docker Compose commands, you can learn some commands in below projects. <br>
Click below links.
* [Spring Boot Docker Compose Sample](https://github.com/yewin-mm/spring-boot-docker-compose-sample)


<a name="clone-project"></a>
### 🥡 Clone Project
* Clone the repo
   ```sh
   git clone https://github.com/yewin-mm/jenkins-server.git
   ```
<a name="prerequisites"></a>
### 🔑 Prerequisites
Prerequisites can be found here, [Spring Boot Application Instruction](https://github.com/yewin-mm/spring-boot-app-instruction). <br>
You need to install `Docker` in your machine. [Get Docker](https://www.docker.com/products/docker-desktop/). <br>
You can learn sample docker-compose commands here. [Spring Boot Docker Compose Sample](https://github.com/yewin-mm/spring-boot-docker-compose-sample)


<a name="instruction"></a>
### 📝 Instruction
* Make sure docker is running in your machine.
* Go to your cloned folder (clone this repo) with `cmd` (for window)  or `terminal` (for Mac and Linux).

<a name="run"></a>
#### Run Jenkins Server
* Below commands need to type in your `CMD` or `Terminal` where path should be in your application folder.
* Before you run below `docker-compose up -d`, 
  * You need to check your db.
  * If you run your database as normal, it's ok, you can skip below steps and type below `up` command under Run Jenkins Server title.
  * But if you run your database as container, you need to change a bit in this Docker compose file.
  * Because if you run your db as container like this ways [Run MySQL DB as Container](https://github.com/yewin-mm/mysql-docker-container)
  * You might got test error in Jenkins Server for your application when Jenkins Server do test for database connection.
  * Because if you run Jenkins Server as container, that container can't connect to DB container if those containers are not going under same network.
  * So, you need to run your Jenkins Server as same network with your DB container.
  * Open your cloned `docker-compose.yml` file with text editor like sublime text, notepad++, etc.
  * **Comment out** `jenkins`, `aliases` and `- docker` under `networks` tag under `services` section.
  * **Uncomment** `- mysql` or your network name which you gave when you run your db as container. (you can check `docker network ls` command to see networks).
  * **Comment out** `jenkins`, `driver` and `name` under `networks` section (which is below in that file).
  * **Uncomment** `- mysql`, `external: true` or your network name which you gave when you run your db as container.
  * After that, `Save` the file and type below `up` command.

* Run Jenkins Server (with port 9000)
  * ```sh
    docker-compose up -d
    ```
  * After that you can call jenkins server portal with `http://localhost:9000/` through browser. (if you run jenkins at vm server, you need to add `server ip` or `domain` instead of `localhost`).

<a name="unlock"></a>
#### Unlock Jenkins
* After you get in jenkins server portal through browser by `http://localhost:9000/`,
* You will see below unlock screen to unlock jenkins server.
<h3 align="center">
  Unlock Jenkins
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/unlock.png" /><br/>
</h3>

* Type below command in `CMD` or `Terminal`.
  * ```sh
    docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    ```
* Then you will get initial password like below
<h3 align="center">
Sample initial password
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/get_pwd.png" /><br/>
</h3>

* Copy initial password which appeared in your `CMD` or `Terminal` by typing above command.
* Paste in jenkins server portal to unlock jenkins server.
* Please note that initial password is no need to use in the future. It's need only one time (this time). 


<a name="install-plugins"></a>
#### Install Suggested Plugins
* After you've unlocked jenkins server portal,
* Choose Install Suggested Plugins as below picture.
* This step will take a few minutes.
<h3 align="center">
Install Suggested Plugins
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/plugins.png" /><br/>
</h3>

<a name="create-user"></a>
#### Create Admin User
* After you've installed suggested plugins in jenkins server portal,
* Create admin user and you can give user name as you want.
<h3 align="center">
Sample Create Admin User
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/create_user.png" /><br/>
</h3>

<a name="configure"></a>
#### Configure Portal Access Link
* After you've created admin user,
* You can see Instance Configuration wizard like below.
<h3 align="center">
Configure Link
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/configure_link.png" /><br/>
</h3>

* Just click `Save and Finish` button to go with `localhost:9000` which port I put in `docker compose` file.
* After that, Click `Start using Jenkins`.
* After that, you can see the `Jenkins server portal` like below.
<h3 align="center">
Sample Jenkins Server Portal Dashboard.
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/dashboard.png" /><br/>
</h3>

* Finally, you can successfully set up Jenkins Server with docker.

<a name="setup"></a>
### Setting Up
* You can add tools, pre-defined credentials in Jenkins Server by below.
* In my case, I need maven to build my applications and docker hub credentials to accessing docker hub for pushing, pulling images (here, that could be any image repository instead of docker hub).

<a name="maven"></a>
#### Add Maven Tools
* You can add maven tools to build your applications.
* There are 3 ways to use maven with Jenkins
  1. you can use docker maven image as agent (this way is a bit harder than way 2, but you can use different maven version as you want and can use share volume storage which not to download dependency every time)
  2. you can use maven as tools and install in Jenkins (this way is easy and with that way, you need to use only specific maven version which you installed in Jenkins)
  3. you can link to dockerfile which pull maven image from docker hub. (this way is a bit hard to handle for beginners)
  
  * Here, I used way 2 as that is easy and understandable
  * In Jenkins Server Portal,
  * Go to `Manage Jenkins` sub menu -> `Global Tool Configuration` -> under `Maven` section, add like below picture
    <h3 align="center">
    Add Maven Tools as global
    <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven.png" /><br/>
    </h3>
  * Please note that, you need to start with `Capital` letter in name field like `Maven-{any}`
  * After that Click `save`.

<a name="docker"></a>
#### Add Docker Hub Credentials
* You can add image repository like Docker Hub credentials as pre-defined.
* Here, image repository can be anything like your cloud server, Docker Hub, etc.
* Here, I will test with Docker Hub.
  * Go to `Docker Hub cloud` and login with your account. [Docker-Hub](https://hub.docker.com/)
  * Go to `Account Setting` under your profile.
  * Click Security tag


<a name="testing"></a>
### Testing
* You can test your Jenkins Server by creating sample pipeline 

***Have Fun and Enjoy in Learning Code***


<a name="contact"></a>
## ✉️ Contact
Name - Ye Win <br> LinkedIn profile -  [Ye Win's LinkedIn](https://www.linkedin.com/in/ye-win-1a33a292/)  <br> Email Address - yewin.mmr@gmail.com

Project Link: [Jenkins Server](https://github.com/yewin-mm/jenkins-server)


<a name="contributing"></a>
## ⭐ Contributing
Contributions are what make the open source community such an amazing place to be learnt, inspire, and create. Any contributions you make are **greatly appreciated**.
<br>If you want to contribute....
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/yourname`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeatures'`)
4. Push to the Branch (`git push -u origin feature/yourname`)
5. Open a Pull Request
