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

* Just click `Save and Finish` button to go with `localhost:9000` which port I put in `docker compose`.
* Click `Start using Jenkins`.
* After that you can see the `jenkins server portal` like below.
<h3 align="center">
Sample Jenkins Server Portal Dashboard.
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/dashboard.png" /><br/>
</h3>

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
