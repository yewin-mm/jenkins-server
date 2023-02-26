# jenkins-server
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

<h3 align="center">
  Jenkins CI Server (photo from Google)
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/jenkins_ci.png" /><br/>
</h3>

# jenkins-server
* This is a guide to create Jenkins server with Docker compose.
* You can check out step-by-step guide in [Instruction](#instruction) and [Setting up](#setup) sections.

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
      -  [Run Script](#run-script)
    - [Setting Up](#setup)
      - [Add Maven Tools and Plugins](#maven)
        - [Add Maven Tools](#add-tools)
        - [Add Maven Plugins](#add-plugins)
      - [Add Docker Hub Credentials and Plugins](#docker)
        - [Generate Access Token](#generate-token)
        - [Add Docker Hub Credentials in Jenkins](#add-credentials-in-jenkins)
        - [Add Docker Plugins](#add-docker-plugins)
        - [Create repository to store image](#create-repository)
    - [Testing Pipelines](#testing)
      - [Testing Maven in Pipeline](#test-maven)
        - [Testing with Maven Tools](#test-maven-tools)
        - [Testing with Docker Agent](#test-docker-agent)
      - [Testing Docker Hub Login](#test-docker-hub-login) 
      - [Testing Maven Pipeline Utility](#maven-pipeline-util) 
- [Contact Me](#contact)
- [Contributing](#Contributing)


<a name="about-the-project"></a>
## ⚡️About The Project
This is the guide to setup Jenkins Server with docker compose. <br>
Jenkins help to automate the software for building, testing, deploying, Continuous Integration and Continuous Delivery (CI/CD). <br>
There are many ways to install Jenkins Server like installer, install with docker, install with brew (MacOs).<br>
Below guild is to install Jenkins Server with Docker. <br>
You can see sample Jenkins Pipeline projects as [Spring Boot Jpa Docker Jenkins Pipeline](https://github.com/yewin-mm/spring-boot-jpa-docker-jenkins-pipeline) application for using this Jenkins Server.


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
* [Spring Boot Docker Sample](https://github.com/yewin-mm/spring-boot-docker-sample) (to get basic docker commands)
* [Spring Boot Docker Compose Sample](https://github.com/yewin-mm/spring-boot-docker-compose-sample) (to get basic docker compose sample)


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
If you don't know about basic docker command, see here. [Spring Boot Docker Sample](https://github.com/yewin-mm/spring-boot-docker-sample)<br>
You can learn sample docker-compose commands here. [Spring Boot Docker Compose Sample](https://github.com/yewin-mm/spring-boot-docker-compose-sample). <br>
You can see sample Jenkins Pipeline projects as [Spring Boot Jpa Docker Jenkins Pipeline](https://github.com/yewin-mm/spring-boot-jpa-docker-jenkins-pipeline) application for using this Jenkins Server.

<a name="instruction"></a>
### 📝 Instruction
* Make sure docker is running in your machine.
* Go to your cloned folder (clone this repo) with `cmd` (for window)  or `terminal` (for Mac and Linux).

<a name="run"></a>
#### Run Jenkins Server
* Below commands need to type in your `CMD` or `Terminal` where path should be in your application folder.
* Before you run below `docker-compose up -d`, 
  * You need to check your db.
  * If you run your database like this ways [Run MySQL DB as Container](https://github.com/yewin-mm/mysql-docker-container) 
   <br> it's ok, you can skip below steps and type below `up` command under Run Jenkins Server title.
  * Because I run MySQL as container and give network name as `mysql`, so it's ok to connect to my `MySQL` db container which running with network `mysql.
  * So, if you run your db as container and gave network name not like `mysql` you need to change that your network name in my `docker-compose` file.
  * If not change your network name, it will get error.
  * Because if you run Jenkins Server as container, that container can't connect to DB container if those containers are not going under same network.
  * So, you need to run your Jenkins Server as same network with your DB container.
  * But if you run your database as normal (eg. run with installer), you need to change a bit in this Docker compose file.
  * Open your cloned `docker-compose.yml` file with text editor like sublime text or notepad++, etc.
  * **Comment out** `- mysql` under `networks` tag under `services` section. <br>
  * **Uncomment** `jenkins`, `aliases` and `- docker`  
  * **Comment out** `- mysql`, `external: true` under `networks` section (which is below in that file).
  * **Uncomment** `jenkins`, `driver` and `name`.
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
* This step will take a few minutes depend on your internet connection.
* If anything failed, you can retry download plugins or if you saw error in home page, <br> 
  you can type `docker compose down` and clear volume Jenkins volume by typing `docker volume rm jenkins-data` and `docker volume rm jenkins-docker-certs` and type `docker compose up -d --build` again. <br> 
  Please note that deleting Jenkins volume will clear all Jenkins data and so, if you can install plugins successfully or if anything is not wrong or if no need to clear data, don't delete volume.

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

<a name="run-script"></a>
#### Run Script
* This part is important after you shut down or restart your computer or restart docker desktop daemon.
* Because after your restart your computer or decker daemon, the connection for docker daemon is lost, and so, you won't able to run docker login in pipeline script.
* It will get permission denied errors.
* Go got Jenkins Container by below command.
* Type

  ```sh
    docker exec -u root -it jenkins bash 
    ```
* After you get inside jenkins container by root user,
* Type

  ```sh
    sh script.sh
    ```
  
* Then, Type `exit` to leave Jenkins container.

<a name="setup"></a>
### Setting Up
* You can add tools, pre-defined credentials in Jenkins Server by below.
* In my case, I need maven to build my applications and docker hub credentials to accessing docker hub for pushing, pulling images (here, that could be any image repository instead of docker hub).

<a name="maven"></a>
#### Add Maven Tools and Plugins
* You can add maven tools to build your applications by using `Maven`.
* There are 3 ways to use maven with Jenkins
  1. you can use docker maven image as agent (this way need to install docker cli, but you can use different maven version as you want and can use share volume storage which not to download dependency every time)
  2. you can use maven as tools and install in Jenkins (this way is easy and with that way, you need to use only specific maven version which you installed in Jenkins)
  3. you can link to dockerfile which pull maven image from docker hub. (this way is a bit hard to handle for beginners)

<a name="add-tools"></a>
##### Add Maven Tools  
* Here, I used way 2 as that is easy and understandable
* In Jenkins Server Portal,
* Go to `Manage Jenkins` sub menu -> `Global Tool Configuration` -> under `Maven` section, add like below picture
  <h3 align="center">
  Add Maven Tools as global
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven.png" /><br/>
  </h3>
* Please note that, you need to start with `Capital` letter in name field like `Maven-{any}`
* After that Click `save`.

<a name="add-plugins"></a>
##### Add Maven Plugins
* You need below three maven plugins to use `maven` in your pipeline.
* Go to `Manage Jenkins` sub menu -> `Manage Plugins` -> under `Available Plugins` section, <br>
  * Search `Maven Integration`, `Pipeline Maven Integration` and `Pipeline Utility Steps` (for reading pom file)
  * Select those plugins and click `Install without restart`.
  <h3 align="center">
  Search Maven Plugins
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_plugins.png" /><br/>
  </h3>
  
* Click `Restart Jenkins when installation is complete and no jobs are running` to apply plugins.
<h3 align="center">
Add Maven Plugins
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/add_mvn_plugins.png" /><br/>
</h3>
  
* This step take a few minutes depend on your internet connection.
* If downloading plugins was success and not able to restart Jenkins server (if too long), you can restart `docker desktop` or compose down and up to restart Jenkins by manually.
  

<a name="docker"></a>
#### Add Docker Hub Credentials and Plugins
* You can add cloud image repository like Docker Hub credentials as pre-defined to upload your application image.
* Here, image repository can be anything like your cloud server, Docker Hub, etc.
* Here, I will test with Docker Hub. 

<a name="generate-token"></a>
##### Generate Access Token
* Go to `Docker Hub cloud` and login with your account. [Docker-Hub](https://hub.docker.com/)
* Go to `Account Setting` under your profile.
* Click `Security` tag and click `New Access Token`.
* Fill the name as you want in `Access Token Description` field. You can give only `read and write` permission if your pipeline don't want to delete image in docker hub.
* After that Click `Generate`.
<h3 align="center">
Generate Access Token
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/generate_token.png" /><br/>
</h3>
  
* You can see generate Token and click `Copy and Close`.
  
  <h3 align="center">
  Access Token Sample
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/token.png" /><br/>
  </h3>

* Please note that token will use when you try to connect your docker hub and so, it's better saving in your notepad.
* You can delete and creat new token as you want. Please don't share your token to others as high security risk.

<a name="add-credentials-in-jenkins"></a>
##### Add Docker Hub Credentials in Jenkins
* You need to add global credentials to access your cloud repository from Jenkins pipelines. 
* Go to `Manage Jenkins` sub menu -> `Manage Credentials` -> click `(global)` under domain -> click `Global credentials (unrestricted)` -> `Add Credentials`
<h3 align="center">
Add Global Credentials
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/add_credentials.png" /><br/>
</h3>

* Add credentials like below, 
* Here, username will be your docker hub username and password will be docker hub token that you already generate in above step. ID will be used in pipeline script.
<h3 align="center">
Add Docker Hub Credentials in Jenkins
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/add_docker_credentials.png" /><br/>
</h3>

* After that click `create`.
* Here, you can change your private cloud repository if you have and I showed with docker hub public cloud as demo.
* Here, you can add other credentials like `Github` if your project is private. Because if private repository, Jenkins pipelines won't be pull without credentials.

<a name="add-docker-plugins"></a>
##### Add Docker Plugins
* You need to install Docker plugins in Jenkins Server to use docker command in pipelines.
* Go to `Manage Jenkins` sub menu -> `Manage Plugins` -> under `Available Plugins` section, <br>
  search `Docker Pipeline` and select that plugin and click `Install without restart`.
<h3 align="center">
Search Docker Plugins
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/docker_plugins.png" /><br/>
</h3>
* Click `Restart Jenkins when installation is complete and no jobs are running` to apply plugins.
    
  <h3 align="center">
  Add Docker Plugins
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/add_docker_plugins.png" /><br/>
  </h3>
  
* If downloading plugins was success and not able to restart Jenkins server (if too long), you can restart `docker desktop` or compose down and up to restart Jenkins by manually.

<a name="create-repository"></a>
##### Create repository to store image
  * Here, I will push my image to Docker hub and so, I need to create repository to store my image in Docker Hub.
  * Go to `Docker Hub cloud` and login with your account. [Docker-Hub](https://hub.docker.com/)
  * Click `Repositories` tab in above.
  * Give name and click `Create`.

  <h3 align="center">
  Create Repository
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/repository.png" /><br/>
  </h3>

* Now, you are done for setting require configuration to run Java Project by using Docker and push to Docker Hub. Here, you can add more plugins as you want.
* Let's go to Testing in below.

<a name="testing"></a>
### Testing Pipelines
* You can test pipeline by creating sample pipeline scripts in Jenkins Server.
* There are two types of pipelines scripts which used groovy languages.
1. Scripted Pipeline
2. Declarative Pipeline
* Here, I will use Declarative Pipeline as it's easy to understand and modern way.

<a name="test-maven"></a>
#### Testing Maven in Pipeline
* Below are testing for using maven in pipelines

<a name="test-maven-tools"></a>
##### Testing with Maven Tools
* Click `New Item` in your Jenkins Dashboard Portal.
* Enter `test-maven-with-maven-tools` in field. (you can give any name you want)
* Choose `Pipeline` and Click `Ok`.
  <h3 align="center">
  Create Pipeline
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/test_maven_tools_pipeline.png" /><br/>
  </h3>
  
* Copy below scripts and paste under `Pipeline Script` section.
  ```sh
  pipeline {
    agent any
    tools {
        // you need to add Global Tools Configuration in Jenkins Server.
        // go to Jenkins Portal (Manage Jenkins -> Global Tools Configuration -> Add maven -> give name (ref - https://github.com/yewin-mm/jenkins-server#maven)
        maven 'Maven-3.9.0'
    }

    stages {
        stage('Print Maven Version') {
            steps {
                sh 'mvn -v'
            }
        }
    }
  }
  ```

<h3 align="center">
Maven Tools Script Sample
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_tools_script.png" /><br/>
</h3>

* Here, tools name `maven 'Maven-3.9.0'` is need to be same with your Maven tools name which you gave in above [Add Maven Tools](#add-tools) section.
* Click `Save`.
* After you have entered that above `test-maven-with-maven-tools` pipeline job, Click `Build Now` and refresh page.
* There you will see job is running with build number #1.
* Click `Console Output` which can be reach by clicking `down arrow` button beside `#1` job like above picture, to see console output.

<h3 align="center">
Maven Tools Console
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_tools_console.png" /><br/>
</h3>

* There you can see pipeline console output and can see maven version which we printed in above script.

<h3 align="center">
Maven Tools Console
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_tools_console_output.png" /><br/>
</h3>

* After that click `test-maven-with-maven-tools` (top left corner) and you can see pipeline jobs are success with green line.
* Please note that above sample pipeline script has only one stages call `Print Maven Version`, you will see only two stages in screen and one is for installing declarative maven tools.

<h3 align="center">
Success Maven Tools Testing
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/success_maven_tools.png" /><br/>
</h3>

* After you can go to Dashboard and you can see one pipeline is showing in the dashboard. 
* You can enter that pipeline again and build again, you will see it's running with build number #2. 

<a name="test-docker-agent"></a>
##### Testing with Docker Agent
* Click `New Item` in your Jenkins Dashboard Portal.
* Enter `test-maven-with-docker-agent` in field. (you can give any name you want)
* Choose `Pipeline` and Click `Ok`.
  <h3 align="center">
  Create Pipeline
  <img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/docker_agent_pipeline.png" /><br/>
  </h3>

* Copy below scripts and paste under `Pipeline Script` section.
  ```sh
  pipeline {
    // run docker as agent to pull maven image from docker hub
    agent {
        docker {
            // use alpine maven image for reducing size and light weight
            image 'maven:3.9.0-eclipse-temurin-11-alpine'
            // mount volume with .m2 folder to reduce repeatative downloading jar file
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Print Maven Version') {
            steps {
                sh 'mvn -v'
            }
        }
    }
  }
  ```
  
<h3 align="center">
Maven Docker Agent Script
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_docker_agent_script.png" /><br/>
</h3>

* Click `Save`.
* After you have entered that above `test-maven-with-docker-agent` pipeline job, Click `Build Now` and refresh page.
* There you will see job is running with build number #1.
* Click `Console Output` which can be reach by clicking `down arrow` button beside `#1` job like above maven tools step, to see console output.
* There you can see pipeline console output and can see maven version which we printed in above script.

<h3 align="center">
Maven Docker Agent Console
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/maven_docker_agent_console_output.png" /><br/>
</h3>

* After that click `test-maven-with-docker-agent` (top left corner) and you can see pipeline jobs are success with green line.
* Please note that above sample pipeline script has only one stages call `Print Maven Version`, you will see one stage.

<h3 align="center">
Success Maven Docker Agent Testing
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/success_maven_docker_agent.png" /><br/>
</h3>

* After you can go to Dashboard and you can see two pipeline is showing in the dashboard (one is for testing maven with tools and one is for testing maven with docker agent).
* You can enter these pipeline again and build again to test.


<a name="test-docker-hub-login"></a>
#### Testing Docker Hub Login
* Here, we will try to Login to docker hub from jenkins server by using pipeline script.
* Click `New Item` in your Jenkins Dashboard Portal.
* Enter `test-docker-login` in field. (you can give any name you want)
* Choose `Pipeline` and Click `Ok`.
* Copy below scripts and paste under `Pipeline Script` section.

  ```sh
  pipeline {
    environment {
      // that is we already predefined with name `docker-hub` in jenkins Dashboard -> Manage Jenkins -> Credentials (ref - https://github.com/yewin-mm/jenkins-server#docker)
      DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
    }
    agent any
    stages {
      stage('Test Username') {
        steps{
          script {
            // print build number from jenkins
            echo "Jenkins build number: ${env.BUILD_NUMBER}"
            // we already defined DOCKER_HUB_CREDENTIALS variable and USR is provided from jenkins to get username from that credentials
            echo "docker-hub Username: $DOCKER_HUB_CREDENTIALS_USR"
          }
        }
      }
      stage('Test Login to Docker Hub') {         
        steps{
        sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
        echo 'Login Success' 
        }     
      }  
    }

  }
  ```

<h3 align="center">
Docker Login Script
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/test_docker_login.png" /><br/>
</h3>

* Here, credentials id `'docker-hub` is the ID which we pre-define in above [Add Credentials in Jenkins](#add-credentials-in-jenkins) section.
* Click `Save`.
* After you have entered that above `test-docker-login` pipeline job, Click `Build Now` and refresh page.
* There you will see job is running with build number #1.

<h3 align="center">
Docker Login Console
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/docker_login_console.png" /><br/>
</h3>

* Click `Console Output` which can be reach by clicking `down arrow` button beside `#1` job like above picture, to see console output.
* There you can see pipeline console output and can see maven version which we printed in above script.

<h3 align="center">
Docker Login Console
<img src="https://github.com/yewin-mm/jenkins-server/blob/master/github/template/images/overview/docker_login_console_output.png" /><br/>
</h3>

* Go back to your docker login pipeline, and you will see `Test Username` and `Test Login to Docker Hub` with green line.
* You can go back to dashboard now.



<a name="maven-pipeline-util"></a>
#### Testing Maven Pipeline Utility
* Here, we will try to read pom file properties by using `Maven Pipeline Utility` plugin which plugins we already installed in above.
* Click `New Item` in your Jenkins Dashboard Portal.
* Enter `read-pom` in field. (you can give any name you want)
* Choose `Pipeline` and Click `Ok`.
* Copy below scripts and paste under `Pipeline Script` section.

  ```sh
  // declare variable as global (not declare in script tag) to use in other stages
  def readPom
  pipeline {
    agent any
    tools {
        // you need to add Global Tools Configuration in Jenkins Server.
        // go to Jenkins Portal (Manage Jenkins -> Global Tools Configuration -> Add maven -> give name (ref - https://github.com/yewin-mm/jenkins-server#maven)
        maven 'Maven-3.9.0'
    }
    stages {
        stage('Git Clone') {
            steps {
                git branch: 'master', url: 'https://github.com/yewin-mm/spring-cloud-config-sample-microservice-a'
            }
        }
        stage('Read pom file') {
            steps {
                script {
                    // for using readMavenPom, you need to add Pipeline Utility Steps plugin in Jenkins Server (ref - https://github.com/yewin-mm/jenkins-server#maven)
                    readPom = readMavenPom file: 'pom.xml';
                }
            }
        }
        stage('Print Values') {
            steps {
                echo "Application Name: ${readPom.name}"
                echo "Artifact Id: ${readPom.artifactId}"
                echo "Application Version: ${readPom.version}"
            }
        }
    }
  }
  ```
* Click `Save`.
* There, you can use any of your `Github projects` link to clone.
* After you have entered that above `read-pom` pipeline job, Click `Build Now` and refresh page.
* You can see console log like above steps and there you will see your `application name, artifact id and version` which we print in above pipeline script.

* You can test other pipeline scripts by testing like above.
* You can also generate pipeline tags by using `Pipeline Syntax`.


***Please Don't Forget to run Script after everytime you start your computer or start docker daemon again as this [Run Script](#run-script) section.***

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
