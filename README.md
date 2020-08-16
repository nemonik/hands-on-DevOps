[![GitHub Forks](https://img.shields.io/github/forks/nemonik/hands-on-DevOps?style=flat-square)](https://github.com/nemonik/hands-on-DevOps/network/members)
[![Github Stars](https://img.shields.io/github/stars/nemonik/hands-on-DevOps?style=flat-square)](https://github.com/nemonik/hands-on-DevOps/stargazers)
![Tweet](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2Fnemonik%2Fhands-on-DevOps)

# 1. Preface

This class is under near constant development.  It's backlog is here https://github.com/nemonik/hands-on-DevOps/projects/1  

# 2. DevOps

A hands-on DevOps course covering the culture, methods and repeated practices of modern software development involving Vagrant, VirtualBox, Ansible, Kubernetes, K3s, MetalLB, Traefik, Docker-Compose, Docker, Taiga, GitLab, Drone CI, SonarQube, Selenium, InSpec, Alpine 3.10, Ubuntu-bionic, CentOS 7...

A reveal.js presentation written to accompany this course can found at [https://nemonik.github.io/hands-on-DevOps/](https://nemonik.github.io/hands-on-DevOps/).

This course will

1. Discuss DevOps,
2. Have you spin up a DevOps toolchain and development environment, and then
3. Author two applications and their accompanying pipelines, the first a continuous integration (CI) and the second a continuous delivery (CD) pipeline.

After this course, you will

1. Be able to describe and have hands-on experience DevOps methods and repeated practices (e.g., use of Agile methods, configuration management, build automation, test automation and deployment automation orchestrated under a CICD orchestrator), and why it matters;
2. Address challenges transitioning to DevOps methods and repeated practices;
3. Have had hands-on experience with Infrastructure as Code( Vagrant and Ansible ) to provision and configure an entire DevOps Factory (i.e. a toolchain and development environment) on VirtualBox including Docker Registry, Taiga, GitLab, Drone CI, and SonarQube;
4. Have had hands-on experience authoring code to include authoring and running automated tests in a CICD pipeline all under Configuration Management to ensure an application follows style, adheres to good coding practices, builds, identify security issues, and functions as expected;
5. Have had hands-on experience with 
    1. using Infrastructure as Code (IaC) in Vagrant and Ansible; 
    2. creating and using Kanban board in Taiga; 
    3. code configuration in git and GitLab; 
    4. authoring code in Go; 
    5. using style checkers and linters; 
    6. authoring a Makefile; 
    7. various commands in Docker (e.g., building a container image, pushing a container into a registry, creating and running a container); 
    8. authoring a pipeline for Drone CI; 
    9. using Sonar Scanner CLI to perform static analysis; 
    10. authoring security test in InSpec; (k) author an automated functional test in Selenium; 
    11. authoring a dynamic security test in OWASP Zap; and 
    12. using container platform to author and scale services;
6. Have had hands-on experience authoring code to include authoring and running automated tests in a CICD pipeline all under Configuration Management to ensure an application follows style, adheres to good coding practices, builds, identify security issues, and functions as expected.

We will be spending most of the course hands-on working with the tools and in the Unix command line making methods and repeated practices of DevOps happen, so as to grow an understanding of how DevOps actually works. Although, not necessary I would encourage you to pick up a free PDF of [The Linux Command Line by William Shotts](http://linuxcommand.org/tlcl.php) if you are no familiar wit the Linux command line.

Don't fixate on the tools used, nor the apps we develop in the course of learning how and why. How and why is far more important. This course like DevOps is not about tools although we'll be using them. You'll spend far more time writing code. (Or at the very least cutting-and-pasting code.)

# 3. Author

- Michael Joseph Walsh [mjwalsh@mitre.org](mailto:mjwalsh@mitre.org), [walsh@nemonik.com](mailto:walsh@nemonik.com)

# 4. Copyright and license

See the License file at the root of this project.

# 5. Prerequisites

The following skills would be useful in following along but aren't strictly necessary.

What you should bring:

- Managing Linux or Unix-like systems would be tremendously helpful, but not necessary, as we will be living largely within the terminal.
- A basic understanding of Vagrant, Docker, and Ansible would also be helpful, but not necessary.

# 6. Table of Contents

<!-- TOC -->

- [1. Preface](#1-preface)
- [2. DevOps](#2-devops)
- [3. Author](#3-author)
- [4. Copyright and license](#4-copyright-and-license)
- [5. Prerequisites](#5-prerequisites)
- [6. Table of Contents](#6-table-of-contents)
- [7. DevOps unpacked](#7-devops-unpacked)
    - [7.1. What is DevOps?](#71-what-is-devops)
    - [7.2. What DevOps is not](#72-what-devops-is-not)
    - [7.3. To succeed at DevOps you must](#73-to-succeed-at-devops-you-must)
    - [7.4. If your effort doesn't](#74-if-your-effort-doesnt)
    - [7.5. Conway's Law states](#75-conways-law-states)
    - [7.6. DevOps is really about](#76-devops-is-really-about)
    - [7.7. What is DevOps culture?](#77-what-is-devops-culture)
        - [7.7.1. We were taught the requisite skills as children](#771-we-were-taught-the-requisite-skills-as-children)
        - [7.7.2. Maintaining relationships is your most important skill](#772-maintaining-relationships-is-your-most-important-skill)
        - [7.7.3. Be quick... Be slow to...](#773-be-quick-be-slow-to)
        - [7.7.4. The pressures of social media](#774-the-pressures-of-social-media)
    - [7.8. How is DevOps related to the Agile?](#78-how-is-devops-related-to-the-agile)
    - [7.9. How do they differ?](#79-how-do-they-differ)
    - [7.10. Why?](#710-why)
    - [7.11. What are the principles of DevOps?](#711-what-are-the-principles-of-devops)
    - [7.12. Much of this is achieved](#712-much-of-this-is-achieved)
    - [7.13. What is Continuous Integration (CI)?](#713-what-is-continuous-integration-ci)
    - [7.14. How?](#714-how)
    - [7.15. CI best practices](#715-ci-best-practices)
        - [7.15.1. Utilize a Configuration Management System](#7151-utilize-a-configuration-management-system)
        - [7.15.2. Automate the build](#7152-automate-the-build)
        - [7.15.3. Employ one or more CI services/orchestrators](#7153-employ-one-or-more-ci-servicesorchestrators)
        - [7.15.4. Make builds self-testing](#7154-make-builds-self-testing)
        - [7.15.5. Never commit broken](#7155-never-commit-broken)
        - [7.15.6. Stakeholders are expected to pre-flight new code](#7156-stakeholders-are-expected-to-pre-flight-new-code)
        - [7.15.7. The CI service/orchestrator provides feedback](#7157-the-ci-serviceorchestrator-provides-feedback)
    - [7.16. What is Continuous Delivery?](#716-what-is-continuous-delivery)
        - [7.16.1. Extending Continuous Integration (CI)](#7161-extending-continuous-integration-ci)
        - [7.16.2. Consistency](#7162-consistency)
    - [7.17. But wait. What's a pipeline?](#717-but-wait-whats-a-pipeline)
    - [7.18. How is a pipeline manifested?](#718-how-is-a-pipeline-manifested)
    - [7.19. What underlines all of this?](#719-what-underlines-all-of-this)
    - [7.20. But really why do we automate err. code?](#720-but-really-why-do-we-automate-err-code)
        - [7.20.1. Why do I mention Larry Wall?](#7201-why-do-i-mention-larry-wall)
        - [7.20.2. Laziness](#7202-laziness)
        - [7.20.3. Impatience](#7203-impatience)
        - [7.20.4. Hubris](#7204-hubris)
        - [7.20.5. We automate for](#7205-we-automate-for)
    - [7.21. Monitoring](#721-monitoring)
        - [7.21.1. The _primary_ metric](#7211-the-_primary_-metric)
        - [7.21.2. An understanding of performance](#7212-an-understanding-of-performance)
        - [7.21.3. Establish a baseline performance](#7213-establish-a-baseline-performance)
        - [7.21.4. Set reaction thresholds](#7214-set-reaction-thresholds)
        - [7.21.5. Reacting](#7215-reacting)
        - [7.21.6. Gaps in CICD](#7216-gaps-in-cicd)
        - [7.21.7. Eliminating waste](#7217-eliminating-waste)
    - [7.22. Crawl, walk, run](#722-crawl-walk-run)
        - [7.22.1. Ultimately, DevOps is Goal](#7221-ultimately-devops-is-goal)
- [8. Reading list](#8-reading-list)
- [9. Now the hands-on part](#9-now-the-hands-on-part)
    - [9.1. Configuring environmental variables](#91-configuring-environmental-variables)
    - [9.2. VirtualBox](#92-virtualbox)
        - [9.2.1. Installing VirtualBox](#921-installing-virtualbox)
    - [9.3. Git Bash](#93-git-bash)
        - [9.3.1. Installing Git Bash](#931-installing-git-bash)
    - [9.4. Retrieve the course material](#94-retrieve-the-course-material)
    - [9.5. Infrastructure as code (IaC)](#95-infrastructure-as-code-iac)
        - [9.5.1. Hashicorp Packer](#951-hashicorp-packer)
            - [9.5.1.1. Packer document and source](#9511-packer-document-and-source)
            - [9.5.1.2. Installing Packer](#9512-installing-packer)
            - [9.5.1.3. Packer project explained](#9513-packer-project-explained)
            - [9.5.1.4. Packer execution](#9514-packer-execution)
        - [9.5.2. Vagrant](#952-vagrant)
            - [9.5.2.1. Vagrant documentation and source](#9521-vagrant-documentation-and-source)
            - [9.5.2.2. Installing Vagrant](#9522-installing-vagrant)
            - [9.5.2.3. The Vagrantfile explained](#9523-the-vagrantfile-explained)
                - [9.5.2.3.1. Modelines](#95231-modelines)
                - [9.5.2.3.2. Setting extra variables for Ansible roles](#95232-setting-extra-variables-for-ansible-roles)
                - [9.5.2.3.3. Automatically installing and removing the necessary Vagrant plugins](#95233-automatically-installing-and-removing-the-necessary-vagrant-plugins)
                - [9.5.2.3.4. Inserting Proxy setting via host environmental variables](#95234-inserting-proxy-setting-via-host-environmental-variables)
                - [9.5.2.3.5. Inserting enterprise CA certificates](#95235-inserting-enterprise-ca-certificates)
                - [9.5.2.3.6. Auto-generate the Ansible inventory file](#95236-auto-generate-the-ansible-inventory-file)
                - [9.5.2.3.7. Mounting the project folder into each vagrant](#95237-mounting-the-project-folder-into-each-vagrant)
                - [9.5.2.3.8. Build a Vagrant Box](#95238-build-a-vagrant-box)
                - [9.5.2.3.9. Configuring the Kubernetes cluster vagrant(s)](#95239-configuring-the-kubernetes-cluster-vagrants)
                - [9.5.2.3.10. Provisioning and configuring the *development* vagrant](#952310-provisioning-and-configuring-the-development-vagrant)
        - [9.5.3. Ansible](#953-ansible)
            - [9.5.3.1. Playbooks](#9531-playbooks)
                - [9.5.3.1.1. The `master` vagrant's playbook](#95311-the-master-vagrants-playbook)
                - [9.5.3.1.2. The `worker` vagrant's playbook](#95312-the-worker-vagrants-playbook)
                - [9.5.3.1.3. The `development` playbooks](#95313-the-development-playbooks)
            - [9.5.3.2. Roles](#9532-roles)
            - [9.5.3.3. Bringing all the vagrants up](#9533-bringing-all-the-vagrants-up)
    - [9.6. The cloud-native technologies underlying the tools](#96-the-cloud-native-technologies-underlying-the-tools)
        - [9.6.1. Docker image and containers](#961-docker-image-and-containers)
        - [9.6.2. Docker-compose](#962-docker-compose)
        - [9.6.3. Kubernetes](#963-kubernetes)
            - [9.6.3.1. K3S, light-weight Kubernetes](#9631-k3s-light-weight-kubernetes)
            - [9.6.3.2. Kubectl, the Kubernetes command-line tool](#9632-kubectl-the-kubernetes-command-line-tool)
            - [9.6.3.3. Kubernetes-Dashboard](#9633-kubernetes-dashboard)
    - [9.7. The long-running tools](#97-the-long-running-tools)
        - [9.7.1. Taiga, an example of Agile project management software](#971-taiga-an-example-of-agile-project-management-software)
            - [9.7.1.1. Documentation, source, container image](#9711-documentation-source-container-image)
            - [9.7.1.2. URL, Username and password](#9712-url-username-and-password)
        - [9.7.2. GitLab CE, an example of configuration management software](#972-gitlab-ce-an-example-of-configuration-management-software)
            - [9.7.2.1. Documentation, source, container image](#9721-documentation-source-container-image)
            - [9.7.2.2. URL, Username and password](#9722-url-username-and-password)
            - [9.7.2.3. Notes in regards to the class GitLab](#9723-notes-in-regards-to-the-class-gitlab)
        - [9.7.3. Drone CI, an example of CICD orchestrator](#973-drone-ci-an-example-of-cicd-orchestrator)
            - [9.7.3.1. Documentation, source, container image](#9731-documentation-source-container-image)
            - [9.7.3.2. URL, Username and password](#9732-url-username-and-password)
        - [9.7.4. SonarQube, an example of a platform for the inspection of code quality](#974-sonarqube-an-example-of-a-platform-for-the-inspection-of-code-quality)
            - [9.7.4.1. Documentation, source, container image](#9741-documentation-source-container-image)
            - [9.7.4.2. URL, Username and password](#9742-url-username-and-password)
        - [9.7.5. PlantUML Server, an example of light-weight documentation](#975-plantuml-server-an-example-of-light-weight-documentation)
            - [9.7.5.1. Documentation, source, container image](#9751-documentation-source-container-image)
            - [9.7.5.2. URL](#9752-url)
            - [9.7.5.3. Optionally, add the *hands-on-DevOps* repository to GitLab](#9753-optionally-add-the-hands-on-devops-repository-to-gitlab)
    - [9.8. Golang _helloworld_ project](#98-golang-_helloworld_-project)
        - [9.8.1. Create the project's backlog](#981-create-the-projects-backlog)
        - [9.8.2. Create the project in GitLab](#982-create-the-project-in-gitlab)
        - [9.8.3. Setup the project on the _development_ Vagrant](#983-setup-the-project-on-the-_development_-vagrant)
        - [9.8.4. Author the application](#984-author-the-application)
        - [9.8.5. Align source code with Go coding standards](#985-align-source-code-with-go-coding-standards)
        - [9.8.6. Lint your code](#986-lint-your-code)
        - [9.8.7. Build the application](#987-build-the-application)
        - [9.8.8. Run your application](#988-run-your-application)
        - [9.8.9. Author the unit tests](#989-author-the-unit-tests)
        - [9.8.10. Automated the build (i.e., write the Makefile)](#9810-automated-the-build-ie-write-the-makefile)
        - [9.8.11. Author Drone-based Continuous Integration](#9811-author-drone-based-continuous-integration)
            - [9.8.11.1. Configure Drone to execute your pipeline](#98111-configure-drone-to-execute-your-pipeline)
            - [9.8.11.2. Trigger the build](#98112-trigger-the-build)
        - [9.8.12. The completed source for *helloworld*](#9812-the-completed-source-for-helloworld)
    - [9.9. Golang *helloworld-web* project](#99-golang-helloworld-web-project)
        - [9.9.1. Create the project's backlog](#991-create-the-projects-backlog)
        - [9.9.2. Create the project in GitLab](#992-create-the-project-in-gitlab)
        - [9.9.3. Setup the project on the _development_ Vagrant](#993-setup-the-project-on-the-_development_-vagrant)
        - [9.9.4. Author the application](#994-author-the-application)
        - [9.9.5. Build and run the application](#995-build-and-run-the-application)
        - [9.9.6. Run gometalinter.v2 on application](#996-run-gometalinterv2-on-application)
        - [9.9.7. Fix the application](#997-fix-the-application)
        - [9.9.8. Author unit tests](#998-author-unit-tests)
        - [9.9.9. Perform static analysis (i.e., sonar-scanner) on the command line](#999-perform-static-analysis-ie-sonar-scanner-on-the-command-line)
            - [9.9.9.1. Optionally, register your app in SonarQube](#9991-optionally-register-your-app-in-sonarqube)
            - [9.9.9.2. Install the SonarGo plugin](#9992-install-the-sonargo-plugin)
            - [9.9.9.3. Perform static analysis (run *sonar-scanner*) on the command line](#9993-perform-static-analysis-run-sonar-scanner-on-the-command-line)
        - [9.9.10. Automated the build (i.e., write the Makefile)](#9910-automated-the-build-ie-write-the-makefile)
        - [9.9.11. Dockerize the application](#9911-dockerize-the-application)
        - [9.9.12. Run the Docker container](#9912-run-the-docker-container)
            - [9.9.12.1. Option 1](#99121-option-1)
            - [9.9.12.2. Option 2](#99122-option-2)
        - [9.9.13. Push the container image to the private Docker registry](#9913-push-the-container-image-to-the-private-docker-registry)
        - [9.9.14. Configure Drone to execute your CICD pipeline](#9914-configure-drone-to-execute-your-cicd-pipeline)
        - [9.9.15. Add Static Analysis (*SonarQube*) step to pipeline](#9915-add-static-analysis-sonarqube-step-to-pipeline)
        - [9.9.16. Add the build step to the pipeline](#9916-add-the-build-step-to-the-pipeline)
        - [9.9.17. Add container image publish step to pipeline](#9917-add-container-image-publish-step-to-pipeline)
        - [9.9.18. Add container deploy step to pipeline](#9918-add-container-deploy-step-to-pipeline)
        - [9.9.19. Add compliance and policy automation (InSpec) test to the pipeline](#9919-add-compliance-and-policy-automation-inspec-test-to-the-pipeline)
            - [9.9.19.1. First author an InSpec test](#99191-first-author-an-inspec-test)
            - [9.9.19.2. Execute your test](#99192-execute-your-test)
            - [9.9.19.3. Add InSpec to the pipeline](#99193-add-inspec-to-the-pipeline)
            - [9.9.19.4. Viewing the results in Heimdall-lite](#99194-viewing-the-results-in-heimdall-lite)
        - [9.9.20. Add automated functional test to pipeline](#9920-add-automated-functional-test-to-pipeline)
            - [9.9.20.1. Run the *helloworld-web* application](#99201-run-the-helloworld-web-application)
            - [9.9.20.2. Pull and run Selenium Firefox Standalone](#99202-pull-and-run-selenium-firefox-standalone)
            - [9.9.20.3. Create our test automation](#99203-create-our-test-automation)
            - [9.9.20.4. Enable `Trusted` for the repository in Drone](#99204-enable-trusted-for-the-repository-in-drone)
            - [9.9.20.5. Add a *selenium* step to the pipeline](#99205-add-a-selenium-step-to-the-pipeline)
        - [9.9.21. Add DAST step (*OWASP ZAP*) to pipeline](#9921-add-dast-step-owasp-zap-to-pipeline)
        - [9.9.22. All the source for *helloworld-web*](#9922-all-the-source-for-helloworld-web)
    - [9.10. Additional best practices to consider around securing containerized applications](#910-additional-best-practices-to-consider-around-securing-containerized-applications)
    - [9.11. Microservices](#911-microservices)
        - [9.11.1. What's cloud-native?](#9111-whats-cloud-native)
        - [9.11.2. Let's create a microservice](#9112-lets-create-a-microservice)
            - [9.11.2.1. Modify the helloworld-web application](#91121-modify-the-helloworld-web-application)
            - [9.11.2.2. Create a Kubernetes manifest for the microservice](#91122-create-a-kubernetes-manifest-for-the-microservice)
            - [9.11.2.3. Deploy your application](#91123-deploy-your-application)
            - [9.11.2.4. Test your microservice](#91124-test-your-microservice)
            - [9.11.2.5. Scale your microservice](#91125-scale-your-microservice)
    - [9.12. Using what you've learned](#912-using-what-youve-learned)
    - [9.13. Shoo away your vagrants](#913-shoo-away-your-vagrants)
    - [9.14. That's it](#914-thats-it)

<!-- /TOC -->

# 7. DevOps unpacked

## 7.1. What is DevOps?

DevOps (a clipped compound of the words *development* and *operations*) is a software development methodology with an emphasis on a reliable release pipeline, automation, and stronger collaboration across all stakeholders with the goal of delivery of value in close alignment with business objectives into the hands of users (i.e., production) more efficiently and effectively.

*Ops* in DevOps gathers up every IT operation stakeholders (i.e., cybersecurity, testing, DB admin, infrastructure and operations practitioners -- essentially, any stakeholder not commonly thought of as directly part of the development team in the system development life cycle).

Yeah, that's the formal definition.  

In the opening sentences of _Security Engineering: : A Guide to Building Dependable Distributed Systems — Third Edition_, author Ross Anderson defines what a security engineer is

> Security engineering is about building systems to remain dependable in the face of malice, error, or mischance. As a discipline, it focuses on the tools, processes, and methods needed to design, implement, and test complete systems, and to adapt existing systems as their environment evolve. 

The words _security engineering_ could be replaced in the opening sentence with each one of the various stakeholders (e.g., development, quality assurance, technology operations).

The point I'm after is everyone is in it to collectively deliver dependable software.

Also, there is no need to overload the _DevOps_ term -- To _Dev wildcard (i.e., *) Ops_ to include your pet interest(s), such as, _security_, _test_, _whatever_... to form _DevSecOps_, _DevTestOps_, _DevWhateverOps_...  _DevOps_ has you covered.

## 7.2. What DevOps is not

About the tools.

![My Pillow Guy](./images/my_pillow_guy.png)

<sub>There are countless vendors out there, who want to sell you their crummy tool.</sub>

## 7.3. To succeed at DevOps you must

__Combine software development and information technology operations in the systems development life cycle__ with __a focus on collaboration across the life cycle to deliver features, fixes, and updates frequently in close alignment with business objectives__. 

If the effort cannot combine both Dev and Ops in collaboration with this focus the effort will most certainly fail.
 
## 7.4. If your effort doesn't

__grok (i.e, Understand intuitively) what DevOps is in practice__ and have performed the __necessary analysis of the existing culture and a strategy for how to affect a change__ the effort again will likely fail.  

I say this because the culture is the largest influencer over the success of both Agile and DevOps and ultimately the path taken (i.e., plans made.)

## 7.5. Conway's Law states

> Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure.

From ["How Do Committees Invent?"](http://www.melconway.com/Home/Conways_Law.html)

Followed with

> Ways must be found to reward design managers for keeping their organizations lean and flexible. 

This was written over 50 years ago.

If your communication structure is broke, so shall your systems be.

## 7.6. DevOps is really about

Providing the culture, methods and repeated practices to permit stakeholders to collaborate.

## 7.7. What is DevOps culture?

> **culture** noun  \ *ˈkəl-chər* \
> the set of shared attitudes, values, goals, and practices that characterizes an institution or organization

I love when a word means precisely what you need it to mean.

With the stakeholders sharing the same attitudes, values, goals, using the same tools, methods and repeated practices for their particular discipline you have ***DevOps Culture***.

### 7.7.1. We were taught the requisite skills as children

![Paw Patrol](./images/paw_patrol.png)

### 7.7.2. Maintaining relationships is your most important skill

![Maintaining Relationships](./images/maintaining_relationships.png)

### 7.7.3. Be quick... Be slow to... 

![Quick to slow](./images/quick_to_slow_to.png)

### 7.7.4. The pressures of social media

![Social Media](./images/social_media.png)

## 7.8. How is DevOps related to the Agile?

Agile Software Development is an umbrella term for a set of methods and practices based on the [values](http://www.agilealliance.org/agile101/the-agile-manifesto/) and [principles](http://www.agilealliance.org/agile101/12-principles-behind-the-agile-manifesto/) expressed in the Agile Manifesto.

For Agile, solutions evolve through collaboration between self-organizing, cross-functional teams utilizing the appropriate practices for their context.

DevOps builds on this.

## 7.9. How do they differ?

While DevOps extends Agile methods and practices by adding communication and collaboration between

- development,
- security,
- quality assurance, and
- technology operations

functionaries as stakeholders into the broader effort to ensure software systems are delivered in a reliable, low-risk manner.

## 7.10. Why?

In Agile Software Development, there is rarely an integration of these individuals outside the immediate application development team with members of technology operations (e.g., network engineers, administrators, testers, security engineers.)

## 7.11. What are the principles of DevOps?

As DevOps matures, several principles have emerged, namely the necessity for product teams to:

- Apply holistic thinking to solve problems,
- Develop and test against production-like environments,
- Deploy with repeatable and reliable processes,
- Remove the drudgery and uncertainty through automation,
- Validate and monitor operational quality, and
- Provide rapid, automated feedback to the stakeholders

## 7.12. Much of this is achieved

Through the repeated practices of Continuous Integration (CI) and Continuous Delivery (CD) often conflated into simply "CI/CD" or "CICD".

WARNING: After tools, CICD is the next (**albeit mistakenly**) thing thought to be the totality of DevOps.

## 7.13. What is Continuous Integration (CI)?

It is a repeated Agile software development practice lifted specifically from Extreme programming, where members of a development team frequently integrate their work to detect integration issues as quickly as possible thereby shifting discovery of issues "left" (i.e., early) in the software release.

## 7.14. How?

Each integration is orchestrated through a CI service/orchestrator (e.g., Jenkins CI, Drone CI, GitLab Runners, Concourse CI) that essentially assembles a build, runs unit and integration tests every time a predetermined trigger has been met; and then reports with immediate feedback.

## 7.15. CI best practices

### 7.15.1. Utilize a Configuration Management System

For the software's source code, where the mainline (i.e., master branch) is the most recent working version, past releases held in branches, and new features not yet merged into the mainline branch worked in their own branches.

### 7.15.2. Automate the build

By accompanying build automation (e.g., Gradle, Apache Maven, Make) alongside the source code.

### 7.15.3. Employ one or more CI services/orchestrators

To perform source code analysis via automating formal code inspection and assessment.

### 7.15.4. Make builds self-testing

In other words, ingrain testing by including unit and integration tests (e.g., Spock, JUnit, Mockito, SOAPUI, go package *Testing*) with the source code to be executed by the build automation to be executed by the CI service.

### 7.15.5. Never commit broken

Or untested source code to the CMS mainline or otherwise risk breaking a build.

### 7.15.6. Stakeholders are expected to pre-flight new code

Prior to committing source code in their own workspace.

### 7.15.7. The CI service/orchestrator provides feedback

On the success or fail of a build integration to all its stakeholders.

## 7.16. What is Continuous Delivery?

It is a repeated software development practice of providing a rapid, reliable, low-risk product delivery achieved through automating all facets of building, testing, and deploying software.

### 7.16.1. Extending Continuous Integration (CI)

With additional stages/steps aimed to provide ongoing validation that a newly assembled software build meets all desired requirements and thereby is releasable.

### 7.16.2. Consistency

Is achieved through delivering applications into production via individual repeatable pipelines of ingrained system configuration management and testing

## 7.17. But wait. What's a pipeline?

A pipeline automates the various stages/steps (e.g., Static Application Security Testing (SAST), build, unit testing, Dynamic Application Security Testing (DAST), secure configuration acceptance compliance, integration, function and non-functional testing, delivery, and deployment) to enforce quality conformance.

## 7.18. How is a pipeline manifested?

Each delivery pipeline is manifested as **Pipeline as Code** (i.e., software automation) accompanying the application's source code in its version control repository.

## 7.19. What underlines all of this?

I and the community of practice argue DevOps will struggle without ubiquitous access to shared pools of software configurable system resources and higher-level services that can be rapidly provisioned (i.e., cloud).

Although, it is actually possible to [DevOps on mainframes](https://www.youtube.com/watch?v=eMS97X5ZTGc) The video is in the contect of continuous delivery, but read between the lines.

## 7.20. But really why do we automate err. code?

In 2001, I think Larry Wall in his 1st edition of *Programming Perl* book put it best with "We will encourage you to develop the three great virtues of a programmer:

laziness,

impatience, and

hubris."

The second edition of the same book provided definitions for these terms

### 7.20.1. Why do I mention Larry Wall?

Well...

> _Once you have established yourself as an icon in your field 
> it is important that you pay tribute  to some of the great legends that came before you. 
> This kind of gesture will create the illusion that you’re still humble 
> and serve as a preemptive strike against anyone who has noticed 
> what a callus and delusional ass you have become._
>
> The opening monologue to the Blue Man Group’s _I Feel Love_
> https://www.youtube.com/watch?v=8vBKI3ya-l0

I kid, but in all serious the sentiment of this seminal book still holds true.

Let me explain.

### 7.20.2. Laziness

> The quality that makes you go to great effort to reduce overall energy expenditure. 
> It makes you write labor-saving programs that other people will find useful, and 
> document what you wrote so you don't have to answer so many questions about it. 
> Hence, the first great virtue of a programmer._ (p.609)

### 7.20.3. Impatience

> The anger you feel when the computer is being lazy. This makes you write programs 
> that don't just react to your needs, but actually anticipate them. Or at least 
> pretend to. Hence, the second great virtue of a programmer._ (p.608)

### 7.20.4. Hubris

> Excessive pride, the sort of thing Zeus zaps you for. Also, the quality that makes 
> you write (and maintain) programs that other people won't want to say bad things 
> about. Hence, the third great virtue of a programmer._ (p.607)

### 7.20.5. We automate for

- Faster, coordinated, repeatable, and therefore more reliable deployments.
- Discover bugs sooner. Shifting their discovery left in the process.
- To accelerates the feedback loop between Dev and Ops (Again, Ops is everyone not typically considered part of the development team.)
- Reduce tribal knowledge, where one group or person holds the keys to how things get done. Yep, this is about making us all replaceable.
- Reduce shadow IT (i.e., hardware or software within an enterprise that is not supported by IT. Just waiting for its day to explode.)

## 7.21. Monitoring

Once deployed, the work is done, right?

So, that improvements can be gauged and anomalies detected.A development team's work is not complete once a product leaves CICD and enters production; especially, under DevOps where the development team includes members of ops (e.g., security and technology operations).

### 7.21.1. The _primary_ metric

Is working software, but this is not the only, measurement.  The key to successful DevOps is knowing how well the methodology and the software it produces are performing.  Is the software truely dependable?

### 7.21.2. An understanding of performance

Is achieved by collecting and analyzing data produced by environments used for CICD and production.

### 7.21.3. Establish a baseline performance

So, that improvements can be gauged and anomalies detected.

### 7.21.4. Set reaction thresholds

To formulate and prioritize reactions weighting factors, such as, the frequency at which an anomaly arises and who is impacted.

### 7.21.5. Reacting

Could be as simple as operations instructing users through training to not do something that triggers the anomaly, or more ideally, result in an issue being entered into the product's backlog culminating in the development team delivering a fix into production.

### 7.21.6. Gaps in CICD

Are surfaces through monitoring resulting in for example additional testing for an issue discovered in prodcuction.

Yep. News flash. DevOps will not entirely stop all bugs or vulnerabilities from making it into production, but this was never the point.

### 7.21.7. Eliminating waste

Through re-scoping of requirements, re-prioritizing of a backlog, or the deprecation of unused features.  Again, all surfaced through monitoring.

## 7.22. Crawl, walk, run

### 7.22.1. Ultimately, DevOps is Goal

- With DevOps one does not simply hit the ground running.
- One must first crawl, walk and then ultimately run as you embrace the necessary culture change, methods, and repeated practices.
- Collaboration and automation are expected to continually improve so to achieve more frequent and more reliable releases.

# 8. Reading list

**AntiPatterns: Refactoring Software, Architectures, and Projects in Crisis**  
William J. Brown, Raphael C. Malveau, Hays W. "Skip" McCormick,  and Thomas J. Mowbray  
ISBN: 978-0-471-19713-3  
Apr 1998

**Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation (Addison-Wesley Signature Series (Fowler))**  
David Farley and Jez Humble  
ISBN-13: 978-0321601919  
August 2010

**The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations**  
Gene Kim Jez Humble,  Patrick Debois, and John Willis  
ISBN-13: 978-1942788003  
October 2016

**Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations**  
Nicole Forsgren PhD, Jez Humble, and Gene Kim  
ISBN-13: 978-1942788331  
March 27, 2018

**Site Reliability Engineering: How Google Runs Production Systems 1st Edition**  
Betsy Beyer, Chris Jones, Jennifer Petoff, and Niall Richard Murphy  
ISBN-13: 978-1491929124  
April 16, 2016  
Also, available online at https://landing.google.com/sre/book/index.html

**Release It!: Design and Deploy Production-Ready Software 2nd Edition**  
Michael T. Nygard  
ISBN-13: 978-1680502398  
January 18, 2018

**The SPEED of TRUST: The One Thing That Changes Everything**  
Stephen M .R. Covey  
ISBN-13: 978-1416549000  
February 5, 2008  
The gist of the book can be found at SlideShare https://www.slideshare.net/nileshchamoli/the-speed-of-trust-13205957

**RELATIONSHIP TRUST: The 13 Behaviors of High-Trust Leaders Mini Session**  
Franklin Covey Co.  
https://archive.franklincovey.com/facilitator/minisessions/handouts/13_Behaviors_MiniSession_Handout.pdf

**How to Deal With Difficult People**  
Ujjwal Sinha  
Oct 25, 2014  
The SlideShare can be found here https://www.slideshare.net/abhiujjwal/how-2-deal-wid-diiclt-ppl

**Leadership Secrets of the Rouge Warrior: A Commando's Guide to Success**
Richard Marcinko w/ John Weisman
ISBN-13: 978-0671545154
June 1, 1996

**Security Engineering: A Guide To Building Dependable Distributed Systems**
Ross Anderson
ISBN-13: 978-0470068526
April 14, 2008
The second edition of this book can be downloaded in whole from https://www.cl.cam.ac.uk/~rja14/book.html and Mr Anderson has released chapters from his 3rd edition under development.

**How Do Committees Invent?**
Melvin E. Conway
Copyright 1968, F. D. Thompson Publications, Inc.
http://www.melconway.com/Home/Conways_Law.html

**The Pragmatic Programmer: Your Journey To Mastery, 20th Anniversary Edition (2nd Edition)**
David Thomas and Andrew Hunt
ISBN-13: 978-0135957059
September 23, 2019

# 9. Now the hands-on part

In this class, you will spin up the following development and toolchain environment.

**NOTE**

- This class makes use of **NOTE** sections to call out things that are important to know or to drop a few tidbits. Reading these notes may save you some aggravation.
- If your web-based Git-repository manager is paired with a PlantUML server you will see a diagram rendered below otherwise you will only the PlantUML source code for the diagram. Don't worry the course's Ansible automation will spin up both a GitLab and PlantUML, and  instructions are provided below how create a repository in GitLab for this project and push the course repository into it, so you can view the diagrams.

```plantuml
@startuml
skinparam shadowing false

skinparam actor {
        BorderColor #0B5C92
        BackgroundColor none
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 18
}

skinparam node {
        BorderColor #0B5C92
        BackgroundColor #ffffff
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

skinparam rectangle {
        roundCorner 25
        BorderColor #0B5C92
        BackgroundColor #ffffff
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

skinparam component {
        BorderColor #0B5C92
        BackgroundColor #e0e59a
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}


skinparam note {
        BorderColor #0B5C92
        BackgroundColor #FEFECE
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

skinparam database {
        BorderColor #0B5C92
        BackgroundColor #e0e59a
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

actor "You" as you

rectangle "Host (i.e., your laptop, desktop)" {

  rectangle "Master Vagrant" as master {

	  rectangle "Docker CE" as docker1 {

			rectangle "Taiga" {
				component "nemonik/taiga" as taiga
        component "sameersbn/postgresql" as taiga_postgresql
			}

			rectangle "GitLab" {
				component "nemonik/gitlab" as gitlab
			  component "sameersbn/postgresql" as gitlab_postgresql
        component "redis" as gitlab_redis
			}

			rectangle "Drone CI" {
		    component "drone/server" as drone_server
    		component "drone/agent" as drone_agent
        component "sameersbn/postgresql" as drone_postgresql
			}

			rectangle "SonarQube" {
				component "sonarqube" as sonarqube
			}
  
			rectangle "PlantUML Server" {
				component "plantuml/plantuml-server" as plantuml_server
			}

			rectangle "Private\nDocker Registry" {
				component "registry" as private_registry
			}

      rectangle "Passthrough\nDocker Registry" {
				component "registry" as passthrough_registry
			}

		}

    note left of master
      Plus possible 
      additional worker 
      node Vagrant(s), 
      if configured.
    end note

		note left of docker1
			K3s containers
			not shown.
		end note
	}

	rectangle "Development Vagrant" {
		rectangle "Docker CE" as docker2 {
		}

    note left of docker2
      K3s containers
      not shown.
    end note
	}
}

taiga -[#0B5C92]-> taiga_postgresql

gitlab -[#0B5C92]-> gitlab_postgresql
gitlab -[#0B5C92]-> gitlab_redis

drone_server -[#0B5C92]-> drone_agent
drone_server -[#0B5C92]-> drone_postgresql

you .[#0B5C92].> sonarqube
you .[#0B5C92].> gitlab
you .[#0B5C92].> taiga
you .[#0B5C92].> plantuml_server
you .[#0B5C92].> drone_server
you .[#0B5C92].> private_registry
you .[#0B5C92].> passthrough_registry


@enduml
```

## 9.1. Configuring environmental variables

If your environment makes use of an HTTP proxy or SSL inspection, you will need to configure environment variables for this class. 

**On Mac OS X or \*NIX environments**

The following `set_env.sh` BASH script is included in the root of the project and can be used to configure the UNIX environment variables, but must be adjusted for your specific environment. 

```bash
#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# run in shell via
#
# ```
# . ./set_env.sh
# ```
#
# will set proxy setting to the the hard-cded value on line 36.
# Modify for your environment.
#
# ```
# . ./set_env.sh no_proxy
# ```
#
# will unset all proxy related environmental variables.

set_proxy=true

if [ $# -ne 0 ]; then
  args=("$@")
  if [[ $args[1] = "no_proxy" ]]; then
    set_proxy=false
  fi
fi

if [[ $set_proxy = true ]]; then
  export PROXY=http://gatekeeper.mitre.org:80
  echo "Setting proxy environment varaibles to $PROXY"
  export proxy=$PROXY
  export HTTP_PROXY=$PROXY
  export http_proxy=$PROXY
  export HTTPS_PROXT=$PROXY
  export https_proxy=$PROXY
  export ALL_PROXY=$PROXY
  export NO_PROXY="127.0.0.1,localhost,.mitre.org,.local,192.168.0.9,192.168.0.10,192.168.0.11,192.168.0.206,192.168.0.10,192.168.0.202,192.168.0.203,192.168.0.204,192.168.0.205"
 export no_proxy=$NO_PROXY
else
  echo "Unsetting proxy environment varaibles"
  unset PROXY
  unset proxy
  unset HTTP_PROXY
  unset http_proxy
  unset HTTPS_PROXY
  unset https_proxy
  unset NO_PROXY
  unset no_proxy
  unset ALL_PROXY
fi

export CA_CERTIFICATES=http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt,http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20NPE%20CA-3%281%29.crt
echo "Setting CA_CERTIFICATES environment variable to $CA_CERTIFICATES"

export VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS=0
echo "Setting VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS to $VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS"

# Force the use of the vagrant cacert.pem file
echo "unsetting CURL_CA_BUNDLE and SSL_CERT_FILE environment variables"
unset CURL_CA_BUNDLE
unset SSL_CERT_FILE
```

When in the root of the project, the script can be executed in the terminal session via

```bash
. ./set_env.sh
```

If you're doing this class on your MITRE Life cycle running OS X while on the MITRE network you will **NOT** want to set any proxy related environmental variable. So, you will want to execute this script in this manner

```bash
. ./set_env.sh no_proxy
```

If you have no HTTP proxy and no SSL inspection to be concerned about (such as running the class off of MITRE's corporate network), the alternative is to execute `unset.sh` BASH script to unset all these values:

```bash
#!/usr/bin/env bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# run in shell via
#
# ```
# . ./unset.sh
# ```

unset no_proxy
unset NO_PROXY
unset ALL_PROXY
unset PROXY
unset proxy
unset https_proxy
unset http_proxy
unset HTTP_PROXY
unset HTTPS_PROXY
unset ftp_proxy
unset FTP_PROXY
unset ca_certificates
unset CA_CERTIFICATES
```

Execute in terminal session via

```bash
. ./unset.sh
``` 

**On Windows**

If you are on Windows perform the following to set environmental variable adjusting for your environment:

1. In the Windows taskbar, enter `edit the system environment variables` into `Search Windows` and select the icon with the corresponding name. 
3. The `Systems Property` window will likely open in the background, so you will likely need to go find it and bring it forward.
4. In the `Systems Property`'s `Advanced` tab select `Environment Variables...` button.
5. In `Environment Variables` windows that opens, under `User variables for...` press `New ...` to open a `New User Variable` window, enter each `Variable Name` and and its respective `Value` for each pair in the table below

| Variable Name                      | Value                                                                                                                                                           |
|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| proxy                              | http://gatekeeper.mitre.org:80                                                                                                                                  |
| http_proxy                         | http://gatekeeper.mitre.org:80                                                                                                                                  |
| https_proxy                        | http://gatekeeper.mitre.org:80                                                                                                                                  |
| no_proxy                           | 127.0.0.1,localhost,.mitre.org,.local,192.168.0.9,192.168.0.10,192.168.0.11,192.168.0.206,192.168.0.10,192.168.0.202,192.168.0.203,192.168.0.204,192.168.0.205 |
| CA_CERTIFICATES                    | http://pki.mitre.org/MITRE%20BA%20Root.crt,http://pki.mitre.org/MITRE%20BA%20NPE%20CA-3%281%29.crt                                                              |
| VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS | 0                                                                                                                                                               |

If you're on MITRE Institute Lab PC you will want to set all of these variables.

If you're doing this class on your MITRE Life cycle running Windows (I have yet to verify a Windows MITRE Life cycle.) you will likely **NOT** want to set the `proxy`, `http_proxy`, `https_proxy`, `no_proxy` or any proxy related environmental variables. You will only need to set the `CA_CERTIFICATES` and `VAGRANT_ALLOW_PLUGIN_SOURCE_ERRORS` environment variables. 

**NOTE**

- The certificate URLs need to be encoded for parentheses to work.
- On Windows, you may inadvertently cut-and-paste blank space characters (e.g., tabs, spaces) and the subsequent Ansible automation may fail.

## 9.2. VirtualBox

You will need to install VirtualBox, a general-purpose full virtualizer for x86 hardware.

The class has been verified to work with VirtualBox 6.1.12.  Newer version may or may not work.

### 9.2.1. Installing VirtualBox

For the MITRE Institute class when I teach it, it is assumed VirtualBox is installed, but below are the instructions for installing it on Windows 10.

1. Open your browser to <https://www.virtualbox.org/wiki/Downloads>
2. Click `Windows hosts` link under `VirtualBox 6.1.12 platform packages`.
3. Find and click the installer to install.

You will also need to turn off `Hyper-V`, `Windows Sandbox` and `Windows Subsystem for Linux` if installed.

1. Click Windows `Start` and then type `turn Windows features on or off` into the search bar.
2. Select the icon with the corresponding name. 
3. This will open the `Windows Features` page and then unselect the `Hyper-V`, `Virtual Machine Platform`, `Windows Hypervisor Platform`, `Windows Sandbox` and `Windows Subsystem for Linux` checkboxes if enabled and then click `Okay`.

The same site has the Mac OS X download. The installation is less involved.  

If you're using Linux use your package manager.  For example, to install on Arch Linux one would use `sudo pacman -Syu virtualbox`.

## 9.3. Git Bash

Git Bash is `git` packaged for Windows with bash (a command-line shell) and a collection of other, separate *NIX utilities, such as, `ssh`, `scp`, `cat`, `find` and others compiled for Windows.

### 9.3.1. Installing Git Bash

If you are on Windows, you'll need to install `git`.

1. Download from https://git-scm.com/download/win
2. Click the installer.
3. Click `next` until you reach the `Configuring the line ending conversions` page select `Checkout as, commit Unix-style line endings`.
4. Then `next`, `next`, `next`...
5. Don't open git-bash from the final window as it will not have the environmental variables set.  Go onto step-6.
6. On the Windows task bar, enter `git` into `Search Windows` then select `Git Bash`.  Use `Git Bash` instead of `Command` or `Powershell`.

On OS X, `git` can be installed via [Homebrew](https://brew.sh/) or you can install the Git client directly <https://git-scm.com/download/mac>.

## 9.4. Retrieve the course material

If you are reading this on paper and have nothing else, you only have a small portion of the class material. You will need to download the class project containing all the automation to spin up a DevOps toolchain and development virtual machines, etc.

In a shell, for the purposes of the MITRE Institute class, this means in `Git Bash`, clone the project from [https://github.com/nemonik/hands-on-DevOps.git](https://github.com/nemonik/hands-on-DevOps.git) via git like so:

```
git -c http.sslVerify=false clone https://github.com/nemonik/hands-on-DevOps.git
```

Output will resemble (i.e., will not be precisely the same):

```
Cloning into 'hands-on-DevOps'...
remote: Enumerating objects: 52, done.
remote: Counting objects: 100% (52/52), done.
remote: Compressing objects: 100% (39/39), done.
remote: Total 5236 (delta 21), reused 28 (delta 11), pack-reused 5184
Receiving objects: 100% (5236/5236), 75.60 MiB | 13.40 MiB/s, done.
Resolving deltas: 100% (1578/1578), done.
```

## 9.5. Infrastructure as code (IaC)

This class uses Infrastructure as code (IaC) to set up the class environment (i.e., two or more virtual machines that will later be referred to as "vagrants".) IaC is the process of provisioning, and configuring (i.e., managing) computer systems through code, rather than directly manipulating the systems by hand (i.e., through manual processes).

This class uses Vagrant and Ansible IaC frameworks and the following sections will unpack each.

### 9.5.1. Hashicorp Packer

This class uses Packer, a command-line utility that can be used for many [use cases](https://www.terraform.io/intro/use-cases.html), but I primarily use to build EC2 and VirtualBox machine images.  In the case of VirtualBox to create Vagrant box.  In this class, if you select to use the `nemonik/alpine310` base box in the `ConfigurationVars` module defined in `configuration_vars.rb` file at the root of the project, then Terraform will be invoked to create the `nemonik/alpine310` box, and then this image will be used to create the `nemonik/devops_alpine310` box on which all the vagrants will be based.  If you select `ubuntu/bionic64` or `centos/7` these boxes will be retrieved from Hashicorp and then used to build their respective boxes: `nemonik/devops_bionic64` and `nemonik/devops_7` on top of which the class' vagrants are built.

#### 9.5.1.1. Packer document and source

Packer's documetnation can be found at [https://packer.io/docs/](https://packer.io/docs/).

Its canonical (i.e., authoritative) source can be found at [https://github.com/hashicorp/terraform](https://github.com/hashicorp/terraform).

#### 9.5.1.2. Installing Packer

Retrieved the installationation executable for your machine's operating system from here

https://releases.hashicorp.com/packer/1.5.1/

If you're on OS X you want [https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_darwin_amd64.zip](https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_darwin_amd64.zip) and if you're on Windows you want [https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_windows_amd64.zip](https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_windows_amd64.zip).

You may also be able to install Packer via your Linux operating system's package manager.

**Installing on OS X**

To install on OS X simply unpack and copy to `/user/local/bin/packer` as `root` for example

```bash
cd ~/Downloads
unzip ~/Downloads/packer_1.5.1_darwin_amd64.zip
Archive:  /Users/mjwalsh/Downloads/packer_1.5.1_darwin_amd64.zip
  inflating: packer
sudo cp ~/Downloads/packer /usr/local/bin
packer version
Packer v1.5.1
```

**Installing on Windows**

To install on Windows:

1. Right click the downloaded zip file.
2. Extract all.
3. Enter `C:\Program Files\packer_1.5.1_windows_amd64` as the path.
4. Extract.
5. Continue (Give admin permission.)
6. In the Windows taskbar, enter `env` into `Search Windows` and select `edit the system environment variables`.
7. In the `Systems Property`'s `Advanced` tab select `Environment Variables...` button.
8. In `Environment Variables` windows that opens, in `User variables for...` select the Path variable then select`Edit ...` to open a `Edit environment variable` window.
9. Select `new` and enter `C:\Program Files\packer_1.5.1_windows_amd64`.

#### 9.5.1.3. Packer project explained

The terraform project to build `nemonik/alpine310` box is found in `box/packer-alpine310` looks like so:

```plantuml
@startuml
skinparam shadowing false

skinparam folder {
        BorderColor #0B5C92
        BackgroundColor none
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 18
}

skinparam file {
        BorderColor #0B5C92
        BackgroundColor #ffffff
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

skinparam note {
        BorderColor #0B5C92
        BackgroundColor #FEFECE
        FontName "Yanone Kaffeesatz"
        FontStyle "Thin"
        FontSize 15
}

folder "packer-alpine310" as packeralpine310
file "alpine310.json" as alpine310json
file "build_box.sh" as buildboxsh
folder "configs" as configs
file "vagrantfile.tpl" as vagrantfiletpl
folder "http" as http
file "answer" as answer
folder "isos" as isos
file "nemonik_alpine310.box" as nemonikalpine310box
folder "packer_cache" as packercache
file "remove_box.sh" as removeboxsh
folder "scripts" as scripts
file "configure.sh" as configuresh

packeralpine310 -[#0B5C92]- alpine310json
packeralpine310 -[#0B5C92]- buildboxsh

packeralpine310 -[#0B5C92]- configs
configs -[#0B5C92]- vagrantfiletpl

packeralpine310 -[#0B5C92]- http
http -[#0B5C92]- answer

packeralpine310 -[#0B5C92]- isos
packeralpine310 -[#0B5C92]- nemonikalpine310box
packeralpine310 -[#0B5C92]- packercache
packeralpine310 -[#0B5C92]- removeboxsh

packeralpine310 -[#0B5C92]- scripts
scripts -[#0B5C92]- configuresh

@enduml
```

The folders and files have the following purpose:
- `alpine310.json` - is the packer template used to orchestrate the creation of the `nemonik_alpine310.box`. It defines the number of CPUs, the memory, the ISO used to install the VM's OS, the root password, the automation to install the OS, the scripts to call to further configure, and the box to result
- `build_box.sh` - is a bash shell script used to run the Packer build
- `configs` - a folder, holds the Vagrantfile template used in post processing the VM
- `vagrantfile.tpl` - is the template used in post processing the VM
- `http` - a folder, holds the `answer` file `wget` into the VM
- `answer`- holds all the answers provide to `setup-alpine` to configure the VM
- `isos` - a folder,is a cache that holds the ISOs downloaded to install Alpine, so that they don't have to be repeatedly downloaded
- `nemonik_alpine310.box` - the vagrant box created by Packer.
- `packer_cache` - a folder, is a packer cache used to speed production of the box
- `remove_box.sh` - a bash script used to remove the `nemonik_alpine310.box` from Vagrant
- `configure` - a folder, holding the shells script used to configure the VM
- `configure.sh` - the script to configure the VM past what is directed in `builders`' `boot_command` in `alpine310.json`

The bulk of the work is in `alpine310.json`, `http/answer` and `scripts/configure.sh`.

The contents of the `alpine310.json`:

```
{
  "description": "Build Alpine 3.10 x86_64 vagrant box",
  "variables": {
    "vm_name": "alpine-3.10.0-x86_64",
    "cpus": "1",
    "memory": "1024",
    "disk_size": "61440",
    "iso_local_url": "isos/x86_64/alpine-virt-3.10.0-x86_64.iso",
    "iso_download_url": "http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/x86_64/alpine-virt-3.10.0-x86_64.iso",
    "iso_checksum": "b3d8fe65c2777edcbc30b52cde7f5ae21dff8ecda612d5fe7b10d5c23cda40c4",
    "iso_checksum_type": "sha256",
    "root_password": "vagrant",
    "ssh_username": "root",
    "ssh_password": "vagrant"
  },
  "provisioners": [
    {
      "type": "shell",
      "execute_command": "/bin/sh -ux '{{.Path}}'",
      "script": "scripts/configure.sh"
    }
  ],
  "builders": [
    {
      "type": "virtualbox-iso",
      "headless": false,
      "vm_name": "{{user `vm_name`}}",
      "format": "ova",
      "guest_os_type": "Linux26_64",
      "guest_additions_mode": "disable",
      "disk_size": "{{user `disk_size`}}",
      "iso_urls": [
        "{{user `iso_local_url`}}",
        "{{user `iso_download_url`}}"
      ],
      "iso_checksum": "{{user `iso_checksum`}}",
      "iso_checksum_type": "{{user `iso_checksum_type`}}",
      "http_directory": "http",
      "communicator": "ssh",
      "ssh_username": "{{user `ssh_username`}}",
      "ssh_password": "{{user `ssh_password`}}",
      "ssh_wait_timeout": "10m",
      "shutdown_command": "/sbin/poweroff",
      "boot_wait": "30s",
      "boot_command": [
        "root<enter><wait>",
        "ifconfig eth0 up && udhcpc -i eth0<enter><wait10>",
        "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/answers<enter><wait>",
        "setup-alpine -f $PWD/answers<enter><wait5>",
        "{{user `root_password`}}<enter><wait>",
        "{{user `root_password`}}<enter><wait>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "y<enter>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "<wait10><wait10><wait10>",
        "mount /dev/sda2 /mnt<enter>",
        "echo 'PermitRootLogin yes' >> /mnt/etc/ssh/sshd_config<enter>",
        "umount /dev/sda2<enter>",
        "sync<enter>",
        "reboot<enter>"
      ],
      "hard_drive_interface": "sata",
      "vboxmanage": [
        [
          "modifyvm",
          "{{.Name}}",
          "--memory",
          "{{user `memory`}}"
        ],
        [
          "modifyvm",
          "{{.Name}}",
          "--cpus",
          "{{user `cpus`}}"
        ],
        [
          "modifyvm",
          "{{.Name}}",
          "--rtcuseutc",
          "on"
        ]
      ]
    }
  ],
  "post-processors": [
    [
      {
        "type": "vagrant",
        "vagrantfile_template": "configs/vagrantfile.tpl",
        "output": "nemonik_alpine310.box"
      }
    ]
  ]
}
```

Packer's `builders`' `boot_command`'s execution is very time sensitive, so you may need to add additional `<wait10>`s if the build was to fail for you.

#### 9.5.1.4. Packer execution

Along the way a modal will pop up asking you "Do you want the application “packer” to accept incoming network connections?". Give your approval otherwise Packer won't be able to do its job. The command-line output of Packer when creating the nemonik_alpine310.box will resemble:

```packer
INFO: Creating nemonik/devops_alpine310 box...
setting PROXYOPTS to none in http/answers
building nemonik_alpine310.box via packer
virtualbox-iso: output will be in this color.

==> virtualbox-iso: Retrieving ISO
==> virtualbox-iso: Trying isos/x86_64/alpine-virt-3.10.0-x86_64.iso
==> virtualbox-iso: Trying isos/x86_64/alpine-virt-3.10.0-x86_64.iso?checksum=sha256%3Ab3d8fe65c2777edcbc30b52cde7f5ae21dff8ecda612d5fe7b10d5c23cda40c4
==> virtualbox-iso: isos/x86_64/alpine-virt-3.10.0-x86_64.iso?checksum=sha256%3Ab3d8fe65c2777edcbc30b52cde7f5ae21dff8ecda612d5fe7b10d5c23cda40c4 => /Users/mjwalsh/Development/workspace/DevOps_class/alpine-playground/box/packer-alpine310/packer_cache/0172be7009f3c62b985d67dec5495188c7596bcd.iso
==> virtualbox-iso: Starting HTTP server on port 8922
==> virtualbox-iso: Creating virtual machine...
==> virtualbox-iso: Creating hard drive...
==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 3684)
==> virtualbox-iso: Executing custom VBoxManage commands...
    virtualbox-iso: Executing: modifyvm alpine-3.10.0-x86_64 --memory 1024
    virtualbox-iso: Executing: modifyvm alpine-3.10.0-x86_64 --cpus 1
    virtualbox-iso: Executing: modifyvm alpine-3.10.0-x86_64 --rtcuseutc on
==> virtualbox-iso: Starting the virtual machine...
==> virtualbox-iso: Waiting 30s for boot...
==> virtualbox-iso: Typing the boot command...
```

A little VirtualBox window for the VM will also pop up, so that you can monitor progress as Alpine is installed. At some point Alpine will reboot and Packer will continue outputting:

```packer
==> virtualbox-iso: Using ssh communicator to connect: 127.0.0.1
==> virtualbox-iso: Waiting for SSH to become available...
==> virtualbox-iso: Provisioning with shell script: scripts/configure.sh
==> virtualbox-iso: + rc-update -u
    virtualbox-iso:  * Caching service dependencies ... [ ok ]
==> virtualbox-iso: + setup-apkcache
==> virtualbox-iso: + apk update
    virtualbox-iso: Enter apk cache directory (or '?' or 'none') [/var/cache/apk]: fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
    virtualbox-iso: v3.10.4-14-g975b6a3945 [http://dl-cdn.alpinelinux.org/alpine/v3.10/main/]
    virtualbox-iso: OK: 5669 distinct packages available
==> virtualbox-iso: + apk upgrade -U --available
    virtualbox-iso: OK: 87 MiB in 52 packages
==> virtualbox-iso: + apk add -U bash bash-completion sudo curl
    virtualbox-iso: (1/10) Installing readline (8.0.0-r0)
    virtualbox-iso: (2/10) Installing bash (5.0.0-r0)
    virtualbox-iso: Executing bash-5.0.0-r0.post-install
    virtualbox-iso: (3/10) Installing bash-completion (2.8-r0)
    virtualbox-iso: (4/10) Installing openrc-bash-completion (0.41.2-r1)
    virtualbox-iso: (5/10) Installing ca-certificates (20190108-r0)
    virtualbox-iso: (6/10) Installing nghttp2-libs (1.39.2-r0)
    virtualbox-iso: (7/10) Installing libcurl (7.66.0-r0)
    virtualbox-iso: (8/10) Installing curl (7.66.0-r0)
    virtualbox-iso: (9/10) Installing kmod-bash-completion (24-r1)
    virtualbox-iso: (10/10) Installing sudo (1.8.27-r2)
    virtualbox-iso: Executing busybox-1.30.1-r3.trigger
    virtualbox-iso: Executing ca-certificates-20190108-r0.trigger
    virtualbox-iso: OK: 94 MiB in 62 packages
==> virtualbox-iso: + echo http://dl-cdn.alpinelinux.org/alpine/v3.10/community
==> virtualbox-iso: + apk add -U virtualbox-guest-additions virtualbox-guest-modules-virt
    virtualbox-iso: fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
    virtualbox-iso: (1/3) Installing virtualbox-guest-additions (6.0.8-r1)
    virtualbox-iso: Executing virtualbox-guest-additions-6.0.8-r1.pre-install
    virtualbox-iso: (2/3) Installing virtualbox-guest-modules-virt (4.19.98-r0)
    virtualbox-iso: (3/3) Installing virtualbox-guest-additions-openrc (6.0.8-r1)
    virtualbox-iso: Executing busybox-1.30.1-r3.trigger
    virtualbox-iso: Executing kmod-24-r1.trigger
    virtualbox-iso: OK: 98 MiB in 65 packages
==> virtualbox-iso: + rc-update add virtualbox-guest-additions
    virtualbox-iso:  * service virtualbox-guest-additions added to runlevel default
==> virtualbox-iso: + echo vboxsf
==> virtualbox-iso: + echo 'UseDNS no'
==> virtualbox-iso: + adduser -D vagrant
==> virtualbox-iso: + chpasswd
==> virtualbox-iso: + echo vagrant:vagrant
==> virtualbox-iso: chpasswd: password for 'vagrant' changed
==> virtualbox-iso: + mkdir -pm 700 /home/vagrant/.ssh
==> virtualbox-iso: + chown -R vagrant:vagrant /home/vagrant/.ssh
==> virtualbox-iso: + wget -O /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
==> virtualbox-iso: Connecting to raw.githubusercontent.com (151.101.0.133:443)
==> virtualbox-iso: authorized_keys      100% |********************************|   409  0:00:00 ETA
==> virtualbox-iso: + chmod 644 /home/vagrant/.ssh/authorized_keys
==> virtualbox-iso: + adduser vagrant wheel
==> virtualbox-iso: + echo 'Defaults exempt_group=wheel'
==> virtualbox-iso: + echo '%wheel ALL=NOPASSWD:ALL'
==> virtualbox-iso: + sed -i.bak 's@/ash$@/bash@g' /etc/passwd
==> virtualbox-iso: + rm /etc/passwd.bak
==> virtualbox-iso: + echo
==> virtualbox-iso: + rm -Rf /var/cache/apk/APKINDEX.6456cd1a.tar.gz /var/cache/apk/APKINDEX.d8b2a6f4.tar.gz /var/cache/apk/bash-5.0.0-r0.045599ea.apk /var/cache/apk/bash-completion-2.8-r0.c0f500d3.apk /var/cache/apk/ca-certificates-20190108-r0.c0ec382f.apk /var/cache/apk/curl-7.66.0-r0.86434890.apk /var/cache/apk/installed /var/cache/apk/kmod-bash-completion-24-r1.ea84cd3e.apk /var/cache/apk/libcurl-7.66.0-r0.ae6524b8.apk /var/cache/apk/nghttp2-libs-1.39.2-r0.6f35d6f8.apk /var/cache/apk/openrc-bash-completion-0.41.2-r1.198430a1.apk /var/cache/apk/readline-8.0.0-r0.32186548.apk /var/cache/apk/sudo-1.8.27-r2.fe94d45e.apk /var/cache/apk/virtualbox-guest-additions-6.0.8-r1.b025c3f0.apk /var/cache/apk/virtualbox-guest-additions-openrc-6.0.8-r1.b528fb1a.apk /var/cache/apk/virtualbox-guest-modules-virt-4.19.98-r0.f198f848.apk
==> virtualbox-iso: + dd 'if=/dev/zero' 'of=/EMPTY' 'bs=1M'
```

It will take some time to zero out the unused portion of the root drive, but Packer will continue:

```packer
==> virtualbox-iso: 59959+0 records in
==> virtualbox-iso: 59958+0 records out
==> virtualbox-iso: + rm -f /EMPTY
==> virtualbox-iso: + cat /dev/null
==> virtualbox-iso: + history -c
==> virtualbox-iso: + sync
==> virtualbox-iso: + sync
==> virtualbox-iso: + sync
==> virtualbox-iso: + exit 0
==> virtualbox-iso: Gracefully halting virtual machine...
==> virtualbox-iso: Preparing to export machine...
    virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 3684)
==> virtualbox-iso: Exporting virtual machine...
    virtualbox-iso: Executing: export alpine-3.10.0-x86_64 --output output-virtualbox-iso/alpine-3.10.0-x86_64.ova
==> virtualbox-iso: Deregistering and deleting VM...
==> virtualbox-iso: Running post-processor: vagrant
==> virtualbox-iso (vagrant): Creating Vagrant box for 'virtualbox' provider
    virtualbox-iso (vagrant): Unpacking OVA: output-virtualbox-iso/alpine-3.10.0-x86_64.ova
    virtualbox-iso (vagrant): Renaming the OVF to box.ovf...
    virtualbox-iso (vagrant): Using custom Vagrantfile: configs/vagrantfile.tpl
    virtualbox-iso (vagrant): Compressing: Vagrantfile
    virtualbox-iso (vagrant): Compressing: alpine-3.10.0-x86_64-disk001.vmdk
    virtualbox-iso (vagrant): Compressing: box.ovf
    virtualbox-iso (vagrant): Compressing: metadata.json
Build 'virtualbox-iso' finished.

==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: nemonik_alpine310.box
```

### 9.5.2. Vagrant

This class uses Vagrant, a command-line utility for managing the life cycle of virtual machines as a vagrant in that the VMs are not meant to hang around in the same place for very long.

Unless you want to pollute your machine with every imaginable programming language, framework and library version you'll find yourself often creating a virtual machine (VM) for each software project. Sometimes more than one. And if you're like me of the past you'll end up with a VirtualBox full of VMs. If you haven't gone about this the right way, you'll end up wondering what VM went with which project and now how did I create it? The anti-pattern around this problem is to write documentation. A better way that aligns with a DevOps repeatable practices is to create automation to provision and configure your development VMs. This is where Vagrant comes in as it is "a command-line utility for managing the life cycle of virtual machines."

#### 9.5.2.1. Vagrant documentation and source

Vagrant's documentation can be found at

<https://www.vagrantup.com/docs/index.html>

It's canonical (i.e., authoritative) source can be found at

<https://github.com/hashicorp/vagrant/>

Vagrant is written in Ruby. In fact, a Vagrantfile is written in a Ruby DSL and I make full use of this to extend the functionality of the Vagrantfile..

#### 9.5.2.2. Installing Vagrant

1. If you are Windows or OS X download Vagrant from 

  <https://releases.hashicorp.com/vagrant/2.2.9/>  

  The class has been verified to work with Version 2.2.9.  Newer version may or may not work.

  If you're using Linux, use your operating system's package manager to install `vagrant`.  For exmple, to install on Arch Linux one would use

  ```bash
  sudo pacman -Syu vagrant
  ```

2. Click on the installer once downloaded and follow along. On Windows, the installer may stall calculating for a bit and may bury modals you'll need to respond to in the Windows Task bar, so keep an eye out for that. The installer will automatically add the vagrant command to your system path so that it is available on the command line. If it is not found, the documentation advises you to try logging out and logging back into your system. This is particularly necessary sometimes for Windows. Windows will require a reboot, so remember to **come back and complete step-3, if you are on the MITRE corporate network**.

3. **If you're not on the MITRE corporate network please skip this step.**  

   - On Windows, use the File Explorer to replace the existing `C:\Hashicorp\vagrant\embedded\cacert.pem` file with the project's `vagrant_files/cacert.pem` by using the File Explorer.

   - On Mac OS X, copy it to `/opt/vagrant/embedded` as *root* using
   
   ```bash
   sudo cp vagrant_files/cacert.pem /opt/vagrant/embedded/.
   ```

**NOTE**

- Vagrant respects `SSL_CERT_FILE` and `CURL_CA_BUNDLE` environment variables used to point to cacert bundles.  If you run into SSL errors, you may have `SSL_CERT_FILE` and/or `CURL_CA_BUNDLE` environment variable files set requiring you to add MITRE CA certificates to the file specified by these environment variables.  If you use the `set_env.sh` at the root of the project it will unset these environment variables forcing vagrant to use its cacert.pem file you replace above.
- The same site has the Mac OS X download, whose installation is less involved.  

#### 9.5.2.3. The Vagrantfile explained

The `Vagrantfile` found at the root of the project describes how to provision and configure one or more virtual machines.

Vagrant's own documentation puts it best:

> Vagrant is meant to run with one Vagrantfile per project, and the Vagrantfile is 
> supposed to be committed to version control. This allows other developers involved
> in the project to check out the code, run vagrant up, and be on their way. 
> Vagrantfiles are portable across every platform Vagrant supports.

If we were instead provisioning Amazon EC2 instances, we'd alternatively use [Terraform](https://www.terraform.io/), a tool for building, changing, and versioning infrastructure.

The following sub-sections enumerate the various sections of the `Vagrantfile` broken apart in order to discuss.

##### 9.5.2.3.1. Modelines

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :
```

When authoring, tells your text editor (e.g. emacs or vim) to choose a specific editing mode for the Vagrantfile. Line one is a [modeline for emacs](http://www.gnu.org/software/emacs/manual/html_node/emacs/Choosing-Modes.html) and line two is a [modeline for vim](http://vim.wikia.com/wiki/Modeline_magic).

##### 9.5.2.3.2. Setting extra variables for Ansible roles

The following lines: 

```ruby
# Vagrant will start at your current path and then move upward looking
# for a Vagrant file.  The following will provide the path for the found
# Vagrantfile, so you can execute `vagrant` commands on the command-line
# anywhere in the project a Vagrantfile doesn't already exist.
vagrantfilePath = ""
if File.dirname(__FILE__).end_with?('Vagrantfile')
   vagrantfilePath = File.dirname(File.dirname(__FILE__))
else
   vagrantfilePath = File.dirname(__FILE__)
end

# Used to hold all the configuration variable and convienance methods for accessing
require File.join(vagrantfilePath, 'configuration_vars.rb')
```

in the Vagrantfile at the root of the project will include `configuration_vars.rb` Ruby module.  This Ruby module defines the Ansible extra_vars used by Ansible roles found in `ansible/roles` and `box/ansible/role` as well as the bash scripting templates used by the `Vagrantfile` at the root of the project as well as the `box/Vagrantfile` as well as the bash scripts found in `box/`.  You would update the version of GitLab used by the class by updating `:gitlab_version` here.

The contents of `configuration_vars.rb` Ruby module will resemble:

```ruby
#-*- mode: ruby -*-
# vi: set ft=ruby :

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

module ConfigurationVars

  # Define variablese
  VARS = {

    # The network block the cluster and apps will be in
    network_prefix: "192.168.0",

#    # Add OpenEBS drives ('yes'/'no')
#    openebs_drives: 'yes',
    openebs_drives: 'no',

    # Sets the OpenEBS drive size in GB
    openebs_drive_size_in_gb: 100,

    # Provision and configure development vagrant ('yes'/'no')
#    create_development: 'no',
    create_development: 'yes',
    development_is_worker_node: 'yes',

    # The number of nodes to provision the Kubernetes cluster. One will be a master.
    nodes: 2,
#    nodes: 1,

    # The Vagrant box to base our DevOps box on.  Pick just one.

    base_box: 'centos/7',
    base_box_version: '2004.01', 

#    base_box: 'ubuntu/bionic64',
#    base_box_version: '20200304.0.0',

#    base_box: 'nemonik/alpine310',
#    base_box_version: '0',

    vagrant_root_drive_size: '80GB', 

    ansible_version: '2.9.9',

    default_retries: '60',
    default_delay: '10',

    docker_timeout: '300',
    docker_retries: '60',
    docker_delay: '10',

    k3s_version: 'v1.18.6+k3s1',
    k3s_cluster_secret: 'kluster_secret',

    kubectl_version: 'v1.17.0',
    kubectl_checksum: 'sha256:6e0aaaffe5507a44ec6b1b8a0fb585285813b78cc045f8804e70a6aac9d1cb4c',

    kubernetes_dashboard: 'yes',
    kubernetes_dashboard_version: 'v2.0.0',

    traefik: 'yes',
    traefik_version: '1.7.26',
    traefik_http_port: '80',
    traefik_admin_port: '8080',
    traefik_host: '192.168.0.206',

    metallb: 'yes',
    metallb_version: 'v0.9',

    kompose_version: '1.18.0',

    docker_compose_version: '1.24.1',
    docker_compose_pip_version: '1.25.0rc2',

    helm_cli_version: '3.2.1',
    helm_cli_checksum: '018f9908cb950701a5d59e757653a790c66d8eda288625dbb185354ca6f41f6b',

    registry_version: '2.7.1',
    registry: 'yes',
    registry_host: '192.168.0.10',
    registry_port: '5000',
    passthrough_registry: 'yes',
    passthrough_registry_host: '192.168.0.10',
    passthrough_registry_port: '5001',
    registry_deploy_via: 'docker-compose',

    gitlab: 'yes',
    gitlab_version: '13.2.3',
    gitlab_host: '192.168.0.202',
    gitlab_port: '80',
    gitlab_ssh_port: '10022',
    gitlab_user: 'root',

    drone: 'yes',
    drone_version: '1.9.0',
    drone_runner_docker_version: '1.4.0',
    drone_host: '192.168.0.10',

    drone_cli_version: 'v1.2.1',

    plantuml_server: 'yes',
    plantuml_server_version: 'latest',
    plantuml_host: '192.168.0.203',
    plantuml_port: '80',

    taiga: 'yes',
    taiga_version: 'latest',
    taiga_host: '192.168.0.204',
    taiga_port: '80',

    sonarqube: 'yes',
    sonarqube_version: '8.4.1-community',
    sonarqube_host: '192.168.0.205',
    sonarqube_port: '9000',

    sonar_scanner_cli_version: '4.3.0.2102',

    inspec_version: '4.18.39',

    python_container_image: 'yes', 
    python_version: '2.7.17',

    golang_container_image: 'yes',
    golang_sonarqube_scanner_image: 'yes',
    golang_version: '1.13.7',  

    selenium_standalone_chrome_version: '3.141',

    standalone_firefox_container_image: 'yes',
    selenium_standalone_firefox_version: '3.141',

    owasp_zap2docker_stable_image: 'yes',
    zap2docker_stable_version: '2.8.0',

    openwhisk: 'yes',
    openwhisk_host: '192.168.0.207',

    cache_path: '/vagrant/cache',
    images_cache_path: '/vagrant/cache/images',

    create_cache: 'yes',

    host_os: (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        'windows'
      when /darwin|mac os/
        'macosx'
      when /linux/
        'linux'
      when /bsd/
        'unix'
      else
        raise Error, "unknown os: #{host_os.inspect}"
      end
    )
  }

  VARS[:ansible_python_version] = (
   if VARS[:base_box].downcase.include? 'centos' and VARS[:base_box].to_s.include? '7'
     'python2'
   else
     'python3'
   end
  )

  def ConfigurationVars.as_string( http_proxy, https_proxy, ftp_proxy, no_proxy, certs)

    vars = VARS

    vars[:http_proxy] = (!http_proxy ? "" : http_proxy)
    vars[:https_proxy] = (!https_proxy ? "" : https_proxy)
    vars[:ftp_proxy] = (!ftp_proxy ? "" : ftp_proxy)
    vars[:no_proxy] = (!no_proxy ? "" : no_proxy)

    vars[:CA_CERTIFICATES] = ''

    unless certs.nil? || certs == ''
      vars[:CA_CERTIFICATES] = certs
    end

    vars_string = ''

    vars.each do |key, value|
      if ( ( key == :CA_CERTIFICATES ) && ( !value.nil? ) && value != '' )
        vars_string = vars_string + "\\\"#{key}\\\":\\\["
        value.each { |item|
          vars_string = vars_string + "\\\"#{item}\\\","
        }
        vars_string = vars_string.chop + '\\],'
      else
        if (value.is_a? Integer)
          value = value.to_s
        end

        vars_string = vars_string + "\\\"#{key}\\\":\\\"#{value}\\\","
      end
    end

    return '\\{' + vars_string.chop + '\\}'
  end

  DETERMINE_OS_TEMPLATE = <<~SHELL
    os=""
    if [[ $(command -v lsb_release | wc -l) == *"1"* ]]; then
      os="$(lsb_release -is)-$(lsb_release -cs)"
    elif [ -f "/etc/os-release" ]; then
      if [[ $(cat /etc/os-release | grep -i alpine | wc -l) -gt "0" ]]; then
        os="Alpine"
      elif [[ $(cat /etc/os-release | grep -i "CentOS Linux 7" | wc -l) -gt "0" ]]; then
        os="CentOS 7"
      fi
    else
      echo -n "Cannot determine OS."
      exit -1
    fi
  SHELL

  OS_PACKAGES_FROM_CACHE_TEMPLATE = <<~SHELL
    mkdir -p /tmp/root-cache
    box="#{VARS[:base_box]}"
    case $os in
      "Alpine")
        package_manager="apk"
        ;;
      "Ubuntu-bionic")
        package_manager="apt"
        ;;
      "CentOS 7")
        package_manager="yum"
        ;;
      *)
        echo -n "${os} not supported."
        exit -1
        ;;
    esac
    if [ -f "/vagrant/cache/TYPE/${box}/${package_manager}.tar.gz" ]; then
      update=true
      if [ -f "/tmp/root-cache/${package_manager}.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/${package_manager}.tar.gz"`!=`stat -c%s "/tmp/root-cache/${package_manager}.tar.gz"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Installing ${box} ${package_manager} packages from cache...
        cd /tmp/root-cache
        cp /vagrant/cache/TYPE/${box}/${package_manager}.tar.gz ${package_manager}.tar.gz
        tar zxf ${package_manager}.tar.gz
        if [ -d "${package_manager}" ]; then
          case $os in
            "Alpine")
              echo "installing apk packages from cache..."
              apk add --repositories-file=/dev/null --allow-untrusted --no-network apk/*.apk
              ;;
            "Ubuntu-bionic")
              #echo "installing apt packages from cache..."
              #cd apt/archives
              #dpkg -i ./*.deb
              #apt --fix-broken install
              echo "not yet reliable..."
              ;;
            "CentOS 7")
              mv yum /var/cache/
              ;;
            *)
              echo "${os} not supported." 1>&2
              exit -1
              ;;
          esac
        fi
        rm -Rf ${package_manager}
      else
        echo No new ${box} packages in cache...
      fi
    else
      echo No cached ${box} packages...
    fi
  SHELL

  INSTALL_ANSIBLE_DEPENDENCIES_TEMPLATE = <<~SHELL
    case $os in
      "Alpine")
        # install Alpine packages
        apk add python3 python3-dev py3-pip musl-dev libffi-dev libc-dev py3-cryptography make gcc libressl-dev
        ;;
      "Ubuntu-bionic")
        apt update
        apt upgrade -y
        apt install -y python3 python3-dev python3-pip make gcc
        ;;
      "CentOS 7")
        yum install -y epel-release
        yum install -y python python-pip make gcc
        ;;
      *)
        echo "${os} not supported." 1>&2
        exit -1
        ;;
    esac
  SHELL

  RESIZE_ROOT_TEMPLATE = <<~SHELL
    case $os in
      "Alpine")
        # install Alpine packages
        echo "resize root not yet handled."
        ;;
      "Ubuntu-bionic")
      echo "resize root not yet handled."
        ;;
      "CentOS 7")
      echo "Resizing root volume..."
      yum -y install cloud-utils-growpart
      growpart /dev/sda 1
      xfs_growfs /
        ;;
      *)
        echo "${os} not supported." 1>&2
        exit -1
        ;;
    esac
  SHELL


  SITE_PACKAGES_FROM_CACHE_TEMPLATE = <<~SHELL
    if [ -f "/vagrant/cache/TYPE/${box}/site-packages.tar.gz" ]; then
      update=true
      if [ -f "/tmp/root-cache/site-packages.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/site-packages"`!=`stat -c%s "/tmp/root-cache/site-packages"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Unpacking #{ VARS[:ansible_python_version] } site-packages from cache...
        cd /tmp/root-cache
        cp /vagrant/cache/TYPE/${box}/site-packages.tar.gz site-packages.tar.gz
        cd /usr/lib/#{ VARS[:ansible_python_version] }*
        tar zxvf /tmp/root-cache/site-packages.tar.gz
      else
        echo No new updates to site-packages in cache...
      fi
    fi
  SHELL

  USER_CACHED_CONTENT_TEMPLATE = <<~SHELL
    mkdir -p /tmp/vagrant-cache
    box="#{VARS[:base_box]}"
    if [ "${os}" == "CentOS 7" ] && [ -f "/vagrant/cache/TYPE/${box}/rvm.tar.gz" ]; then
      update=true
      if [ -f "/tmp/vagrant-cache/rvm.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/rvm.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/rvm.tar.gz"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Unpacking /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] from cache...
        cp /vagrant/cache/TYPE/${box}/rvm.tar.gz /tmp/vagrant-cache/rvm.tar.gz
        cd /home/vagrant/
        tar zxvf /tmp/vagrant-cache/rvm.tar.gz
      else
        echo No new updates to /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] in cache...
      fi
    else
      echo No /home/vagrant/[.rvm .gnupg .bash_profile .bashrc .profile .mkshrc .zshrc .zlogin] in cache...
    fi
    if [ -f "/vagrant/cache/TYPE/${box}/cache.tar.gz" ]; then
      update=true
      if [ -f "/tmp/vagrant-cache/cache.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/cache.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/cache.tar.gz"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Unpacking /home/vagrant/.cache from cache...
        cp /vagrant/cache/TYPE/${box}/cache.tar.gz /tmp/vagrant-cache/cache.tar.gz
        cd /home/vagrant/
        tar zxvf /tmp/vagrant-cache/cache.tar.gz
      else
        echo No new updates to /home/vagrant/.cache in cache...
      fi
    else
      echo No /home/vagrant/.cache cache...
    fi
    if [ -f "/vagrant/cache/TYPE/${box}/local.tar.gz" ]; then
      update=true
      if [ -f "/tmp/vagrant-cache/local.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/local.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/local.tar.gz"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Unpacking /home/vagrant/.local from cache...
        cp /vagrant/cache/TYPE/${box}/local.tar.gz /tmp/vagrant-cache/local.tar.gz
        cd /home/vagrant/
        tar -zxvf /tmp/vagrant-cache/local.tar.gz
      else
        echo No new updates to /home/vagrant/.local in cache...
      fi
    else
      echo No /home/vagrant/.local cache...
    fi
    if [ -f "/vagrant/cache/TYPE/${box}/gem.tar.gz" ]; then
      update=true
      if [ -f "/tmp/vagrant-cache/gem.tar.gz" ]; then
        if ((`stat -c%s "/vagrant/cache/TYPE/${box}/gem.tar.gz"`!=`stat -c%s "/tmp/vagrant-cache/gem.tar.gz"`)); then
          update=false
        fi
      fi
      if ($update == true); then
        echo Unpacking /home/vagrant/.gem from cache...
        cp /vagrant/cache/TYPE/${box}/gem.tar.gz /tmp/vagrant-cache/gem.tar.gz
        cd /home/vagrant
        tar -zxvf /tmp/vagrant-cache/gem.tar.gz
      else
        echo No new updates to /home/vagrant/.gem in cache...
      fi
    else
      echo No /home/vagrant/.gem cache...
    fi
  SHELL
end
```

##### 9.5.2.3.3. Automatically installing and removing the necessary Vagrant plugins

Vagrant can be extended by plugins and this class makes use of a number of them.  One of which, the `vagrant-vbguest` plugin is not installed if the Vagrant's base operating system is Alpine, but is installed otherwise.

```ruby
uninstall_plugins = %w( vagrant-cachier vagrant-alpine )
required_plugins = %w( vagrant-timezone vagrant-proxyconf vagrant-certificates vagrant-disksize vagrant-reload ) # vagrant-disksize

if (not os.downcase.include? 'alpine')
  required_plugins = required_plugins << "vagrant-vbguest"
else
  # as alpine is currently not supported by vagrant-vbguest
  uninstall_plugins = uninstall_plugins << "vagrant-vbguest"
end

# Uninstall the following plugins
plugin_uninstalled = false
uninstall_plugins.each do |plugin|
  if Vagrant.has_plugin?(plugin)
    system "vagrant plugin uninstall #{plugin}"
    plugin_uninstalled = true
  end
end

# Require the following plugins
plugin_installed = false
required_plugins.each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    system "vagrant plugin install #{plugin}"
    plugin_installed = true
  end
end

#system "vagrant plugin update"

# if plugins were installed, restart
if plugin_installed || plugin_uninstalled
  puts "restarting"
  exec "vagrant #{ARGV.join' '}"
end
```

##### 9.5.2.3.4. Inserting Proxy setting via host environmental variables

Later in the Vagrantfile, a bit of code makes use of the `vagrant-proxyconf` plugin to configure the HTTP proxy settings for the vagrants (i.e., the transient VMs).

```ruby
  # Set proxy settings for all vagrants
  #
  # Depends on install of vagrant-proxyconf plugin.
  #
  # To use:
  #
  # 1.  Install `vagrant plugin install vagrant-proxyconf`
  # 2.  Set environmental variables for `http_proxy`, `https_proxy`, `ftp_proxy`, and `no_proxy`
  #
  #     For example:
  #
  #     ```
  #     export http_proxy=
  #     export https_proxy=
  #     export ftp_proxy=
  #     export no_proxy=
  #     ```
  if (ENV['http_proxy'] || ENV['https_proxy'])
    config.proxy.http = ENV['http_proxy']
    config.proxy.https = ENV['https_proxy']
    config.proxy.ftp = ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
    config.proxy.enabled = { docker: false }

    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: HTTP Proxy variables set.".green
      puts "INFO: http_proxy = #{ config.proxy.http }".green
      puts "INFO: https_proxy = #{ config.proxy.https }".green
      puts "INFO: ftp_proxy = #{ config.proxy.ftp }".green
      puts "INFO: no_proxy = #{ config.proxy.no_proxy }".green
    end
  else
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: No http_proxy or https_proxy environment variables are set.".green
    end

    config.proxy.http = nil
    config.proxy.https = nil
    config.proxy.ftp = nil
    config.proxy.no_proxy = nil
    config.proxy.enabled = false
  end
```

##### 9.5.2.3.5. Inserting enterprise CA certificates

Later still, a bit of code makes use of the `vagrant-certificates` plugin's to inject the specified certificates into the vagrants. This is useful, for example, if your enterprise network has a firewall (or appliance) which utilizes SSL interception. So, the existence of this plugin tell us more broadly others have to deal with the havoc SSL interception brings to development.

```ruby
  # To add Enterprise CA Certificates to all vagrants
  #
  # Depends on the install of the vagrant-certificates plugin
  #
  # To use:
  #
  # 1.  Install `vagrant plugin install vagrant-certificates`.
  # 2.  Set environement variable for `CA_CERTIFICATES` containing a comma separated list of certificate URLs.
  #
  #     For example:
  #
  #     ```
  #     export CA_CERTIFICATES=http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt,http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20NPE%20CA-3%281%29.crt
  #     ```
  #
  #     The Root certificate *must* be denotes as the root certificat like so:
  #
  #     http://employeeshare.mitre.org/m/mjwalsh/transfer/MITRE%20BA%20ROOT.crt
  #

  if ENV['CA_CERTIFICATES']
    # Because @williambailey's vagrant-ca-certificates has an issue  https://github.com/williambailey/vagrant-ca-certificates/issues/34 I am using @Toilal fork, vagrant-certificates
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: CA Certificates set to #{ ENV['CA_CERTIFICATES'] }".green
    end

    config.certificates.enabled = true
    config.certificates.certs = ENV['CA_CERTIFICATES'].split(',')
  else
    if ( ARGV.include? 'up' ) || ( ARGV.include? 'provision' )
      puts "INFO: No CA_CERTIFICATES environment variable set.".green
    end
    config.certificates.certs = nil
    config.certificates.enabled = false
  end
```

##### 9.5.2.3.6. Auto-generate the Ansible inventory file

The Vagrantfile doesn't make use of the Vagrant's own [Ansible Local provisioner](https://www.vagrantup.com/docs/provisioning/ansible_local.html), but instead makes use of the `Shell` provisioner to install and use Ansible to configure the Vagrants.  

To do this Ansible needs an inventory file and so the Vagrantfile dynamically creates the inventory file via the following code:

```ruby
# Write hosts file for Ansible

require 'erb'

@worker_nodes = [*1..ConfigurationVars::VARS[:nodes]-1]

template = <<-TEXT
#
# Do not change this file by hand as it is dynamically generated via the Vagrantfile.
#
development ansible_connection=local
master ansible_connection=local
<% for @node in @worker_nodes %>node<%= @node %> ansible_connection=local
<% end %>
[boxes]
box

[masters]
master

[workers]
<% for @node in @worker_nodes %>node<%= @node %>
<% end %>
[developments]
development
TEXT

open(File.join(vagrantfilePath, 'hosts'), 'w') do |f|
 f.puts ERB.new(template).result
end
```

resulting in a `hosts` file being created in the root of the project upon `vagrant up` being called on the command-line.

The contents of the `hosts` file will resemeble:

```
#
# Do not change this file by hand as it is dynamically generated via the Vagrantfile.
#
development ansible_connection=local
master ansible_connection=local

[boxes]
box

[masters]
master

[workers]

[developments]
development
```

##### 9.5.2.3.7. Mounting the project folder into each vagrant

Each vagrant (e.g., master, worker nodes if provisioned, development) will have the class project fodler mounted at `vagrant`.  If you or on OS X or Linux this will be done via the Network File Service requiring you to enter your password everytime prompted.  If you are on Windows the the mounting will be handled by VirtualBox.  

The code in the Vagrantfile to accomplish this is the following lines:

```ruby
  # nfs does not appear to work reliably on OS X Catalina (See: https://github.com/hashicorp/vagrant/issues/11234)
  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder '.', '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  elsif Vagrant::Util::Platform.platform.include? 'darwin'
    projectPath=File.join('/System/Volumes/Data/Users/', ENV['USER'], vagrantfilePath.split(ENV['USER']).last)

    config.vm.synced_folder projectPath, '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  else
    config.vm.synced_folder '.',  '/vagrant', type: 'nfs'
  end
```

**NOTE**

- If you're host laptop or PC is using a version of Linux that Vagrant is unable configure `nfs` on, then you may have to comment out portions of this section in both `Vagrantfile` and `box/Vagrantfile`, so that the default `type` will be used like so

  ```ruby
  # nfs does not appear to work reliably on OS X Catalina (See: https://github.com/hashicorp/vagrant/issues/11234)
  #  if Vagrant::Util::Platform.windows?
  config.vm.synced_folder '.', '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  #   elsif Vagrant::Util::Platform.platform.include? 'darwin'
  #     projectPath=File.join('/System/Volumes/Data/Users/', ENV['USER'], vagrantfilePath.split(ENV['USER']).last)
  # 
  #     config.vm.synced_folder projectPath, '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  #   else
  #     config.vm.synced_folder '.',  '/vagrant', type: 'nfs'
  #   end
  ``` 

##### 9.5.2.3.8. Build a Vagrant Box

The master, worker nodes (if created) and development vagrant will need a base box. 

The following section of code will call the `build_box.sh` shell script found in the `box` directory to create this box.

```ruby
  if ( ARGV.include? 'up' )
    if (`vagrant box list | grep #{box}`.empty? )
      puts "INFO: Creating #{box} box...".green
      require 'open3'
      Open3.popen2e('bash', '-c', 'cd box && ./build_box.sh') do |stdin, stdout, stderr|
        puts stdout.each { |line| puts line }
      end
    else
      puts "INFO: Using existing #{box} box...".green
    end
  end
```

Vagrant needs a image to start from in much the same reason one builds an Amazon EC2 off an Amazon Machine Image (AMI) or VMWare Image.  Vagrant calls its images _Vagrant boxes_. One can create a Vagrant box via the vagrant command line interface (CLI) or alternatively one can use Hashicorp's Packer cli. The class use existing `centos/7` and `ubuntu/bionic` Vagrant boxes to create a box ontop of which the class vagrants (VMs) are built, but if you selected `nemonik/alpine310` as your `:base_box` in the `ConfigurationVars` and have istalled the `packer` cli packer will be used to create `nemonik/alpine310` base box and then take this box and use it to create a box via Vagrant ontop of which the vagrants will be created.  

##### 9.5.2.3.9. Configuring the Kubernetes cluster vagrant(s)

By default the class is configured as a two node cluster, a single master node and one worker node by having `:nodes` set to `2` in the `ConfigurationVars` module.

The Vagrant file uses the value of `:nodes` and the shell scripting templates defined in the `ConfigurationVars` module to create the cluster starting with a master node and each subsequent node being created as a worker node. 

```ruby
  # shell scripting to install root user cached content
  root_cached_template = ConfigurationVars::DETERMINE_OS_TEMPLATE + ConfigurationVars::OS_PACKAGES_FROM_CACHE_TEMPLATE + ConfigurationVars::SITE_PACKAGES_FROM_CACHE_TEMPLATE

  # shell scripting to install user cached content
  user_cached_template = ConfigurationVars::USER_CACHED_CONTENT_TEMPLATE

  (0..ConfigurationVars::VARS[:nodes]-1).each do |node|

    if (node == 0) then
      hostname = 'master'
      masters_root_cached = root_cached_template.gsub! /TYPE/, 'masters'
      masters_user_cached = user_cached_template.gsub! /TYPE/, 'masters'
    else
      hostname = "node#{node}"
      workers_root_cached = root_cached_template.gsub! /TYPE/, 'workers'
      workers_user_cached = user_cached_template.gsub! /TYPE/, 'workers'
    end

    config.vm.define hostname do |vagrant|
      vagrant.vm.network 'private_network', ip: "#{ ConfigurationVars::VARS[:network_prefix] }.#{10 + node}"
      vagrant.vm.hostname = hostname

      vagrant.vm.provider :virtualbox do |virtualbox|
        virtualbox.name = "Hands-on DevOps class - #{os} - #{hostname}"
        virtualbox.gui = false

        # disable audio
        virtualbox.customize ['modifyvm', :id, '--audio', 'none']

        virtualbox.customize ['modifyvm', :id, '--nic1', 'nat']
        virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
        virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1 ]
        virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]

        if (node == 0) then
          virtualbox.memory = 8192 #8192 #6144 #4096
          virtualbox.cpus = 8 #8 #4
        else
          virtualbox.memory = 2048
          virtualbox.cpus = 2
        end

        if (ConfigurationVars::VARS[:openebs_drives].downcase == 'yes') then # create OpenEBS drives on each node

          openebs_disk = "./#{hostname}_openebs_disk.vdi"

          # Add a second drive for OpenEBS
          unless File.exist?(openebs_disk)
            virtualbox.customize ['createmedium', '--filename', openebs_disk, '--size', ConfigurationVars::VARS[:openebs_drive_size_in_gb] * 1024]
          end

          # the value of storage_system_bus depends on your platform
          storage_system_bus = "IDE"

          # provisions the drive
          virtualbox.customize ['storageattach', :id, '--storagectl', storage_system_bus, '--port', 1, '--device', 0, '--type', 'hdd', '--medium', openebs_disk]
        end
      end

      # Configure via shell and Ansible

      if (node == 0) then # the master node

        # install root user cached content
        vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{masters_root_cached}"

        # install user cached content
        vagrant.vm.provision 'user_cached_content', type: :shell, privileged: false, inline: "#{masters_user_cached}"

        vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
          echo Configuring #{hostname} via Ansible...
          cd /vagrant

          n=0
          until [ "$n" -ge #{ConfigurationVars::VARS[:default_retries]} ]; do
            /home/vagrant/.local/bin/ansible-galaxy install --force --roles-path ansible/roles --role-file requirements.yml && break
            n=$((n+1))
            sleep #{ConfigurationVars::VARS[:default_delay]}
          done

          PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="masters" --inventory-file=hosts ansible/master-playbook.yml
        SHELL
      else # worker nodes
        # install root user cached content
        vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{workers_root_cached}"

        # install user cached content
        vagrant.vm.provision 'user_cached_content', type: :shell, privileged: false, inline: "#{workers_user_cached}"

        vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
          echo Configuring k3s worker node...

          #{install_secure_key}

          cd /vagrant

          n=0
          until [ "$n" -ge #{ConfigurationVars::VARS[:default_retries]} ]; do
            /home/vagrant/.local/bin/ansible-galaxy install --force --roles-path ansible/roles --role-file requirements.yml && break
            n=$((n+1))
            sleep #{ConfigurationVars::VARS[:default_delay]}
          done

          PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="workers" --inventory-file=hosts ansible/worker-playbook.yml
        SHELL
      end
    end
  end
```

The Kubernetes cluster, whether a single node or many nodes will orechestrate the lifecycle of Traefik, GitLab, Drone CI, SonarQube, Taiga... 

**NOTE**

- The course has had the benefit of being authored and run hardware with i7 processors and 16GB of memory, so if you have more or less you can to tweak the `virtualbox.memory` and `virtualbox.cpus` settings above.  Node 0 is the master node.
- By default the `master` vagrant is given 8GB (i.e., `8192`. For me a 1GB is 1024MB, not 1000MB. Is this so hard?  Must we dumb everything down?) of memory and 8 cores. If your host has more memory and cores you can configure this vagrant with more.  
- I've seen this course run on an i5 Dell Laptop, so one can squeak by on 4GB of memory, but I wouldn't advise it.  I also wouldn't drop the `master` vagrant below 4 cores, either.  
- Running additional worker nodes will tax most laptops, so I wouldn't advise it.
- Some services and tools are orchestrated via Docker-compose, such as, the Docker registries and Drone CI.

##### 9.5.2.3.10. Provisioning and configuring the *development* vagrant

The development vagrant  used for development is proisioned and configured with the following code:

```ruby
  if (ConfigurationVars::VARS[:create_development].downcase == 'yes') then # create development vagrant
    config.vm.define 'development' do |vagrant|
    vagrant.vm.network 'private_network', ip: "#{ ConfigurationVars::VARS[:network_prefix] }.9"
    vagrant.vm.hostname = 'development'

    vagrant.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "Hands-on DevOps class - #{os} - #{vagrant.vm.hostname}"
      virtualbox.gui = false

      virtualbox.customize ['modifyvm', :id, '--audio', 'none']
      virtualbox.customize ['modifyvm', :id, '--nic1', 'nat']
      virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
      virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

      virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
      virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
      virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore", 1 ]
      virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start", 1 ]
      virtualbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]

      virtualbox.memory = 2048
      virtualbox.cpus = 2
    end

    developments_root_cached = root_cached_template.gsub! /TYPE/, 'developments'
    developments_user_cached = user_cached_template.gsub! /TYPE/, 'developments'

    # install root user cached content
    vagrant.vm.provision 'root_cached_content', type: :shell, privileged: true, inline: "#{developments_root_cached}"

    # install user cached content
    vagrant.vm.provision 'user_cached_content', type: :shell,  privileged: false, inline: "#{developments_user_cached}"

    vagrant.vm.provision 'ansible', type: :shell, privileged: false, reset: true, inline: <<-SHELL
      echo Configuring development node...

      #{install_secure_key}

      echo Execute ansible-playbook...
      cd /vagrant

        n=0
        until [ "$n" -ge #{ConfigurationVars::VARS[:default_retries]} ]; do
          /home/vagrant/.local/bin/ansible-galaxy install --force --roles-path ansible/roles --role-file requirements.yml && break
          n=$((n+1))
          sleep #{ConfigurationVars::VARS[:default_delay]}
        done

      PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true /home/vagrant/.local/bin/ansible-playbook -vvvv --extra-vars=#{vars_string} --extra-vars='ansible_python_interpreter="/usr/bin/env #{ConfigurationVars::VARS[:ansible_python_version]}"' --vault-password-file=vault_pass --limit="developments" --inventory-file=hosts ansible/development-playbook.yml
    SHELL
  end
```

Let me breakdown what is occuring above:
- `vagrant.vm.network` is used to define the network address of the `development` vagrant based on the `:network_prefix` value configured in `ConfigurationVars` module plus `.9`.  So, if the `:network_prefix` is `192.168.0` the ip address of the `development` vagrant would be `192.168.0.9`
- `vagrant.vm.hostname` sets the hostname of the vagrant to `development`
- `vagrant.vm.provider` section set the virtualbox name, turns off the gui, disables the audio, set nic1 to NAT, sets the memory, number of CPUs, connects the network cable to first interface, and other settings to improve performance
- `vagrant.vm.provision 'root_cached_content'` installs cached content for the root user
- `vagrant.vm.provision 'user_cached_content'` installs cached content for the vagrant user
- `vagrant.vm.provision 'ansible'` installs the default private key for the vagrant user and then executes two ansible playbooks.

`vagrant.vm.provision 'root_cached_content'` and `vagrant.vm.provision 'user_cached_content'` both make use of cache that it created at the root of the project to increase the speed of configuring the vagrants.

### 9.5.3. Ansible

Ansible is a "configuration management" tool that automates software provisioning, configuration management and application deployment, two core repeated practices in DevOps, so for the class Ansible addresses this concern in its configuration of two vagrants.

Ansible was open-sourced and then subsumed by Red Hat.

There are other notable open-source "configuration management" tools, such as Chef and Puppet. Further, still there are others, such as BOSH and Salt, but they hold little or no community of practice or market share.

In his seminal essay, ["The Cathedral and the Bazaar"](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/), Eric S. Raymond states

> while coding remains an essentially solitary activity, the really great hacks
> come from harnessing the attention and brainpower of entire communities

You want to leverage the work of vibrate community and not some back water effort.

#### 9.5.3.1. Playbooks

In Ansible one defines playbooks to manage configurations of and deployments to remote machines. The playbooks I'm using to configure the vagrants exist in `ansible/`.  Each Ansible playbook is written in a YAML-based DSL (domain specific language) enumerating all the roles that will be executed to configure the vagrant.

##### 9.5.3.1.1. The `master` vagrant's playbook

The `master` vagrant leverages `ansible/master-playbook.yml` and it contains:

```yaml
---
# Toolchain Ansible playbook

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

- hosts: masters
  remote_user: vagrant
  roles:
    - common
    - { role: docker-registry,
        when: registry == 'yes' }
    - k3s-server
    - helm
    - { role: metallb,
        when: metallb == 'yes' }
    - { role: traefik,
        when: traefik == 'yes' }
    - { role: kubernetes-dashboard,
        when: kubernetes_dashboard == 'yes' }
    - { role: gitlab,
        when: gitlab == 'yes' }
    - { role: drone,
        when: drone == 'yes' }
    - { role: create-cache,
        when: create_cache == 'yes' }
```

##### 9.5.3.1.2. The `worker` vagrant's playbook

The `worker` vagrant leverages `ansible/worker-playbook.yml` and it contains:

```yaml
---
# Worker Ansible playbook

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

- hosts: [workers]
  remote_user: vagrant
  roles:
    - common
    - k3s-agent
    - create-cache
```

##### 9.5.3.1.3. The `development` playbooks

The `development` vagrant leverages `ansible/development-playbook.yml` and it contains:

```yaml
---
# Development Ansible playbook

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

- hosts: [developments]
  remote_user: vagrant
  roles:
    - common
    - { role: k3s-agent,
        when: nodes == 1 and
              development_is_worker_node == 'yes' }
    - kubectl
    - helm
    - golang
    - golint
    - { role: taiga,
        when: taiga == 'yes' }
    - { role: plantuml-server,
        when: plantuml_server == 'yes' }
    - { role: sonarqube,
        when: sonarqube == 'yes' }
    - { role: golang-container-image,
        when: golang_container_image == 'yes' }
    - { role: golang-sonarqube-scanner-image,
        when: golang_sonarqube_scanner_image == 'yes' }
    - { role: python-container-image,
        when: python_container_image == 'yes' }
    - { role: owasp-zap2docker-stable-image,
        when: owasp_zap2docker_stable_image == 'yes' }
    - { role: standalone-firefox-container-image,
        when: standalone_firefox_container_image == 'yes' }
    - { role: create-cache,
        when: create_cache == 'yes' }
```

#### 9.5.3.2. Roles

The roles exist in `ansible/roles` and permit the sharing of bits of configuration content. Roles can also be found in the [Ansible Galaxy](https://galaxy.ansible.com/), retrieved and placed into the `ansible/roles` folder to be used, but I wrote all the roles for the class.

A role, such as a Taiga role is comprised of many components (e.g., files, templates, tasks) with the core being the main task. For example, the main task for the `taiga` roles contains

```yaml
---
# tasks file for taiga

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

- set_fact:
    images:
      - { repository: "python", tag: "3.6" }
      - { repository: "sameersbn/postgresql", tag: "10-2" }
      - { repository: "nemonik/taiga", tag: "latest" }

- name: copy taiga files to /home/{{ ansible_user_id }}/taiga
  copy:
    src: files/
    dest: /home/{{ ansible_user_id }}/taiga
  tags:
    - taiga

- name: load {{ images }} they exist or pull
  block:
  - name: load {{ images }} from cache
    include_tasks: retrieve_container_image.yml
    loop: "{{ images }}"

  - name: pull {{ images }} container images
    docker_image:
      name: "{{ item.repository }}:{{ item.tag }}"
      source: pull
      timeout: "{{ docker_timeout }}"
    retries: "{{ docker_retries }}"
    delay: "{{ docker_delay }}"
    register: result
    until: result is succeeded
    loop: "{{ images }}"

- name: spin up Taiga via Kubernetes
  block:
  - name: template kubernetes resource files into /home/{{ ansible_user_id }}/taiga
    template:
      src: templates/taiga.yml.j2
      dest: /home/{{ ansible_user_id }}/taiga/taiga.yml
      force: yes

  - name: is taiga running?
    shell: kubectl --kubeconfig=/home/{{ ansible_user_id }}/kubeconfig.yml -n taiga get pod | grep Running | wc -l
    register: running

  - name: spin up via kubectl
    shell: kubectl --kubeconfig=/home/{{ ansible_user_id }}/kubeconfig.yml apply -f taiga.yml
    args:
      chdir: /home/{{ ansible_user_id }}/taiga
    when: running.stdout == "0"
  tags:
    - taiga

- name: save {{ images }} to cache
  include_tasks: cache_container_image.yml
  loop: "{{ images }}"
  tags:
    - taiga
```

The `Taiga` role depends on the Ansible roles used to configure the base box selected by `:base_box` setting in the `ConfigurationVars` module.

#### 9.5.3.3. Bringing all the vagrants up

In a shell (I'll drop from time to time stating "into the shell" as it should understood.) at the root of the class project enter: 

```bash
vagrant up 
```

You will see a good deal of output and on the Windows OS, it will pester you to approve certain things.  As a trust exercise blindly approve everything.

**NOTE**

- If while bringing up vagrants based on `ubuntu/bionic64` you may get an immediate error about not being able to reach https://cloud-images.ubuntu.com/ signaling Ubuntu has updated the currently configured base image and in doing so has revoked (i.e., deprecated) the currently configured one. To resolve edit `configuration_vars.rb` and set `base_box_version` to the currently released version denoted [here](https://app.vagrantup.com/ubuntu/boxes/bionic64) and try running `vagrant up` again. Also, do not cut-and-paste the `v` as part of the version.
- If you're host laptop or PC is using a version of Linux that Vagrant is unable configure `nfs` on, then you may have to comment portions of the section configuring the sync_folder in both `Vagrantfile` and `box/Vagrantfile`, so that the default `type` will be used like so

  ```ruby
  # nfs does not appear to work reliably on OS X Catalina (See: https://github.com/hashicorp/vagrant/issues/11234)
  #  if Vagrant::Util::Platform.windows?
  config.vm.synced_folder '.', '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  #   elsif Vagrant::Util::Platform.platform.include? 'darwin'
  #     projectPath=File.join('/System/Volumes/Data/Users/', ENV['USER'], vagrantfilePath.split(ENV['USER']).last)
  # 
  #     config.vm.synced_folder projectPath, '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=775,fmode=664']
  #   else
  #     config.vm.synced_folder '.',  '/vagrant', type: 'nfs'
  #   end
  ``` 
  
- It is very possible a network anomaly may result in Ansible failing, if you can determine the role the automation failed in, you can speed things along by commenting out the roles that proceeded and re-run the automation by entering into the command-line at the root of the project
  ```bash
  vagrant provision
  ```
- To halt the vagrants once provisioned and configured perform the following in the command-line
  ```bash
  vagrant halt
  ```
- To restart the vagrants once provisioned and configured perform the following in the command-line
  ```bash
  vagrant up --no-provision
  ```
  Give the vagrants time to restart all the long-running tools.
- You will not want to run a VPN session that does not permit bridging such as MITRE's VPN on your computer when running your vagrants as you will have no network access to your vagrants.  
- Caution, it is easy to forget DevOps is not about tools and automaton, but is as much about culture, methods and repeated practices, so keep this in mind.  
- The tools, methods and repeated practices exist to support the culture.
- Again, I'll drop from time to time stating "into the shell" or "into the command-line" when instructing you to enter things in the CLI.
- If you're on Linux, such as, Arch you will need to enable the nfs-server.service. See [NFS#Start the server](https://wiki.archlinux.org/index.php/NFS#Starting_the_server), but essentially enter `sudo systemctl start nfs-server` into the command-line.
- If on Arch and you get an error about unuspported protocol, like so
  ```bash
  ==> default: Mounting NFS shared folders...
  The following SSH command responded with a non-zero exit status.
  Vagrant assumes that this means the command failed!
  
  mount -o vers=3,udp 192.168.0.1:/home/mjwalsh/Development/workspace/hands-on-DevOps /vagrant
  
  Stdout from the command:
  
  Stderr from the command:
  
  mount.nfs: requested NFS version or transport protocol is not supported
  ```
  you will need to enable NFS over UDP. See [NFS/Troubleshooting#UDP mounts not working](https://wiki.archlinux.org/index.php/NFS/Troubleshooting#UDP_mounts_not_working).

The toolchain IaC will spin up a number of tools.  Following sections unpack what theses tools are, but first I'd like to unpack the cloud-native technologies underrunning the long-running tools.

## 9.6. The cloud-native technologies underlying the tools

The tools leverage technologies that underline cloud-native development, where applications are packaged in containers and dynamically orchestrated to optimize resource utilization.

### 9.6.1. Docker image and containers

The DevOps tools are all containerized via Docker.

*So, what is Docker?*

Docker is a platform to develop, deploy, and run Linux containers.

*What are Containers?*

- Containers are a form of lightweight virtualization first existing in 1979’s Version 7 UNIX operating system when the chroot command was developed.
- Since chroot, containers have continued to evolve within the Linux kernel to decouple applications from the operating system and run them in an isolated manner.
- A container is essentially an isolated process running in user space.
- The benefit over Virtual Machines in that multiple containers can run on the same machine (in case of this class, a vagrant) sharing the OS kernel with other containers. Whereas a VM would require a full copy of an operating system to run the application. This makes containers insanely light-weight.
- Container support has thrived and seen popular adoption across various operating systems outside of Linux including Windows Containers and Window’s direct ability to run Linux containers from the Hyper-V isolation work done by Microsoft.
- The Open Container Initiative (OCI), formed in 2015 maintains open industry standards for containers that focus on Runtime Specification (runtime-spec) and its partner project, the Image Specification (image-spec).

*What are container images?*

A container image is a lightweight, self-contained, executable package that includes everything needed to run your application including runtime, system tools, system libraries, and settings.

More can be read on the topic at

<https://www.docker.com/what-container>

You will build a couple of Docker images and spin up containers in this class.

### 9.6.2. Docker-compose

The class uses docker-compose to spin up Drone CI and the Docker registries (Both private and passthrough.) leaving the rest of the applications to be orchestrated by Kubernetes.  (Kubernetes is explained in the following section.)

*What is docker-compose?*

Docker-compose is a tool and domain-specific language based on YAML used to define and run multi-container Docker applications.

*As an aside, what is YAML?*

YAML bills itself as a human-friendly data serialization standard for all programming languages. YAML also follows in the computing tradition of being a recursive acronym, _YAML Ain't Markup Language._ Many of the tools used in this course make use of YAML, so you will see plenty of examples of it.

### 9.6.3. Kubernetes

Kubernetes; specifically, K3s is used in the default configuration of the course to orchestrate the life cycles of the bulk of long-running tools.  

*What is Kubernetes?*

Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications. Essentially, it serves as an operating system for a cluster of computing resources and manages the life cycle and discovery of the applications running upon it. In the case of this course, the computing resources I'm speaking of are your vagrants. When Vagrant executes the ansible-playbook `ansible/master-playbook.yml` on the `master` vagrant it uses the `k3s-server` role to configure the vagrant as a Kubernetes master node. On the development vagrant, the `ansible/worker-playbook.yml` playbook uses the `k3s-agent` role to configure the vagrant as a Kubernetes worker node.  The class by default is not configured to provision and configure any worker nodes as doing so would tax any powerful laptop.

#### 9.6.3.1. K3s, light-weight Kubernetes

K3S is a light-weight, CNCF certified Kubernetes distribution designed for resource-constrained environments, where one doesn't need the added steps and dependencies a full Kubernetes cluster would require.  K3s fits our need perfectly.

It's canonical source can be found at

<https://github.com/rancher/k3s/>

It's landing page can be found here

<https://k3s.io/>

The official documentation can be found here

<https://rancher.com/docs/k3s/latest/en/>

#### 9.6.3.2. Kubectl, the Kubernetes command-line tool

Kubernetes is managed in the command-line via `kubectl`.

Once, both the `master` and `development` vagrants are provisioned and configured, you can ssh into the `master` vagrant via typing

```bash
vagrant ssh master
```

or 

```bash
./vagrant_sh.sh master
```

and then enter:

```bash
kubectl get nodes
```

Kubernetes will tell you the nodes that comprise the cluster.  The output will look similar to

```
NAME     STATUS   ROLES    AGE   VERSION
master   Ready    master   45s   v1.18.6+k3s1
```

There is a convenience bash script at the root of the project `./watch_nodes.sh` that will secure shell into the master and run the same command periodically until you force kill the script.

If you enter

```bash
kubectl --all-namespaces=true get pods
```

it will return all the pods, where a pod is container or group of containers that are deployed together.  

In our case the the command will return something resembling:

```
NAMESPACE              NAME                                         READY   STATUS    RESTARTS   AGE   IP             NODE     NOMINATED NODE   READINESS GATES
kube-system            local-path-provisioner-6d59f47c7-fhrgl       1/1     Running   0          13h   10.42.0.2      master   <none>           <none>
metallb-system         speaker-7lfx4                                1/1     Running   0          13h   192.168.0.10   master   <none>           <none>
metallb-system         controller-674ffcfcb5-gbxww                  1/1     Running   0          13h   10.42.0.4      master   <none>           <none>
kube-system            metrics-server-7566d596c8-44wr8              1/1     Running   0          13h   10.42.0.5      master   <none>           <none>
kube-system            traefik-db6bd8cf5-68rx7                      1/1     Running   0          13h   10.42.0.6      master   <none>           <none>
kubernetes-dashboard   dashboard-metrics-scraper-694557449d-9wqdh   1/1     Running   0          13h   10.42.0.7      master   <none>           <none>
kubernetes-dashboard   kubernetes-dashboard-7585d9796f-65lfg        1/1     Running   0          13h   10.42.0.8      master   <none>           <none>
kube-system            coredns-8655855d6-gjbt5                      1/1     Running   0          13h   10.42.0.3      master   <none>           <none>
gitlab                 postgresql-54f4644855-22hl8                  1/1     Running   0          12h   10.42.0.13     master   <none>           <none>
gitlab                 redis-6fdb7c89dc-85bqr                       1/1     Running   0          12h   10.42.0.14     master   <none>           <none>
gitlab                 gitlab-d849c68dc-v8krx                       1/1     Running   0          12h   10.42.0.12     master   <none>           <none>
metallb-system         speaker-6qdvn                                1/1     Running   0          12h   192.168.0.11   node1    <none>           <none>
taiga                  postgresql-7df8d6c5d9-lkppf                  1/1     Running   0          12h   10.42.1.3      node1    <none>           <none>
plantuml-server        plantuml-server-666d7b789b-v9rkg             1/1     Running   0          12h   10.42.1.4      node1    <none>           <none>
sonarqube              postgresql-6f8d997d76-g6gzh                  1/1     Running   0          11h   10.42.0.18     master   <none>           <none>
taiga                  taiga-966b6b7ff-rvskh                        1/1     Running   0          12h   10.42.0.17     master   <none>           <none>
sonarqube              sonarqube-8577859c74-6d6s2                   1/1     Running   0          11h   10.42.0.19     master   <none>           <none>
```

There is another convenience bash script at the root of the project `./watch_pods.sh` that will secure shell into the master and run essentially the same command periodically until you force kill the script.  I usually leave this running in another shell to monitor the cluster as the long running apps are deployed by Kubernetes.

The logs for an application can be tailed (i.e., continuously read) by for example executing

```bash
kubectl logs plantuml-server-54df8b596d-7dz8s -n plantuml-server -f
```

The last few lines of output will resemble

```
2019-10-21 15:48:59.556:INFO:oeja.AnnotationConfiguration:main: Scanning elapsed time=458ms
2019-10-21 15:48:59.941:INFO:oejs.session:main: DefaultSessionIdManager workerName=node0
2019-10-21 15:48:59.941:INFO:oejs.session:main: No SessionScavenger set, using defaults
2019-10-21 15:48:59.943:INFO:oejs.session:main: node0 Scavenging every 660000ms
2019-10-21 15:49:00.018:INFO:oejsh.ContextHandler:main: Started o.e.j.w.WebAppContext@5e5792a0{plantuml,/,[file:///tmp/jetty-0.0.0.0-8080-ROOT.war-_-any-7602101517969586601.dir/webapp/, jar:file:///tmp/jetty-0.0.0.0-8080-ROOT.war-_-any-7602101517969586601.dir/webapp/WEB-INF/lib/codemirror-3.21.jar!/META-INF/resources],AVAILABLE}{/ROOT.war}
2019-10-21 15:49:00.070:INFO:oejs.AbstractConnector:main: Started ServerConnector@2145b572{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
2019-10-21 15:49:00.070:INFO:oejs.Server:main: Started @2044ms
```

#### 9.6.3.3. Kubernetes-Dashboard

The course automation will also deploy the Kubernetes-Dashboard.  For the long-running tools orchestrated via Kubernetes, you can view much the same data in the Kubernetes-Dashboard.

<https://192.168.0.10:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/>

To login to the dashboard, open a terminal and in the root of the project execute 

```
./get_kubeconfig_yml.sh
```

The output will resemble 

```
➜  hands-on-DevOps git:(master) ✗ ./get_kubeconfig_yml.sh
Connection to 127.0.0.1 closed.
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJWekNCL3FBREFnRUNBZ0VBTUFvR0NDcUdTTTQ5QkFNQ01DTXhJVEFmQmdOVkJBTU1HR3N6Y3kxelpYSjIKWlhJdFkyRkFNVFUzTWpJM05qazJNakFlRncweE9URXdNamd4TlRNMk1ESmFGdzB5T1RFd01qVXhOVE0yTURKYQpNQ014SVRBZkJnTlZCQU1NR0dzemN5MXpaWEoyWlhJdFkyRkFNVFUzTWpJM05qazJNakJaTUJNR0J5cUdTTTQ5CkFnRUdDQ3FHU000OUF3RUhBMElBQkJBcHpOV1dGQ29lcnBmaU5oaGtMWlpZdnBKTWNTZHVDWkZJdExxK0NLRjAKWDBPeExaaGhlMTcrUmgxUG1YRnZ3WGR4alJoaVJ6WUtudGlUcjI0OGszbWpJekFoTUE0R0ExVWREd0VCL3dRRQpBd0lDcERBUEJnTlZIUk1CQWY4RUJUQURBUUgvTUFvR0NDcUdTTTQ5QkFNQ0EwZ0FNRVVDSVFDTituNHE5c3YvCkFIRWVPZmZOWlFYRHpNZ3N4aEdKWjZwM3h0MDhrekdsNlFJZ2RmRkZRZ3U3R2wvZ0RwUUlUajJqbWZHKzZqZloKM2ZiMlg2UTcxRWFWUHJvPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    server: https://192.168.0.10:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
preferences: {}
users:
- name: default
  user:
    password: b4691b364594460a83088fdc3aed4144
    username: admin
```

The username and password you will need to enter will be on the last two lines.  In this case the username is `admin` and the password is `b4691b364594460a83088fdc3aed4144`.

You'll be asked to enter the user and password several times.

If your username and password are accepted, a modal will then pop up.  Select `token` in the modal and then back in the terminal execute

```
➜  hands-on-DevOps git:(master) ✗ ./get_k3s_token.sh
```

The output will resemble:

```
Connection to 127.0.0.1 closed.
eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJ2YWdyYW50LXRva2VuLW01Zms5Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6InZhZ3JhbnQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI0MTE4OWU0Zi1kNWRiLTQ3YTgtYjkxYi0yMzlhMGU2MWZlYjciLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06dmFncmFudCJ9.vVeT6CD0dc7b7TFhqjOjprGBNbx7qOKSuobUzpbjAgkQa3vZllivZCmbRIyFEnNYqRzamkLhD3Rz9mZvnmAN6wRx2-3SqMwc_KjY0GdP0QSWrd6wpzvW4b6EEOxWa0Of-DgET6IWw50Yjvi0kBeRuJdtBXMHD4kMu--ew_tGeJA28FgUAMbrpW8DqgqUWwNNADP_9mlvrUK8-TWSCxIe-VsqU7ifKLlp7WR61EicAwYrMs0fiw-41Q5KBskdqsJ6LxgsgHcwmNmInKgunu1pZfyxH_gfaiPq4cfwU7gtR6uMUAMNkwzfdPvYqFPv0zN8XzZ_j99kM0omlVS7AWH8iA
```

The token starts on the line below `Connection to 127.0.0.1 closed.` and in this case the token starts with `eyJhbGc...`  Cut-and-paste the contents of the token into the field provided in the modal, submit and you'll be granted access to the dashboard.

## 9.7. The long-running tools

The class makes use of two types of tools: those that are long-running (e.g., GitLab, Drone, SonarQube) and those used to perform short-lived individual tasks (e.g., Makefile, InSpec, OWASP-ZAP.)  

This section will describe the long-running tools leaving subsequent sections to describe the latter as you use the short-lived tools.

### 9.7.1. Taiga, an example of Agile project management software

Taiga is an Open Source project management platform for agile development.

There are many project management platforms for Agile software development.

Typically, Agile teams work using a visual task management tool such as a project board, task board or Kanban or Scrum visual management board. These boards can be implemented using a whiteboard or open space on a wall or in software. The board is at a minimum segmented into a few columns _To do_, _In process_, and _Done_, but the board can be tailored. I've personally seen boards for very large projects consume every bit of wall space of a very large cavernous room, but as Lean-Agile has matured, teams have grown larger and more disparate, tools have emerged to provide a clear view into a project's management to all levels of concern (e.g., developers, managers, product owner, and the customer) answering:

- Are deadlines being achieved?
- Are team members overloaded?
- How much is complete?
- What's next?

Further, the Lean-Agile Software tools should provide the following capabilities:

- Dividing integration and development effort into multiple projects.
- Defining, allocating, and viewing resources and their workload across each product.
- Defining, maintaining, and prioritizing the accumulation of an individual product's requirements, features or technical tasks which, at a given moment, are known to be necessary and sufficient to complete a project's release.
- Facilitating the selection and assignment of individual requirements to resources, and the tracking of progress for a release.
- Permit collaboration with external third parties.

The 800 pound Gorilla in this market segment is JIRA Software. Some of my co-workers hate it. It is part of the Atlassian suite providing provides collaboration software for teams with products including JIRA Software, Confluence, Bitbucket, and Stash.  Back when Atlassian (Stocker ticker: TEAM) was trading at 50-dollars it was a good investment.

**NOTE**

- Lean-Agile Project Management software's primary purpose is to integrate people and really not much else.

#### 9.7.1.1. Documentation, source, container image

Taiga's documentation can be found at 

<https://taigaio.github.io/taiga-doc/dist/>

It's canonical source can be found at

<https://github.com/taigaio/taiga-front-dist/>

dedicated to the front-end, and

<https://github.com/taigaio/taiga-back/>

dedicated to the back-end.

Taiga doesn't directly offer a Docker container image for, but I've authored a container image that collapses both taiga-front-dist and -back behind an NGINX reverse proxy onto single container.

The GitHub hosted project for my container can befound at 

<https://github.com/nemonik/taiga>

The project contains a [pipeline](https://github.com/nemonik/taiga/blob/master/.github/workflows/main.yml) that executes daily to build and publish a new container image named [nemonik/taiga](https://hub.docker.com/r/nemonik/taiga) hosted in Docker Hub.

#### 9.7.1.2. URL, Username and password

Once, stood up the Kubernetes cluster your instance of Taiga will reachable at

<http://192.168.0.204>

The default admin accont username and password are

**admin**  
**123123**

### 9.7.2. GitLab CE, an example of configuration management software

GitLab is installed on the Kubernetes cluster, where it will be accessible at <http://192.168.0.202>.

GitLab Community Edition (CE) is an open source end-to-end software development platform with built-in version control, issue tracking, code review, and CICD.

For Agile teams to collaborate, a Configuration management (CM) is necessary to coordinate the development of new feature, changes, and experimentation. Also, a CM system (CMS) provides a history of changes, and thereby, the ability to roll back to a version known to be acceptable.

At a minimum, the following items will be placed under revision control in CM:

- Source code,
- If a database is needed, schema initialization and the migration between versions,
- Text documentation containing

  - a synopsis (i.e., project name, overview, etc.),
  - version description,
  - guidance covering

    - build,
    - unit testing, and
    - installation

  - a contributor enumeration,

  - license and/or ownership declaration with contacts, etc.,

A single CMS and the associated workflow (e.g., GitHub Workflow) can serve as the focal point for the entire enterprise thereby provide centralized version control if all documentation is authored in a lightweight markup language with plain text formatting syntax (e.g., Markdown, PlantUML).

A CMS must facilitate best practices, not limited to:

- A means for developers to copy and work off a complete repository thereby permitting

  - Private individual work to later be synchronized via exchanging sets of changes (i.e., patches) through a means described as "distributed version control", and
  - Pre-flight build and test of their source code in their own private workspace, so as to minimize the chance of committing broken or untested source code thereby encouraging
  - The committing of completed source code only.

- Granular commits that communicate the motivation for the commit (i.e., the what and why). For example, for a change these could be:

  - the inclusion of a new feature,
  - a bug fix,
  - the removal of dead code

- Reducing the risk breaking a build by

  - Utilizing branching to separate different lines of development, and
  - Standardizing on CMS workflows (e.g., GitHub Workflow),

- Make builds be self-testing (i.e., ingrain testing) by including unit and integration test with the source code so that it can be executed by

  - the build automation, and
  - the Continuous Integration service.

- Trigger follow-on activities orchestrated by the Continuous Integration Service.

#### 9.7.2.1. Documentation, source, container image

GitLab's documentation can be found at

<https://docs.gitlab.com/ce/>

It's canonical source can be found at

<https://gitlab.com/gitlab-org/gitlab-ce>

I'm using Sameer Naik's Docker container image for GitLab. The image can be found at

<https://hub.docker.com/r/sameersbn/gitlab/>

Whose canonical source is located at

<https://github.com/sameersbn/docker-gitlab>

#### 9.7.2.2. URL, Username and password

Once, stood up your instance of GitLab will reachable at

<http://192.168.0.202>

You will be using the GitLab's **root** account to host your repositories versus creating your own, but if you want you can. There is nothing stopping you.

For the purposes of the class the **root** account's password has been set to the uber-secure "**password**".

#### 9.7.2.3. Notes in regards to the class GitLab

GitLab will take sometime to start.  You may see the following in the Ansible verbose output

```
    development: FAILED - RETRYING: wait for GitLab to come up (60 retries left).Result was: {
    development:     "attempts": 1,
    development:     "changed": false,
    development:     "content": "",
    development:     "elapsed": 3,
    development:     "invocation": {
    development:         "module_args": {
    development:             "attributes": null,
    development:             "backup": null,
    development:             "body": null,
    development:             "body_format": "raw",
    development:             "client_cert": null,
    development:             "client_key": null,
    development:             "content": null,
    development:             "creates": null,
    development:             "delimiter": null,
    development:             "dest": null,
    development:             "directory_mode": null,
    development:             "follow": false,
    development:             "follow_redirects": "safe",
    development:             "force": false,
    development:             "force_basic_auth": false,
    development:             "group": null,
    development:             "headers": {},
    development:             "http_agent": "ansible-httpget",
    development:             "method": "GET",
    development:             "mode": null,
    development:             "owner": null,
    development:             "regexp": null,
    development:             "remote_src": null,
    development:             "removes": null,
    development:             "return_content": false,
    development:             "selevel": null,
    development:             "serole": null,
    development:             "setype": null,
    development:             "seuser": null,
    development:             "src": null,
    development:             "status_code": [
    development:                 200
    development:             ],
    development:             "timeout": 30,
    development:             "unix_socket": null,
    development:             "unsafe_writes": null,
    development:             "url": "http://192.168.0.202:80/favicon.ico",
    development:             "url_password": null,
    development:             "url_username": null,
    development:             "use_proxy": true,
    development:             "validate_certs": true
    development:         }
    development:     },
    development:     "msg": "Status code was -1 and not [200]: Request failed: <urlopen error [Errno 113] Host is unreachable>",
    development:     "redirected": false,
    development:     "retries": 61,
    development:     "status": -1,
    development:     "url": "http://192.168.0.202:80/favicon.ico"
    development: }
```

This is perfectly normal.  The course's Ansible code will poll GitLab waiting for it to spin up.  This is only a problem if the polling hits its limit.  If this does happen then the deployment of the long running tools will stop.  Usually, GitLab is up by try 30.

### 9.7.3. Drone CI, an example of CICD orchestrator

Drone CI often referred to simply as "Drone" is installed on the `master` vagrant, where it will be accessible at <http://192.168.0.10/> after some user configuration that will be explained later in the _Integrate Drone CI with GitLab_ section.

Drone is essentially a Continuous Delivery system built on container technology.

Drone is distributed as a set of Docker images. Drone CI can be run with an internal SQLite database, but it is advisable to run with an external database and this is the configuration the class uses. It also integrates with multiple version control providers (i.e., GitHub, GitLab, BitBucket, Stash, and Gogs). Both CMS and database are configured using environment variables passed along when the Drone CI container is first to run.  The `.drone.yml` is authored in a domain specific language (DSL) that is a superset of the docker-compose DSL. The file is used to describe the build with multiple named steps with each step executed in a separate Docker container having shared disk access to the checked out branch of the source repository.  Steps make use of Drone plugins to deploy code, publish artifacts, send a notification, etc.  Drone's approach is novel as plugins are really just Docker containers distributed in the typical manner.  Each plugin is designed to perform pre-defined tasks and is configured as steps in your pipeline. The containers are executed with read/write/execute access at the root of the source branch therefore permitting the pipeline to interact with that specific, checked out branch of the source. 

Drone and its brethren (e.g., Jenkins CI, GitLab Runners) are used to facilitate Continuous Integration (CI), a software development practice where members of an Agile team frequently integrate their work in order to detect integration issues as soon as possible. Each integration is orchestrated through a service that essentially assembles a build and runs tests every time a predetermined trigger has been met and then reports with immediate feedback.

I don't use Jenkins unless I have to. Why? I'm simply not a fan. Initially, because its plugin architecture is painful to manage and with prior versions your pipelines existed entirely in the Jenkins CI tool itself. Later, Jenkins CI introduced Groovy-based Jenkin Pipelines that are CMed (i.e., placed under configuration management) with your project's source. And while every orchestrator has based their DSL on YAML and although I love the Groovy language for its power, I don't think it makes for a good orchestration language. Your opinion may differ. I'm okay with that. Really. I am.

There are also SaaS CICD tools, such as Travis CI and Circle CI. These are great, free CICD orchestrators.

My [java-stix](https://github.com/STIXProject/java-stix) project hosted on GitHub.com uses both Travis CI and Circle CI as part of its continuous integration.

The [Travis CI orchestration](https://github.com/STIXProject/java-stix/blob/master/.travis.yml) contains

```yaml
language: java
dist: precise
jdk:
  - oraclejdk7

before_install:
  - chmod +x gradlew

env: GRADLE_OPTS=-Dorg.gradle.daemon=true
env: CI_OPTS=--stacktrace

install: /bin/true
script: "./gradlew -x signArchives"
```

Whereas, the [Circle CI orchestration](https://github.com/STIXProject/java-stix/blob/master/circle.yml) contains

```yaml
machine:
  java:
    version: oraclejdk7
  environment:
    GRADLE_OPTS: -Dorg.gradle.daemon=true
    CI_OPTS: --stacktrace --debug

test:
  override:
    - ./gradlew -x signArchives
```

They are essentially similar with both requiring the Oracle JDK and use Gradle to build and unit test the code. Both of these services under the covers use containers to run the builds.

In another GitHub hosted project, the [java-stix-validator](https://github.com/STIXProject/java-stix-validator) the [Travis CI orchestration](https://github.com/STIXProject/java-stix-validator/blob/master/.travis.yml) contains

```yaml
language: java
jdk:
- oraclejdk8
before_install:
- chmod +x gradlew
env: CI_OPTS=--stacktrace
install: "/bin/true"
script: "./gradlew build -d"
deploy:
  provider: heroku
  api_key:
    secure: m9Gbt0Oyqtjwyu4Y8CVobNNnj1q5mFt+Ygi2wiDWlf/RunLOj2CE8YAYuRyEAbpCOd1lrmrhmQb8uQAfiydauYBcQE5yyOlyIhNkrLi2m1+we0VeWWr6gxIVz57VuAhfbzoMtvkhmxl/Ey0U+1vI7tYurK0thzFUyQFqZh1wNq6EldIfHxVNxDZbEVtkDzFtK5cmVnPE8HM9xaQmuV7k3NhrvRS4pzN87uvndfFVb0vDhLmg5DulF+PLkdpP9UC5jsAE1HXMBL0cTtsvSHUkIyO7qhLb0RFAzVdRMvn7kEW2Q0ekoK09sPR13VwmfjewzHSNrWIf+rjJx7EzoBzbq5/VmC9nxH1oiGpXxoAG08pJjcQYMSxsa2JZLH8dSIEaMgOFNOxkrAhcqP59xXWZ9WVLCYPSN4atmg4L6etJOzFqfz3jAp40AB4Eu2QU49c60r6BH31Xj8ymjKMKqnlL199qCoqfZtv7FYqOFG3keLeWvL/F7JhmtV+JdvuqVPEvNq2D1b3kdCKk2cw4lmRCwC9hdT2oXTCwhjQvYwSm0sHQ98aeV55FkE7DuH4B+CuzYw4N9K78j3eQtW2Oas1lLCoHSDXgA/4O79RlM8p0nLa3MjdVq5OSIjbcCqhDLBe8nc5ucSpMMjnjNvhAKvcyrc5AbXdIVaLVvE2azMuZJLo=
  app: agile-journey-9583
  on:
    repo: STIXProject/java-stix-validator
```

To deploy the web application to [Heroku](https://www.heroku.com/), one of the first PaaS (Platforms-as-Service). The code was last committed in 2015 and the code is still running free on Heroku at <http://agile-journey-9583.herokuapp.com/#/>

More details on Drone is sprinkled across the class. As you can see I favor being a polyglot when it comes to software development to include CICD.

#### 9.7.3.1. Documentation, source, container image

Drone's main site is at

<https://drone.io/>

Its documentation is at

<http://docs.drone.io/>

Its plugin market is at

<http://plugins.drone.io/>

Drone's canonical source can be found at

<https://github.com/drone/drone>

Drone is distributed as a container image and can be found respectfully at

<https://hub.docker.com/r/drone/drone/>

and

<https://hub.docker.com/r/drone/agent/>

#### 9.7.3.2. URL, Username and password

Once, stood up your instance of Drone CI will reachable at

<http://192.168.0.10/>

Drone will authenticate you off of GitLab.

### 9.7.4. SonarQube, an example of a platform for the inspection of code quality

SonarQube provides the capability to show the health of an application's source code, highlighting issues as they are introduced. SonarQube can be extended by language-specific extensions/plugins to report on duplicated code, coding standards, unit tests, code coverage, code complexity, comments, bugs, and security vulnerabilities.

#### 9.7.4.1. Documentation, source, container image

SonarQube's main site is at

<https://www.sonarqube.org/>

Its documentation is at

<https://docs.sonarqube.org/display/SONAR/Documentation>

SonarQube's canonical source can be found here

<https://github.com/SonarSource/sonarqube>

I'm using the container image provided at

<https://hub.docker.com/_/sonarqube/>

#### 9.7.4.2. URL, Username and password

Once, stood up your instance of SonarQube will reachable at

<http://192.168.0.205:9000/>

The default admin account username and password is

**admin**

### 9.7.5. PlantUML Server, an example of light-weight documentation

The second value in the Agile Manifesto is

> Working software over comprehensive documentation

The documentation for this class, this `readme.md` file, is authored in Markdown, a light-weight markup language.  The course's diagrams included inline in the readme are authored to assist the reader are authored in PlantUML, a domain-specific language used to author well-formed and human-readable code to render UML diagrams.

For me, I don't need to see the diagrams rendered to follow them. The code alone is sufficient.  

PlantUML supports a number of UML diagrams: Sequence, Use Case, Class diagram, Activity diagram, Component, State, Object, Deployment, and Timing. The DSL also supports a number of other non-UML diagrams: Wireframe graphical interface, Specification and Description Language (SDL), Ditaa diagram... 

This class makes use of just two types: State and Deployment diagrams.  

The PlantUML effort also provides server for rendering diagrams in PNG, SVG or LaTeX formats. Plugins for Microsoft Code, Atom, and other editors have been authored to assist in auhoring in the PlantUML DSL.

#### 9.7.5.1. Documentation, source, container image

PlantUML's main site and documentation is at

<https://www.plantuml.org/>

PlantUML's canonical source can be found here

<https://github.com/plantuml>

I'm using the container image provided at

<https://hub.docker.com/r/plantuml/plantuml-server/>

#### 9.7.5.2. URL

Once, stood up your instance of PlantUML server will reachable at

<http://192.168.0.203>

#### 9.7.5.3. Optionally, add the *hands-on-DevOps* repository to GitLab

I'd encourage you to perform the following as GitLab will make use of the PlantUML server the class automation spins up to render the embedded UML diagrams in the class `readme.md`. The diagrams are especially helpful to visual learners.

To read this document with rendered PlantUML diagrams perform the following:

1. In GitLab (<http://192.168.0.202>) click on `Projects` in the upper left.
   a. Select `Create Project`.  
   b. Or click <http://192.168.0.202/projects/new>  
2. Leave the `Project path` defaulted to `http://192.168.0.202/root/`.
3. Enter `hands-on-DevOps` (the form field the page defaults to) for the `Project name`.
4. Provide an optional `Project description`. Something descriptive, such as, _"An awesome DevOps class"_.
5. Make the application `public` to save yourself from entering your username and password when cloning.
6. Click the green `Create Project` button on the lower left.

The UI will refresh to show you a landing page for the project that should be accessible from <http://192.168.0.202/root/hands-on-DevOps>

On your host in the DevOps class project:

1. Enter into the following into the command line 
   ```bash
   git config --global user.name "Administrator"
   git config --global user.email "admin@example.com"
   ```
2. Then enter the following 
   ```bash
   git remote add toolchain http://192.168.0.202/root/hands-on-DevOps.git
   git push -u toolchain --all
   git push -u toolchain --tags
   ```

**NOTE**

- Since we have not registered an SSH key with GitLab, during the push we will be prompted to enter a `Username` and `Password`.
- Your `Username` is `root` and your `Password` is `password`. 
- The git command-line client will not display your password as you enter it. 

You now have a clone of the project hosted in the GitLab running on the Kubernetes cluster.  This way you can open the readme.md and follow along with rendered PlanUML diagrams.

## 9.8. Golang _helloworld_ project

The Kubernetes cluster and `development` vagrants are required to be up and running for the following sections.

In this next part, we will create a simple helloworld GoLang project to demonstrate Continuous Integration. GoLang lends itself well to DevOps and underlines almost every new tool you can think of related to DevOps and cloud (e.g., [golang / go](https://github.com/golang/go), [docker / docker-ce](https://github.com/docker/docker-ce), [kubernetes / kubernetes](https://github.com/kubernetes/kubernetes), [openshift / origin ](https://github.com/openshift/origin), [hashicorp / terraform](https://github.com/hashicorp/terraform), [coreos / etcd](https://github.com/coreos/etcd), [hashicorp / vault](https://github.com/hashicorp/vault), [hashicorp / packer](https://github.com/hashicorp/packer), [hashicorp / consul](https://github.com/hashicorp/consul), [gogits / gogs](https://github.com/gogits/gogs), [drone / drone](https://github.com/drone/drone).)

### 9.8.1. Create the project's backlog

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog” #FFFFFF
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

A backlog is essentially your (or your team's) to-do list, a prioritized list of work derived from the road map (e.g., the outline for future product functionality and when new features will be released) and its requirements.

Open Taiga in your web browser

<http://192.168.0.204>

The default admin account username and password are

**admin**   
**123123**  

Complete the follow to track your progress in completing the Golang *helloworld* project
1. Click `Create Project`.
2. Select `Kanban`.  In a Kanban board work moves from left to right with each column represents a stage within the value stream.
3. Give your project a name.  For example, `Helloworld` and a description, such as, `My Kanban board for this awesome helloworld app` and then click `CREATE PROJECT`.
4. You can skip this step and opt to chose to click `><` to fold `READY`, `USER STORY STATUS` and `ARCHIVED` only after completing step 6.  Otherwise, you can edit your Kanban board to just `NEW`, `IN PROGRESS`, and `DONE` by

   a. On the bottom left, click the `ADMIN` gear.  
   b. Click `ATTRIBUTES`.  
   c. Scroll down to `USER STORY STATUS`.  
   d. Hover over `Ready`, click the trash icon to delete and click `ACCEPT`.  
   c. Do the same for `Ready for test` and `Archived`.  
   d. Click the `KANBAN` icon on the far left. It Looks like columns.

5. In the `NEW` column select `Add New bulk` icon that looks like a list and when the page updates cut-and-paste the lines below into the text box and click `SAVE`. 

    ```
    Create the project’s backlog
    Create the project in GitLab
    Setup your project on the development Vagrant
    Author the application
    Align source code with Go coding standards
    Lint the code
    Build the application
    Run your application
    Author the unit tests
    Write the Makefile
    Author Drone-based Continuous Integration
    ```

Track your progress in Taiga as you work through each section.

### 9.8.2. Create the project in GitLab

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab” #FFFFFF
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

1. In GitLab (<http://192.168.0.202>) click on `Projects` in the upper left.
   a. Select `Create Project`.  
   b. Or click <http://192.168.0.202/projects/new>  
2. Leave the `Project path` defaulted to `http://192.168.0.202/root/`.
3. Enter `helloworld` (the form field the page defaults to) for the `Project name`.
4. Provide an optional `Project description`. Something descriptive, such as, _"GoLang helloworld application for the hands-on DevOps class."_.
5. Make the application `public` to save yourself from entering your username and password when cloning.
6. Click the green `Create Project` button on the lower left.

The UI will refresh to show you a landing page for the project that should be accessible from <http://192.168.0.202/root/helloworld>

### 9.8.3. Setup the project on the _development_ Vagrant

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant” #FFFFFF
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

On your host open a shell to the `development` vagrant, and configure your user name and email:

```bash
git config --global user.name "Administrator"
git config --global user.email "admin@example.com"
```

The Ansible `golang` role (`ansible/roles/golang`) in the class project on your host will already have configured:

1. Your `$GOPATH` and `$GOBIN` environmental variable.
2. Added `$GOBIN` to your PATH environmental variable.
3. Created `go` workspace in vagrant user's home directory (i.e., `/home/vagrant/go` directory containing `bin`, `pkg`, and `src`.)

Go source code is placed in the `src` directory under a namespace (i.e., a unique base path to avoid naming collisions under which all your go code will reside.) In open source software development, it is typical to use github.com account path. Mine is `github.com/nemonik`, so I would create this base path via (You do the same., so we are all on the same page.)

```bash
mkdir -p $GOPATH/src/github.com/nemonik
```

Now lets create the GoLang `helloworld` project to demonstrate Continuous Integration via

```bash
cd $GOPATH/src/github.com/nemonik
git clone http://192.168.0.202/root/helloworld.git
cd helloworld
```

**NOTE**

- Ignore the `warning: You appear to have cloned an empty repository.` warning.  This is perfectly normal.  Then move into the clone of your repository via

So, that you do not version control certain files in git, create a `.gitignore` file with your editor with the following contents

```
# OS-specific
.DS_Store

# reports
.scannerwork
*.out
*.json

# binary
helloworld
```

**NOTE**

- Make sure you pre-pend that dot (`.`) at the start of `.gitignore`. In *NIX Dot-files are hidden files. 
- `.gitignore` will not show up if you simply list the file system via the `ls` command, but if you use `ls -a` or `ls --all` it will.  Either arguments configures `ls` to not ignore entries starting with `.`.

### 9.8.4. Author the application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application” #FFFFFF
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

In the project folder (i.e., `/home/vagrant/go/src/github.com/nemonik/helloworld`), create `main.go` in `emacs`, `nano`, `vi` or `vim` with this content:

```go
package main

import "fmt"

func main() {
  fmt.Println(HelloWorld())
}

func HelloWorld() string {
  return "hello world"
}
```

### 9.8.5. Align source code with Go coding standards

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards” #FFFFFF
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

Format source code according to Go coding standards using

```bash
go fmt
```

`go fmt` will output 

```
main.go
```

Meaning it corrected the formatting of `main.go` to

You can see the difference if you `cat` your source like so

```bash
cat main.go
```

The command will return

```go
package main

import "fmt"

func main() {
    fmt.Println(HelloWorld())
}

func HelloWorld() string {
    return "hello world"
}
```

### 9.8.6. Lint your code

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code” #FFFFFF
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

Already installed on your `development` vagrant is `golint`. Where `go fmt` reformatted the code to GoLang standards, `golint` prints style mistakes.

To run `golint`, in the root of the `helloworld` project execute

```bash
golint
```

Command line out will be

```bash
[vagrant@development helloworld]$ golint
main.go:9:1: exported function HelloWorld should have comment or be unexported
```

Fix the error by editing `main.go` to

```go
package main

import "fmt"

func main() {
	fmt.Println(HelloWorld())
}

// HelloWorld returns "hello world"
func HelloWorld() string {
	return "hello world"
}
```

Run `golint` again and it should return no output indicating it sees nothing wrong.

### 9.8.7. Build the application

Build the project by executing

```bash
go build -o helloworld .
```

Success returns no command line output.  What?  Did you want a cookie?  No cookie for you.  This is GoLang's way of doing things.  Silence is golden and means things went fine. Otherwise, go back and fix the mistakes in your code.

### 9.8.8. Run your application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application” #FFFFFF
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

Now run your application

```bash
./helloworld
```

The command line output will be

```bash
[vagrant@development hello]$ ./helloworld
hello world
```

### 9.8.9. Author the unit tests

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests” #FFFFFF
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

GoLang ships with a built-in `testing` package 

<https://golang.org/pkg/testing/> 

for automated unit testing of Go packages.  Unit testing is a software development process where the smallest testable components of an application are individually tested for proper operation. Unit testing offers the biggest return for dollars spent in comparison to integration and functional testing.

For more on this topic read Martin Fowler's

<https://martinfowler.com/bliki/TestPyramid.html>

but in short unit testing in comparison to integration and functional testing provides the greatest bang for buck followed by integration and functional testing (i.e., unit testing is the cheapest most valuable from of testing.)  Functional testing, where the system is tested against the functional requirements, is by far the most expensive, most brittle, and arguably less valuable in comparison.

In your editor create `main_test.go` with this content:

```go
package main

import (
  "os"
  "testing"
)

func TestMain(m *testing.M) {
  os.Exit(m.Run())
}

func TestHelloWorld(t *testing.T) {
  if HelloWorld() != "hello world" {
    t.Errorf("got %s expected %s", HelloWorld(), "hello world")
  }
}
```

The test is 16 lines as per

```bash
[vagrant@development helloworld]$ cat main_test.go | wc -l
      16
```

where we pipe the contents of `main_test.go` through the `wc` command-line utility used to display the number of lines, words, and/or bytes in standard input

The `helloworld` application itself is just 12 lines of code as per

```bash
[vagrant@development helloworld]$ cat main.go | wc -l
      12
```

Yes, line count is an overly simple metric to weigh, but line count should serve to inform you of the obvious -- there's a cost in authoring unit tests.  This cost is perhaps the number one reason why authoring unit tests will be skipped.  Well, that and having the necessary engineering prowess to author them.  The same could be said in regards to automation authored in this course. Please, keep this in mind as you work your way through the course material.

Let's execute the unit test by entering

```bash
go test -v -cover
```

The command line returns

```
=== RUN   TestHelloWorld
--- PASS: TestHelloWorld (0.00s)
PASS
coverage: 50.0% of statements
ok  	github.com/nemonik/helloworld	0.002s
```

This step and all the proceeding follows of a DevOps tenant where "Developers are expected to pre-flight new code."

### 9.8.10. Automated the build (i.e., write the Makefile)

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile” #FFFFFF
-left->“Author Drone-based\nContinuous Integration”
-left-> (*)
```

 Build automation is a key practice of CI.  So, let's make the build reproducible by automating everything we've done this far via authoring a Makefile.

In the root of the project create `Makefile` and add the following contents

```makefile
GOCMD=go
GOFMT=$(GOCMD) fmt
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOLINT=$(GOCMD)lint
GOGET=$(GOCMD) get
BINARY_NAME=helloworld

all: build
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
fmt:
	$(GOFMT)
lint: fmt
	$(GOGET) golang.org/x/lint/golint
	golint
test: lint
	$(GOTEST) -v -cover ./...
build: test
	$(GOBUILD) -o $(BINARY_NAME) -v
run:
	./$(BINARY_NAME)
```

**NOTE**

- Each line indentation is a `tab` and **not** a series of `space` characters.  `Make` will fail to execute if these tabs are converted to a series of space characters.

Save the file and exit your editor.

Okay, let's try out our build automation in the `development` terminal

```bash
make all
```

The output will resemble

```bash
go fmt
main_test.go
go get golang.org/x/lint/golint
golint
go test -v -cover ./...
=== RUN   TestHelloWorld
--- PASS: TestHelloWorld (0.00s)
PASS
coverage: 50.0% of statements
ok  	github.com/nemonik/helloworld	0.003s	coverage: 50.0% of statements
go build -o helloworld -v
```

### 9.8.11. Author Drone-based Continuous Integration

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->“Create\nthe project’s\nbacklog”
-right->“Create\nthe project\nin GitLab”
-right->“Setup\nyour project on\nthe development\nVagrant”
-right->“Author\nthe application”
-right->“Align source\ncode with Go\ncoding standards”
-right->“Lint\nthe code”
-right->“Build\nthe application”
-down->“Run\nyour application”
-left->“Author\nthe unit tests”
-left->“Write the Makefile”
-left->“Author Drone-based\nContinuous Integration” #FFFFFF
-left-> (*)
```

CI integrates all of the steps we have worked to ensure a high quality build into a pipeline, so let's do that.

We're going to author a continuous integration pipeline for our application and execute it on Drone. Drone expects a `.drone.yml` to exist at the root of the project and will execute the pipeline it contains when the project is committed to GitLab. 

A pipeline is broken up into multiple named steps, where each step executes in an ephemeral (i.e., does its job and then poof it is gone) Docker container with shared disk access to the project's workspace. The benefit of this approach is that it relieves you from having to create and maintain slaves to execute your pipelines.

Drone automatically clones your project's repo (Short for "repository.") into a volume (referred to as the workspace) shared by each Docker container (including plugin and service containers).

In your editor create `.drone.yml` file at the root of the `helloworld` project:

```yaml
kind: pipeline
name: default

steps:
- name: build
  image: 192.168.0.10:5000/nemonik/golang:1.13.7
  commands:
  - make build

- name: run
  image: 192.168.0.10:5000/nemonik/golang:1.13.7
  commands:
  - make run
```

**NOTE**

- Make sure you pre-pend that dot (`.`) at the start of `.drone.yml`.
- Like the `.gitignore` file, `.drone.yml` is a hidden file and will not show up if you list the directory contents with `ls` alone.  You will need to enter `ls -las`.
- If I didn't update the documentation correctly, it is possible the tag for the `nemonik/golang` container image maybe off.  To verify this tag  enter the following into the shell
  
  ```
  curl --no-progress-meter http://192.168.0.10:5000/v2/nemonik/golang/tags/list
  ```

  who will return something like

  ```
  {"name":"nemonik/golang","tags":["1.13.7"]}
  ```

  If the tag doesn't match what the private docker registry holds go ahead and correct the .drone.yml file.  My bust.

The pipeline is authored in YAML like almost all the CI orchestrators out there except for Jenkin's Pipelines, which you author in Groovy-based DSL.

- `steps:` - defines the list of steps followed to build, test and deploy your code.
- `build` and `run` - defines the names of the step. These are yours to name. Name steps something meaningful as to what the step is orchestrating. Each step is executed serially, in the order defined.
- `image: 192.168.0.10:5000/nemonik/golang:1.13.7` - defines the container image to execute the step.  The nemonik/golang container tagged `1.13.7` will be retrieved from private Docker registry located at `192.168.0.10:5000`. Drone uses Docker images for the build environment, plugins and service containers. Drone spins them up for the execution of the pipeline and when no longer needed they go poof.
- `commands` - defines a collection of terminal commands to be executed. These are all the same commands we executed previously in the command line. If anyone of these commands were to fail returning a non-zero exit code, the pipeline will immediately end resulting in a failed build.

#### 9.8.11.1. Configure Drone to execute your pipeline

1. Open <http://192.168.0.10/> in your browser and authenticate through GitLab on into Drone, if you need to.
2. Drone will then try to sync with GitLab, so wait for a bit while the syncing arrows chase each other for a bit.
3. Then click `root/helloworld` repo and `ACTIVATE REPOSITORY`, then `SAVE` under the `Main` section to enable Drone orchestration for the project.
4. Then click the Drone logo in the upper left of the page to return home.

You won't have any builds to start, but when you do the builds will increment starting from 1. 

The build colors mean something:

- `Red`- indicates a failed build. 
- `Yellow-orange` - is the presently executing build. 
- `Green` - is a build that passed. 

When a build does start, click on its row to open and monitor it. The UI will update as the build proceeds informing you as to its progress.

#### 9.8.11.2. Trigger the build

To trigger the build, in your ssh connection to the `development` vagrant simply commit your code:

```bash
git add .
git commit -m "Added Drone pipeline"
git push origin master
```

**NOTE**

- Since we have not registered an SSH key with GitLab, during the push we will be prompted to enter a `Username` and `Password`.
- Your `Username` is `root` and your `Password` is `password`  (Shhhh.  Our little secret.). 
- The git command-line client will not display your password as you enter it. 

Immediately after you enter your GitLab username/password open <http://192.168.0.202/root/helloworld> in your browser, if you re-use an existing tab to this page refresh the page.

The execution of this pipeline will follow as so:

1. A new build will appear. Click on it.
2. Drone will clone your project's repository in a `clone` step.
3. And then will execute a `build` and `run` steps in order each spinning up `nemonik/golang:1.13.7` container, whose container image was patched if proxy environmental variable are set to work behind MITRE's http proxy and SSL introspection. (Later, you may want examine the contents of ansible/roles/golang-container-image/files/Dockerfile for more details as to how this was accomplished.)
4. These steps execute the commands in the same way you executed them yourself: a. make lint b. make test c. make build d. make run

The output of the `build` (An arbitrary name. You could use "skippy".) step will resemble:

```bash
+ make build
go fmt
go get golang.org/x/lint/golint
golint
go test -v -cover ./...
=== RUN   TestHelloWorld
--- PASS: TestHelloWorld (0.00s)
PASS
coverage: 50.0% of statements
ok  	_/drone/src	0.003s	coverage: 50.0% of statements
go build -o helloworld -v
_/drone/src
```

The output of the `run` step will resemble:

```bash
+ make run
./helloworld
hello world
```

Our build was successful.  Drone uses a container's exit code to determine success or failure. A container's non-zero exit code will cause the pipeline to exit immediately.

That's it.  This is essentially CI. Remember, CI stands for "Continuous Integration".  Scintillating isn't it?

### 9.8.12. The completed source for *helloworld*

The `helloworld` project can be viewed completed at

https://github.com/nemonik/helloworld

## 9.9. Golang *helloworld-web* project

Like `helloworld`, the `helloworld-web` project is a very simple application that we will use to explore Continuous Deliver.  Remember, Continuous Delivery builds upon Continuous Integration.  You've accomplished Continuous Integration. Wahoo.

### 9.9.1. Create the project's backlog

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog” #FFFFFF
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Open Taiga in your web browser

<http://192.168.0.204>

Complete the follow to track your progress in completing the _helloworld-web_ project

1. Click `Manage Projects`, then `Create Project`.
2. Select `Kanban`.  A Kanban board shows how work moves from left to right, each column represents a stage within the value stream.
3. Give your project a name.  For example, `Helloworld-web` and a description, such as, `My Kanban board for this awesome helloworld-web app` and then click `CREATE PROJECT`.
5. You can skip this step and opt to chose to click `><` to fold `READY`, `USER STORY STATUS` and `ARCHIVED` only after completing step 6.  Otherwise, you can edit your Kanban board to just `NEW`, `IN PROGRESS`, and `DONE` by
   a. On the bottom left, click the `ADMIN` gear.
   b. Click `ATTRIBUTES`.
   c. Scroll down to `USER STORY STATUS`.
   d. Hover over `Ready`, click the trash icon to delete and click `ACCEPT`.
   c. Do the same for `Ready for test` and `Archived`.
   d. Click the `KANBAN` icon on the far left. It Looks like columns.  And then reload the browser to get the changes to take
6. In the `NEW` column select `Add New bulk` icon that looks like a list and when the page updates cut-and-paste the lines below into the text box and click `SAVE`. 

    ```
    Create the project's backlog
    Create the project in GitLab
    Setup the project in the development Vagrant
    Author the application
    Build and run the application
    Run gometalinter.v2 on application
    Fix the application
    Author unit tests
    Perform static analysis on the CLI
    Write the Makefile
    Dockerize the application
    Run the Docker container
    Push the container image to the private registry
    Configure Drone to execute the CICD pipeline
    Add Static Analysis (SonarQube) step to pipeline
    Add build step to pipeline
    Add container image publish step to pipeline
    Add container deploy step to pipeline
    Add compliance automation test (InSpec) step to pipeline
    Add automated functional test (Selenium) to pipeline
    Add DAST step (OWASP ZAP) to the pipeline
    ```

Track your progress in Taiga as you work through each section.

### 9.9.2. Create the project in GitLab

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab" #FFFFFF
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

1. In GitLab (<http://192.168.0.202>) click on the GitLab logo in the upper left.
   a. Click the green `New Project` on the far upper-right or
   c. Click <http://192.168.0.202/projects/new>
2. Leave the `Project path` defaulted to `http://192.168.0.202/root/`.
3. Enter `helloworld-web` for the `Project name`.  **Be careful with the spelling.**
4. Provide an optional `Project description`. Something descriptive, such as, _"GoLang helloworld application for the hands-on DevOps class."_.
5. Save yourself a headache, and make the application `public`.
6. Click the green `Create Project` button on the lower left.

The UI will refresh to show you landing page for the project that should be accessible from

<http://192.168.0.202/root/helloworld-web>

### 9.9.3. Setup the project on the _development_ Vagrant

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant" #FFFFFF
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

You'll now clone the new `helloworld-web` GitLab hosted repo as you did prior for the `helloworld` project.

If you don't already have a shell open on `development` vagrant, on your host in a shell at the root of the class project enter the following

```bash
vagrant ssh development
```

Once connected to your `development` vagrant enter

```bash
cd ~/go/src/github.com/nemonik
git clone http://192.168.0.202/root/helloworld-web.git
cd helloworld-web
```

**NOTE**

- Again, ignore the "warning: You appear to have cloned an empty repository." warning, cause of course you did.
- The `git clone` will fail if you did not name your project correctly while in GitLab.

So, that you do not version control certain files in git, create a `.gitignore` file with your editor with this content

```
# OS-specific
.DS_Store

# reports
.scannerwork
coverage.out
golint-report.out
gometalinter-report.out
report.json
inspec_helloworld.json

# binary
helloworld-web
```

### 9.9.4. Author the application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application" #FFFFFF
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Create `main.go` in `emacs`, `nano`, `vi` or `vim` with this content:

```Go
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", handler)
	fmt.Print("listening on :3000\n")
	http.ListenAndServe(":3000", logRequest(http.DefaultServeMux))
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world!\n")
}

func logRequest(handler http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Printf("%s  %s  %s\n", r.RemoteAddr, r.Method, r.URL)
		handler.ServeHTTP(w, r)
	})
}
````

Format and lint the code like you did previously.

```bash
go fmt
golint
```

### 9.9.5. Build and run the application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application" #FFFFFF
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Build the application

```bash
go build -o helloworld-web .
```

No output means things are peachy. Otherwise fix your mistakes.

Now run

```bash
./helloworld-web
```

Command line output will be

```bash
[vagrant@development helloworld-web]$ ./helloworld-web
listening on :3000
```

To run the application, either

- Open <http://192.168.0.9:3000> in a web browser, or
- Enter ```curl --no-progress-meter http://192.168.0.9:3000``` into the command-line of another terminal.

Both will return:

```
Hello world!
```

`./helloworld-web` will output in the terminal window

```
192.168.0.1:63201  GET  /
192.168.0.1:63201  GET  /favicon.ico
```

Your browser is looking for a `favicon.ico`, but we don't serve that up of course.

`crl-c` will stop your application.

### 9.9.6. Run gometalinter.v2 on application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application" #FFFFFF
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Install the `gometalinter.v2` in the `development` vagrant

```bash
go get -u gopkg.in/alecthomas/gometalinter.v2
```

This command will take some time and generate no output.

Then enter

```bash
gometalinter.v2 --install
```

Output will resemble

```
Installing:
  deadcode
  dupl
  errcheck
  gochecknoglobals
  gochecknoinits
  goconst
  gocyclo
  goimports
  golint
  gosec
  gosimple
  gotype
  gotypex
  ineffassign
  interfacer
  lll
  maligned
  megacheck
  misspell
  nakedret
  safesql
  staticcheck
  structcheck
  unconvert
  unparam
  unused
  varcheck
```

Now, let us run our linters.

```bash
gometalinter.v2 
```

`gometalinter.v2` will then runs all these linters:

* `go vet` - Reports potential errors that otherwise compile.
* `go tool vet --shadow` - Reports variables that may have been unintentionally shadowed.
* `gotype` - Syntactic and semantic analysis similar to the Go compiler.
* `gotype -x` - Syntactic and semantic analysis in external test packages (similar to the Go compiler).
* `deadcode` - Finds unused code.
* `gocyclo` - Computes the cyclomatic complexity of functions.
* `golint` - Google's (mostly stylistic) linter.
* `varcheck` - Find unused global variables and constants.
* `structcheck` - Find unused struct fields.
* `maligned` - Detect structs that would take less memory if their fields were sorted.
* `errcheck` - Check that error return values are used.
* `megacheck` - Run staticcheck, gosimple and unused, sharing work.
* `dupl` - Reports potentially duplicated code.
* `ineffassign` - Detect when assignments to existing variables are not used.
* `interfacer` - Suggest narrower interfaces that can be used.
* `unconvert` - Detect redundant type conversions.
* `goconst` - Finds repeated strings that could be replaced by a constant.
* `gosec` - Inspects source code for security problems by scanning the Go AST.

And after some time, it will output something like the following

```
main.go:11::warning: Errors unhandled.,LOW,HIGH (gosec)
main.go:11:21:warning: error return value not checked (http.ListenAndServe(":3000", logRequest(http.DefaultServeMux))) (errcheck)
main.go:15:13:warning: error return value not checked (fmt.Fprintf(w, "Hello world!\n")) (errcheck)
```

Oops. Line 11 and line 15 have problems:

- `http.ListenAndServe(":3000", logRequest(http.DefaultServeMux))` on line 11 returns an `err` if it runs into problems.  We need to handle the problem by logging the `err` and exit.

- `fmt.Fprintf` on line 17 returns the number of bytes written and any write error encountered. We need to handle that too. We can swallow the number of bytes return via `_`, collect the `err`, log it, and exit.

### 9.9.7. Fix the application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application" #FFFFFF
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Let's fix the problems by opening `main.go` in our editor, make the following changes to address the concerns and save

```go
package main

import (
	"log"
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", handler)
	fmt.Print("listening on :3000\n")
	log.Fatal(http.ListenAndServe(":3000", logRequest(http.DefaultServeMux)))
}

func handler(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "Hello world!\n")
	if err != nil {
       		log.Fatal(err)
	}
}

func logRequest(handler http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Printf("%s  %s  %s\n", r.RemoteAddr, r.Method, r.URL)
		handler.ServeHTTP(w, r)
	})
}
```

Correct our formatting

```
go fmt
```

And then run our linters again

```bash
gometalinter.v2 
```

And after some time, nothing is returned.  Problem solved.  If they could all be this easy.

### 9.9.8. Author unit tests

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests" #FFFFFF
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Like most software written for the government, we don't have any unit tests, so let's fix that.

Create the text file `main_test.go` in `emacs`, `nano`, `vi` or `vim` with this content:

```Go
package main

import (
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
)

func TestLogRequest(t *testing.T) {

	mux := http.NewServeMux()
	mux.Handle("/", http.HandlerFunc(handler))

	l := logRequest(mux)

	// Create an http request
	req, _ := http.NewRequest("GET", "/", nil)

	// Create  http.ResponseWriter for test inspection
	recorder := httptest.NewRecorder()

	// Capture Stdout
	rescueStdout := os.Stdout
	r, w, _ := os.Pipe()
	os.Stdout = w

	l.ServeHTTP(recorder, req)

	// Stop capturing Stdout
	w.Close()
	out, _ := ioutil.ReadAll(r)
	os.Stdout = rescueStdout

	// Compare

	if string(out) != "  GET  /\n" {
		t.Errorf("logRequest didn't log the expected \"GET  /\"")
	}
}

func TestHandler(t *testing.T) {
	// Create an http request
	req, _ := http.NewRequest("GET", "/", nil)

	// Create  http.ResponseWriter for test inspection
	recorder := httptest.NewRecorder()

	// Call the handler
	handler(recorder, req)

	// Inspect the http.ResponseWriter
	if recorder.Code != http.StatusOK {
		t.Errorf("Server did not return %v", http.StatusOK)
	}

	if recorder.Body.String() != "Hello world!\n" {
		t.Errorf("Body contain \"%v\" instead of expected \"Hello world!\"", recorder.Body.String())
	}
}

func TestMain(m *testing.M) {
	os.Exit(m.Run())
}
```

Wow.  That's a lot more code than the application itself, huh.  Maybe this is the reason so few unit tests are written.

Execute the unit test by entering

```bash
go test -v -cover
```

The command line will return something like

```
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.006s
```

Notice, we only scored 55.6% coverage, but we appear to have a unit test for all our methods?  This where discernment comes in.  Do you battle for a 100%, 80%, some other number snatched from the air or call this a win.  Up to you or really your team.

### 9.9.9. Perform static analysis (i.e., sonar-scanner) on the command line
```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI" #FFFFFF
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

SonarQube provides a static analysis capability to show the health of an application's source code, highlighting issues as they are introduced. 

#### 9.9.9.1. Optionally, register your app in SonarQube

This section is optional as the `sonar-scanner`command line tool will do all this "auto-magically" for you, so you can skip ahead to the next section.

Open in your browser

<http://192.168.0.205:9000/admin/projects_management>

If you have to authenticate, your username and password is

**admin**  

Click `Create project`.  

Provide the `name` of  

**helloworld-web**  

Provide the `key` of  

**helloworld-web**  

#### 9.9.9.2. Install the SonarGo plugin

The SonarGo plugin was an optional install now it comes installed by default, but lets update it if need be.

1. Open you browser to <http://192.168.0.205:9000/admin/marketplace>
2. If you need to login as `admin` with the password `admin` by selecting `more options` after clicking the `Login` button.
3. Submit `SonarGo` in the search box with `Search by features, tags, or categories...` in it and **not** the one in the upper right side of the page.
3. In the result, look for the button starting with `Update to`, click it and the plugin will be updated.
4. The button will be replaced with "Update Pending" and info message will be rendered at the top of the page. Click `Restart Server` in this info message.
5. A modal with appear asking, "Are you sure you want to restart the server?" Yes, your sure.  Click `Restart` in the modal.

After some time the server will update the plugin.

#### 9.9.9.3. Perform static analysis (run *sonar-scanner*) on the command line

Before you run sonar-scanner you have to commit your code so Sonar knows who to blame, so first head back to your `development` shell and enter

```bash
git add main.go main_test.go
git commit -m "added application code and unit test"
```

and then generate the reports and submit to SonarQube

```bash
gometalinter.v2 > gometalinter-report.out
golint > golint-report.out
go test -v ./... -coverprofile=coverage.out
go test -v ./... -json > report.json
sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
```

After some time, the output will look like

```
development:~/go/src/github.com/nemonik/helloworld-web$ gometalinter.v2 > gometalinter-report.out
development:~/go/src/github.com/nemonik/helloworld-web$ golint > golint-report.out
development:~/go/src/github.com/nemonik/helloworld-web$ go test -v ./... -coverprofile=coverage.out
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.004s	coverage: 55.6% of statements
development:~/go/src/github.com/nemonik/helloworld-web$ go test -v ./... -json > report.json
development:~/go/src/github.com/nemonik/helloworld-web$ sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
INFO: Scanner configuration file: /usr/local/sonar-scanner/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarQube Scanner 4.3.0.2102
INFO: Java 1.8.0_242 IcedTea (64-bit)
INFO: Linux 4.19.98-0-virt amd64
INFO: User cache: /home/vagrant/.sonar/cache
INFO: SonarQube server 7.9.1
INFO: Default locale: "en_US", source code encoding: "UTF-8" (analysis is platform dependent)
WARN: SonarScanner will require Java 11+ to run starting in SonarQube 8.x
INFO: Load global settings
INFO: Load global settings (done) | time=115ms
INFO: Server id: 138C7C5C-AXA10KgUwFu7OPeQythr
INFO: User cache: /home/vagrant/.sonar/cache
INFO: Load/download plugins
INFO: Load plugins index
INFO: Load plugins index (done) | time=75ms
INFO: Load/download plugins (done) | time=1970ms
INFO: Process project properties
INFO: Execute project builders
INFO: Execute project builders (done) | time=11ms
INFO: Project key: helloworld-web
INFO: Base dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web
INFO: Working dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web/.scannerwork
INFO: Load project settings for component key: 'helloworld-web'
INFO: Load quality profiles
INFO: Load quality profiles (done) | time=94ms
INFO: Load active rules
INFO: Load active rules (done) | time=1312ms
INFO: Indexing files...
INFO: Project configuration:
INFO:   Excluded sources: **/*test.go
INFO: 1 file indexed
INFO: 0 files ignored because of inclusion/exclusion patterns
INFO: 0 files ignored because of scm ignore settings
INFO: Quality profile for go: Sonar way
INFO: ------------- Run sensors on module helloworld-web
INFO: Load metrics repository
INFO: Load metrics repository (done) | time=54ms
INFO: Sensor JaCoCo XML Report Importer [jacoco]
INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=13ms
INFO: Sensor SonarGo [go]
INFO: 1 source files to be analyzed
INFO: Load project repositories
INFO: Load project repositories (done) | time=12ms
INFO: Sensor SonarGo [go] (done) | time=269ms
INFO: 1/1 source files have been analyzed
INFO: Sensor Go Unit Test Report [go]
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestLogRequest
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestHandler
INFO: Sensor Go Unit Test Report [go] (done) | time=18ms
INFO: Sensor Go Cover sensor for Go coverage [go]
INFO: Load coverage report from '/home/vagrant/go/src/github.com/nemonik/helloworld-web/coverage.out'
INFO: Sensor Go Cover sensor for Go coverage [go] (done) | time=18ms
INFO: Sensor Import of Golint issues [go]
INFO: GoLintReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/golint-report.out
INFO: Sensor Import of Golint issues [go] (done) | time=2ms
INFO: Sensor Import of GoMetaLinter issues [go]
INFO: GoMetaLinterReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/gometalinter-report.out
INFO: Sensor Import of GoMetaLinter issues [go] (done) | time=1ms
INFO: Sensor JavaXmlSensor [java]
INFO: Sensor JavaXmlSensor [java] (done) | time=1ms
INFO: Sensor HTML [web]
INFO: Sensor HTML [web] (done) | time=14ms
INFO: ------------- Run sensors on project
INFO: Sensor Zero Coverage Sensor
INFO: Sensor Zero Coverage Sensor (done) | time=0ms
INFO: SCM provider for this project is: git
INFO: 1 files to be analyzed
INFO: 1/1 files analyzed
INFO: Calculating CPD for 1 file
INFO: CPD calculation finished
INFO: Analysis report generated in 93ms, dir size=73 KB
INFO: Analysis report compressed in 5ms, zip size=11 KB
INFO: Analysis report uploaded in 346ms
INFO: ANALYSIS SUCCESSFUL, you can browse http://192.168.0.205:9000/dashboard?id=helloworld-web
INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
INFO: More about the report processing at http://192.168.0.205:9000/api/ce/task?id=AXA2A70RxXdPaj5QXDra
INFO: Analysis total time: 5.018 s
INFO: ------------------------------------------------------------------------
INFO: EXECUTION SUCCESS
INFO: ------------------------------------------------------------------------
INFO: Total time: 8.684s
INFO: Final Memory: 23M/191M
INFO: ------------------------------------------------------------------------
```

**NOTE**

- If you see an error concerned about blame files not being found you didn't first commit your code.  Go back commit your code.  You don't need to `push` it.  Just commit it.  Commit it!!!!
- Also, notice I didn't say `push` your code.  Your code hasn't been pushed to GitLab, but has only been committed to your local copy of your repository.
- If you see this outputted

  ```
  ERROR: Error during SonarQube Scanner execution
  ERROR: No quality profiles have been found, you probably don't have any language plugin installed.
  ```

  you didn't enable the SonarGo plugin in SonarQube.

Let me unpack what the above commands are doing

`gometalinter.v2 > gometalinter-report.out` executes all the above linters and consolidates their results into a single `gometalinter-report.out` report.   As you may have noticed, Go is a very quiet language.  So, when `gometalinter.v2` runs and everything passes the output of report will contain nothing if there are no problems.  If you want to be assured it called the linters it claims to call, you run `gometalinter.v2` if debug like so `gometalinter.v2 --debug`.

`go test -coverprofile=coverage.out` executes your unit tests and generate the `coverage.out` report.

`go test -json > report.json` executes your unit tests and generate a unit tests execution report, `report.json`

`sonar-scanner` is configured via the `-D` parameters to submit the reports. If you skipped the prior section, SonarQube will automatically create the project for you.

Open in your host's web browser

<http://192.168.0.205:9000/dashboard?id=helloworld-web>

to view your SonarQube report.

### 9.9.10. Automated the build (i.e., write the Makefile)

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile" #FFFFFF
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

In your editor create a `Makefile` to ensure the build and the steps leading to are repeatable.

```makefile
GOCMD=go
GOFMT=$(GOCMD) fmt
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOLINT=$(GOCMD)lint
GOGET=$(GOCMD) get
BINARY_NAME=helloworld-web

SONAR_DEPENDENCIES := \
	gopkg.in/alecthomas/gometalinter.v2

all: sonar build
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
fmt:
	$(GOFMT)
lint: fmt
	$(GOGET) golang.org/x/lint/golint
	golint
test: lint
	$(GOTEST) -v -cover ./...
sonar: test
	$(GOGET) -u $(SONAR_DEPENDENCIES)
	-gometalinter.v2 --install
	-gometalinter.v2 > gometalinter-report.out
	-$(GOLINT) > golint-report.out
	-$(GOTEST) -v ./... -coverprofile=coverage.out
	-$(GOTEST) -v ./... -json > report.json
	-sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
build:
	$(GOBUILD) -o $(BINARY_NAME) -v
run:
	./$(BINARY_NAME)
```

**NOTE**

- The indents are `tab` characters and not `spaces` characters otherwise your `make` will fail to execute.  
- And cut-and-paste may split the single line beginning with `sonar-scanner` into multiple lines.  You want this to be single line of text.

Test out your `Makefile`

```bash
make all
```

And so, you have build and test automation whose output resembles

```bash
go fmt
main.go
main_test.go
go get golang.org/x/lint/golint
golint
go test -v -cover ./...
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.005s	coverage: 55.6% of statements
go get -u gopkg.in/alecthomas/gometalinter.v2
gometalinter.v2 --install
Installing:
  deadcode
  dupl
  errcheck
  gochecknoglobals
  gochecknoinits
  goconst
  gocyclo
  goimports
  golint
  gosec
  gosimple
  gotype
  gotypex
  ineffassign
  interfacer
  lll
  maligned
  megacheck
  misspell
  nakedret
  safesql
  staticcheck
  structcheck
  unconvert
  unparam
  unused
  varcheck
gometalinter.v2 > gometalinter-report.out
golint > golint-report.out
go test -v ./... -coverprofile=coverage.out
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.004s	coverage: 55.6% of statements
go test -v ./... -json > report.json
sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
INFO: Scanner configuration file: /usr/local/sonar-scanner/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarQube Scanner 4.3.0.2102
INFO: Java 1.8.0_242 IcedTea (64-bit)
INFO: Linux 4.19.98-0-virt amd64
INFO: User cache: /home/vagrant/.sonar/cache
INFO: SonarQube server 7.9.1
INFO: Default locale: "en_US", source code encoding: "UTF-8" (analysis is platform dependent)
WARN: SonarScanner will require Java 11+ to run starting in SonarQube 8.x
INFO: Load global settings
INFO: Load global settings (done) | time=78ms
INFO: Server id: 138C7C5C-AXA10KgUwFu7OPeQythr
INFO: User cache: /home/vagrant/.sonar/cache
INFO: Load/download plugins
INFO: Load plugins index
INFO: Load plugins index (done) | time=58ms
INFO: Load/download plugins (done) | time=96ms
INFO: Process project properties
INFO: Execute project builders
INFO: Execute project builders (done) | time=7ms
INFO: Project key: helloworld-web
INFO: Base dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web
INFO: Working dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web/.scannerwork
INFO: Load project settings for component key: 'helloworld-web'
INFO: Load project settings for component key: 'helloworld-web' (done) | time=79ms
INFO: Load quality profiles
INFO: Load quality profiles (done) | time=62ms
INFO: Load active rules
INFO: Load active rules (done) | time=831ms
INFO: Indexing files...
INFO: Project configuration:
INFO:   Excluded sources: **/*test.go
INFO: 2 files indexed
INFO: 0 files ignored because of inclusion/exclusion patterns
INFO: 0 files ignored because of scm ignore settings
INFO: Quality profile for go: Sonar way
INFO: ------------- Run sensors on module helloworld-web
INFO: Load metrics repository
INFO: Load metrics repository (done) | time=25ms
INFO: Sensor JaCoCo XML Report Importer [jacoco]
INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=10ms
INFO: Sensor SonarGo [go]
INFO: 1 source files to be analyzed
INFO: Load project repositories
INFO: Load project repositories (done) | time=44ms
INFO: Sensor SonarGo [go] (done) | time=226ms
INFO: Sensor Go Unit Test Report [go]
INFO: 1/1 source files have been analyzed
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestLogRequest
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestHandler
INFO: Sensor Go Unit Test Report [go] (done) | time=10ms
INFO: Sensor Go Cover sensor for Go coverage [go]
INFO: Load coverage report from '/home/vagrant/go/src/github.com/nemonik/helloworld-web/coverage.out'
INFO: Sensor Go Cover sensor for Go coverage [go] (done) | time=11ms
INFO: Sensor Import of Golint issues [go]
INFO: GoLintReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/golint-report.out
INFO: Sensor Import of Golint issues [go] (done) | time=1ms
INFO: Sensor Import of GoMetaLinter issues [go]
INFO: GoMetaLinterReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/gometalinter-report.out
INFO: Sensor Import of GoMetaLinter issues [go] (done) | time=1ms
INFO: Sensor JavaXmlSensor [java]
INFO: Sensor JavaXmlSensor [java] (done) | time=1ms
INFO: Sensor HTML [web]
INFO: Sensor HTML [web] (done) | time=15ms
INFO: ------------- Run sensors on project
INFO: Sensor Zero Coverage Sensor
INFO: Sensor Zero Coverage Sensor (done) | time=1ms
INFO: SCM provider for this project is: git
INFO: 1 files to be analyzed
INFO: 0/1 files analyzed
WARN: Missing blame information for the following files:
WARN:   * main.go
WARN: This may lead to missing/broken features in SonarQube
INFO: Calculating CPD for 1 file
INFO: CPD calculation finished
INFO: Analysis report generated in 103ms, dir size=73 KB
INFO: Analysis report compressed in 12ms, zip size=11 KB
INFO: Analysis report uploaded in 50ms
INFO: ANALYSIS SUCCESSFUL, you can browse http://192.168.0.205:9000/dashboard?id=helloworld-web
INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
INFO: More about the report processing at http://192.168.0.205:9000/api/ce/task?id=AXA2CIfsxXdPaj5QXDrb
INFO: Analysis total time: 4.101 s
INFO: ------------------------------------------------------------------------
INFO: EXECUTION SUCCESS
INFO: ------------------------------------------------------------------------
INFO: Total time: 5.125s
INFO: Final Memory: 17M/130M
INFO: ------------------------------------------------------------------------
go build -o helloworld-web -v
github.com/nemonik/helloworld-web
```

### 9.9.11. Dockerize the application

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application" #FFFFFF
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

We can build a Docker image for our application on top of a `192.168.0.10:5000/nemonik/golang:1.13.7` image by creating a `Dockerfile` with the following content

```docker
FROM 192.168.0.10:5000/nemonik/golang:1.13.7
MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>

RUN mkdir /app
ADD helloworld-web /app/

WORKDIR /app

ENTRYPOINT ["/app/helloworld-web"]

EXPOSE 3000
```

And then build the application and create its Docker image via 

```bash
make build
docker build -t nemonik/helloworld-web .
```

**NOTE**

- Don't miss that last period (`.`) at the end the line above. 

After some time, the command line output will resemble

```
development:~/go/src/github.com/nemonik/helloworld-web$ make build
go build -o helloworld-web -v
development:~/go/src/github.com/nemonik/helloworld-web$ docker build -t nemonik/helloworld-web .
Sending build context to Docker daemon  10.77MB
Step 1/7 : FROM 192.168.0.10:5000/nemonik/golang:1.13.7
 ---> 6dd8c4661085
Step 2/7 : MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>
 ---> Using cache
 ---> 78c3db0769f7
Step 3/7 : RUN mkdir /app
 ---> Running in ea7e5f08bcc3
Removing intermediate container ea7e5f08bcc3
 ---> 4c9b898c65d4
Step 4/7 : ADD helloworld-web /app/
 ---> acb9594a3f98
Step 5/7 : WORKDIR /app
 ---> Running in e6a6e4c931e2
Removing intermediate container e6a6e4c931e2
 ---> 7c3987e78920
Step 6/7 : ENTRYPOINT ["/app/helloworld-web"]
 ---> Running in 4883e70edec5
Removing intermediate container 4883e70edec5
 ---> ff11926d8b28
Step 7/7 : EXPOSE 3000
 ---> Running in 96f4d2578c1d
Removing intermediate container 96f4d2578c1d
 ---> 4f02645ad96a
Successfully built 4f02645ad96a
Successfully tagged nemonik/helloworld-web:latest
```

What just happened?

- The `FROM` line instructs Docker to retrieve the `nemonik/golang:1.13.7` from the private Docker registry running on our Kubernetes cluster, which it did.  And then use this as the basis of your application's docker image.
- Then the rest of the commands in the `Dockerfile` are executed laying down layers on top of the `nemonik/golang:1.13.7` image thereby building a new docker image entitled `nemonik/helloworld-web` and tagging it `latests`.
- `docker build` then places the image with the name `nemonik/helloworld-web` in the `Development`'s local Docker registry so that containers can be created off this image locally. 

Check the development vagrant's local Docker registry via

```bash
docker images nemonik/helloworld-web
```

The command line output will resemble

```
development:~/go/src/github.com/nemonik/helloworld-web$ docker images nemonik/helloworld-web
REPOSITORY               TAG                 IMAGE ID            CREATED              SIZE
nemonik/helloworld-web   latest              4f02645ad96a        About a minute ago   1.06GB
```

You've created an approximately 1.06 GB sized `nemonik/helloworld-web` image tagged `latest`.  Kind of fat isn't?  Not phat as in cool, but fat as in large.

**NOTE:**

- The registry will also contain the `192.168.0.10:5000/nemonik/golang:1.13.7` on which `nemonik/helloworld-web:latest` is based, so the next time re-build image you won't have to wait for `192.168.0.10:5000/nemonik/golang:1.13.7` to be retrieved.   

But this approach doesn't create the smallest most secure container image. You can accomplish this by instead using Docker's reserved, minimal image `scratch`, as a starting point for your `Dockerfile` like so

```docker
FROM scratch
MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>

WORKDIR /

ADD helloworld-web /

ENTRYPOINT ["/helloworld-web"]

EXPOSE 3000
```

In order for our Go application to execute in the smallest container image possible we will disable cgo tool that is enabled by default for cross compiling, target the Linux operating system and build our Go application statically to include all the dependencies like so

```bash
CGO_ENABLED=0 GOOS=linux go build -a -o helloworld-web .
```

**NOTE:**

- `-a` paramter is used to force rebuilding package to ensure you have all the dependencies.

We can update the project's Makefile to do the same by modifying the `GOBUILD` variable

```makefile
GOBUILD=CGO_ENABLED=0 GOOS=linux $(GOCMD) build -a
```

While we are at it add a `docker-build` target

```makefile
docker-build: build
	docker build --no-cache -t nemonik/helloworld-web .
```

And also, replace `build` with `docker-build` in the `all` target line like so:

```makefile
all: sonar docker-build
```

Remember to use tab characters vice space characters.

And then run in the command line

```bash
make all
```

Whose output will be 

```
go fmt
go get golang.org/x/lint/golint
golint
go test -v -cover ./...
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	(cached)	coverage: 55.6% of statements
go get -u gopkg.in/alecthomas/gometalinter.v2
gometalinter.v2 --install
Installing:
  deadcode
  dupl
  errcheck
  gochecknoglobals
  gochecknoinits
  goconst
  gocyclo
  goimports
  golint
  gosec
  gosimple
  gotype
  gotypex
  ineffassign
  interfacer
  lll
  maligned
  megacheck
  misspell
  nakedret
  safesql
  staticcheck
  structcheck
  unconvert
  unparam
  unused
  varcheck
gometalinter.v2 > gometalinter-report.out
golint > golint-report.out
go test -v ./... -coverprofile=coverage.out
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.004s	coverage: 55.6% of statements
go test -v ./... -json > report.json
sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
INFO: Scanner configuration file: /usr/local/sonar-scanner/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarQube Scanner 4.3.0.2102
INFO: Java 1.8.0_242 IcedTea (64-bit)
INFO: Linux 4.19.98-0-virt amd64
INFO: User cache: /home/vagrant/.sonar/cache
INFO: SonarQube server 7.9.1
INFO: Default locale: "en_US", source code encoding: "UTF-8" (analysis is platform dependent)
WARN: SonarScanner will require Java 11+ to run starting in SonarQube 8.x
INFO: Load global settings
INFO: Load global settings (done) | time=83ms
INFO: Server id: 138C7C5C-AXA10KgUwFu7OPeQythr
INFO: User cache: /home/vagrant/.sonar/cache
INFO: Load/download plugins
INFO: Load plugins index
INFO: Load plugins index (done) | time=46ms
INFO: Load/download plugins (done) | time=75ms
INFO: Process project properties
INFO: Execute project builders
INFO: Execute project builders (done) | time=4ms
INFO: Project key: helloworld-web
INFO: Base dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web
INFO: Working dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web/.scannerwork
INFO: Load project settings for component key: 'helloworld-web'
INFO: Load project settings for component key: 'helloworld-web' (done) | time=25ms
INFO: Load quality profiles
INFO: Load quality profiles (done) | time=61ms
INFO: Load active rules
INFO: Load active rules (done) | time=706ms
INFO: Indexing files...
INFO: Project configuration:
INFO:   Excluded sources: **/*test.go
INFO: 3 files indexed
INFO: 0 files ignored because of inclusion/exclusion patterns
INFO: 0 files ignored because of scm ignore settings
INFO: Quality profile for go: Sonar way
INFO: ------------- Run sensors on module helloworld-web
INFO: Load metrics repository
INFO: Load metrics repository (done) | time=22ms
INFO: Sensor JaCoCo XML Report Importer [jacoco]
INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=9ms
INFO: Sensor SonarGo [go]
INFO: 1 source files to be analyzed
INFO: Load project repositories
INFO: Load project repositories (done) | time=23ms
INFO: Sensor SonarGo [go] (done) | time=254ms
INFO: 1/1 source files have been analyzed
INFO: Sensor Go Unit Test Report [go]
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestLogRequest
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestHandler
INFO: Sensor Go Unit Test Report [go] (done) | time=12ms
INFO: Sensor Go Cover sensor for Go coverage [go]
INFO: Load coverage report from '/home/vagrant/go/src/github.com/nemonik/helloworld-web/coverage.out'
INFO: Sensor Go Cover sensor for Go coverage [go] (done) | time=14ms
INFO: Sensor Import of Golint issues [go]
INFO: GoLintReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/golint-report.out
INFO: Sensor Import of Golint issues [go] (done) | time=2ms
INFO: Sensor Import of GoMetaLinter issues [go]
INFO: GoMetaLinterReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/gometalinter-report.out
INFO: Sensor Import of GoMetaLinter issues [go] (done) | time=1ms
INFO: Sensor JavaXmlSensor [java]
INFO: Sensor JavaXmlSensor [java] (done) | time=2ms
INFO: Sensor HTML [web]
INFO: Sensor HTML [web] (done) | time=14ms
INFO: ------------- Run sensors on project
INFO: Sensor Zero Coverage Sensor
INFO: Sensor Zero Coverage Sensor (done) | time=1ms
INFO: SCM provider for this project is: git
INFO: 1 files to be analyzed
INFO: 0/1 files analyzed
WARN: Missing blame information for the following files:
WARN:   * main.go
WARN: This may lead to missing/broken features in SonarQube
INFO: Calculating CPD for 1 file
INFO: CPD calculation finished
INFO: Analysis report generated in 122ms, dir size=73 KB
INFO: Analysis report compressed in 11ms, zip size=11 KB
INFO: Analysis report uploaded in 30ms
INFO: ANALYSIS SUCCESSFUL, you can browse http://192.168.0.205:9000/dashboard?id=helloworld-web
INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
INFO: More about the report processing at http://192.168.0.205:9000/api/ce/task?id=AXA2EoCCxXdPaj5QXDrc
INFO: Analysis total time: 3.905 s
INFO: ------------------------------------------------------------------------
INFO: EXECUTION SUCCESS
INFO: ------------------------------------------------------------------------
INFO: Total time: 5.025s
INFO: Final Memory: 17M/127M
INFO: ------------------------------------------------------------------------
CGO_ENABLED=0 GOOS=linux go build -a -o helloworld-web -v
internal/cpu
runtime/internal/atomic
runtime/internal/sys
internal/bytealg
runtime/internal/math
math/bits
math
runtime
unicode/utf8
internal/race
sync/atomic
unicode
internal/testlog
container/list
crypto/internal/subtle
crypto/subtle
vendor/golang.org/x/crypto/cryptobyte/asn1
internal/nettrace
vendor/golang.org/x/crypto/internal/subtle
vendor/golang.org/x/crypto/curve25519
internal/reflectlite
sync
math/rand
internal/singleflight
errors
sort
strconv
io
internal/oserror
syscall
reflect
time
internal/fmtsort
internal/poll
internal/syscall/unix
bytes
os
bufio
encoding/binary
fmt
hash
hash/crc32
context
crypto/cipher
crypto/aes
log
compress/flate
strings
math/big
compress/gzip
crypto
crypto/des
crypto/internal/randutil
crypto/sha512
crypto/ed25519/internal/edwards25519
crypto/rand
crypto/elliptic
encoding/asn1
crypto/ed25519
crypto/hmac
crypto/ecdsa
crypto/md5
crypto/rc4
crypto/rsa
crypto/sha1
crypto/sha256
crypto/dsa
encoding/hex
crypto/x509/pkix
encoding/base64
vendor/golang.org/x/crypto/cryptobyte
encoding/pem
path/filepath
io/ioutil
vendor/golang.org/x/net/dns/dnsmessage
net/url
vendor/golang.org/x/crypto/internal/chacha20
vendor/golang.org/x/crypto/poly1305
net
vendor/golang.org/x/sys/cpu
vendor/golang.org/x/crypto/chacha20poly1305
vendor/golang.org/x/crypto/hkdf
vendor/golang.org/x/text/transform
vendor/golang.org/x/text/unicode/bidi
vendor/golang.org/x/text/secure/bidirule
vendor/golang.org/x/text/unicode/norm
vendor/golang.org/x/net/idna
crypto/x509
net/textproto
vendor/golang.org/x/net/http/httpguts
vendor/golang.org/x/net/http/httpproxy
vendor/golang.org/x/net/http2/hpack
mime
crypto/tls
mime/quotedprintable
mime/multipart
net/http/internal
path
net/http/httptrace
net/http
github.com/nemonik/helloworld-web
docker build --no-cache -t nemonik/helloworld-web .
Sending build context to Docker daemon  10.72MB
Step 1/6 : FROM scratch
 --->
Step 2/6 : MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>
 ---> Running in 9c5774972700
Removing intermediate container 9c5774972700
 ---> 12eaf9f979be
Step 3/6 : WORKDIR /
 ---> Running in fa32fef378b0
Removing intermediate container fa32fef378b0
 ---> 2eec5c7e157a
Step 4/6 : ADD helloworld-web /
 ---> 4cfa2c4230c7
Step 5/6 : ENTRYPOINT ["/helloworld-web"]
 ---> Running in 4f064cd205b8
Removing intermediate container 4f064cd205b8
 ---> c87dbe2ab79c
Step 6/6 : EXPOSE 3000
 ---> Running in 740896497a7d
Removing intermediate container 740896497a7d
 ---> c8a6b2838f8c
Successfully built c8a6b2838f8c
Successfully tagged nemonik/helloworld-web:latest
```

```
development:~/go/src/github.com/nemonik/helloworld-web$ docker images nemonik/helloworld-web
REPOSITORY               TAG                 IMAGE ID            CREATED              SIZE
nemonik/helloworld-web   latest              c8a6b2838f8c        About a minute ago   7.4MB
```

This image is 7.4 MB vice 1.06GB and way more secure.

### 9.9.12. Run the Docker container

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container" #FFFFFF
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Spin up a new `nemonik/helloworld-web` container by entering either

- Option 1 - Run the container in the foreground
  
  ```bash
  docker run -p 3000:3000 --name helloworld-web  nemonik/helloworld-web
  ``` 
  
  and then hitting 
  
  <http://192.168.0.9:3000> 
  
  in your web browser, or

- Option 2 - Run the container in the background 
  
  ```
  docker run -d -p 3000:3000 --name helloworld-web nemonik/helloworld-web
  ``` 
  and the hit the same URL in the command-line via

  ```bash
  curl --no-progress-meter http://192.168.0.9:3000
  ```

Where

- `run` messages Docker you are running a new container
- `-d` in the second option, runs the container in background and prints container ID.
- `-p 3000:3000` published the container's port as 3000 to the host.
- `--name helloworld-web` names the running container
- `nemonik/helloworld-web` states what container image to use.

#### 9.9.12.1. Option 1

The command line output for the first option will be

```
[vagrant@development helloworld-web]$ docker run -p 3000:3000 --name helloworld-web nemonik/helloworld-web
listening on :3000
192.168.0.1:54740  GET  /
192.168.0.1:54740  GET  /favicon.ico
^C
```

#### 9.9.12.2. Option 2

For the second option there will be no output written to the screen, but you can see the same output if you run 

```bash
docker logs <the container id output when started the container> -f
```

or 

```bash
docker logs helloworld-web  -f
```

returning

```
[vagrant@development helloworld-web]$ docker logs helloworld-web -f
listening on :3000
192.168.0.1:55159  GET  /
192.168.0.1:55159  GET  /favicon.ico
```

`ctrl-c` (i.e., press and hold the `ctrl` key while pressing `c`) to exit the logs.

To kill the container

```bash
docker rm -f helloworld-web
```

### 9.9.13. Push the container image to the private Docker registry

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry" #FFFFFF
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

In the development vagrant, push the `nemonik/helloworld-web` container image into the private Docker registry running in the Kubernetes cluster, so that all the vagrants can create containers from the image with the commands

```bash
docker tag nemonik/helloworld-web 192.168.0.10:5000/nemonik/helloworld-web
docker push 192.168.0.10:5000/nemonik/helloworld-web
```

Command line output will be

```
development:~/go/src/github.com/nemonik/helloworld-web$ docker push 192.168.0.10:5000/nemonik/helloworld-web
The push refers to repository [192.168.0.10:5000/nemonik/helloworld-web]
3c1e3378eec3: Pushed
latest: digest: sha256:fa0a235be59f156e1bc26174ad5a2ac570252ac7a21f33a67e90c8e480f75eaf size: 528
```

We can update the project's Makefile adding a `docker-push` target

```makefile
docker-push: docker-build
	docker tag nemonik/helloworld-web 192.168.0.10:5000/nemonik/helloworld-web
	docker push 192.168.0.10:5000/nemonik/helloworld-web
```

Also, add replace `docker-build` with `docker-push` in the `all` target  line like so:

```makefile
all: sonar docker-push
```

And then run in the command line

```bash
make all
```

The output will be something like

```
go fmt
go get golang.org/x/lint/golint
golint
go test -v -cover ./...
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	(cached)	coverage: 55.6% of statements
go get -u gopkg.in/alecthomas/gometalinter.v2
gometalinter.v2 --install
Installing:
  deadcode
  dupl
  errcheck
  gochecknoglobals
  gochecknoinits
  goconst
  gocyclo
  goimports
  golint
  gosec
  gosimple
  gotype
  gotypex
  ineffassign
  interfacer
  lll
  maligned
  megacheck
  misspell
  nakedret
  safesql
  staticcheck
  structcheck
  unconvert
  unparam
  unused
  varcheck
gometalinter.v2 > gometalinter-report.out
golint > golint-report.out
go test -v ./... -coverprofile=coverage.out
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.005s	coverage: 55.6% of statements
go test -v ./... -json > report.json
sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go
INFO: Scanner configuration file: /usr/local/sonar-scanner/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarQube Scanner 4.3.0.2102
INFO: Java 1.8.0_242 IcedTea (64-bit)
INFO: Linux 4.19.98-0-virt amd64
INFO: User cache: /home/vagrant/.sonar/cache
INFO: SonarQube server 7.9.1
INFO: Default locale: "en_US", source code encoding: "UTF-8" (analysis is platform dependent)
WARN: SonarScanner will require Java 11+ to run starting in SonarQube 8.x
INFO: Load global settings
INFO: Load global settings (done) | time=92ms
INFO: Server id: 138C7C5C-AXA10KgUwFu7OPeQythr
INFO: User cache: /home/vagrant/.sonar/cache
INFO: Load/download plugins
INFO: Load plugins index
INFO: Load plugins index (done) | time=44ms
INFO: Load/download plugins (done) | time=84ms
INFO: Process project properties
INFO: Execute project builders
INFO: Execute project builders (done) | time=8ms
INFO: Project key: helloworld-web
INFO: Base dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web
INFO: Working dir: /home/vagrant/go/src/github.com/nemonik/helloworld-web/.scannerwork
INFO: Load project settings for component key: 'helloworld-web'
INFO: Load project settings for component key: 'helloworld-web' (done) | time=28ms
INFO: Load quality profiles
INFO: Load quality profiles (done) | time=57ms
INFO: Load active rules
INFO: Load active rules (done) | time=859ms
INFO: Indexing files...
INFO: Project configuration:
INFO:   Excluded sources: **/*test.go
INFO: 3 files indexed
INFO: 0 files ignored because of inclusion/exclusion patterns
INFO: 0 files ignored because of scm ignore settings
INFO: Quality profile for go: Sonar way
INFO: ------------- Run sensors on module helloworld-web
INFO: Load metrics repository
INFO: Load metrics repository (done) | time=32ms
INFO: Sensor JaCoCo XML Report Importer [jacoco]
INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=11ms
INFO: Sensor SonarGo [go]
INFO: 1 source files to be analyzed
INFO: Load project repositories
INFO: Load project repositories (done) | time=27ms
INFO: 1/1 source files have been analyzed
INFO: Sensor SonarGo [go] (done) | time=308ms
INFO: Sensor Go Unit Test Report [go]
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestLogRequest
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestHandler
INFO: Sensor Go Unit Test Report [go] (done) | time=14ms
INFO: Sensor Go Cover sensor for Go coverage [go]
INFO: Load coverage report from '/home/vagrant/go/src/github.com/nemonik/helloworld-web/coverage.out'
INFO: Sensor Go Cover sensor for Go coverage [go] (done) | time=20ms
INFO: Sensor Import of Golint issues [go]
INFO: GoLintReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/golint-report.out
INFO: Sensor Import of Golint issues [go] (done) | time=2ms
INFO: Sensor Import of GoMetaLinter issues [go]
INFO: GoMetaLinterReportSensor: Importing /home/vagrant/go/src/github.com/nemonik/helloworld-web/gometalinter-report.out
INFO: Sensor Import of GoMetaLinter issues [go] (done) | time=1ms
INFO: Sensor JavaXmlSensor [java]
INFO: Sensor JavaXmlSensor [java] (done) | time=1ms
INFO: Sensor HTML [web]
INFO: Sensor HTML [web] (done) | time=13ms
INFO: ------------- Run sensors on project
INFO: Sensor Zero Coverage Sensor
INFO: Sensor Zero Coverage Sensor (done) | time=2ms
INFO: SCM provider for this project is: git
INFO: 1 files to be analyzed
INFO: 0/1 files analyzed
WARN: Missing blame information for the following files:
WARN:   * main.go
WARN: This may lead to missing/broken features in SonarQube
INFO: Calculating CPD for 1 file
INFO: CPD calculation finished
INFO: Analysis report generated in 108ms, dir size=73 KB
INFO: Analysis report compressed in 11ms, zip size=11 KB
INFO: Analysis report uploaded in 31ms
INFO: ANALYSIS SUCCESSFUL, you can browse http://192.168.0.205:9000/dashboard?id=helloworld-web
INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
INFO: More about the report processing at http://192.168.0.205:9000/api/ce/task?id=AXA2GBhVxXdPaj5QXDrd
INFO: Analysis total time: 4.510 s
INFO: ------------------------------------------------------------------------
INFO: EXECUTION SUCCESS
INFO: ------------------------------------------------------------------------
INFO: Total time: 5.661s
INFO: Final Memory: 17M/145M
INFO: ------------------------------------------------------------------------
CGO_ENABLED=0 GOOS=linux go build -a -o helloworld-web -v
internal/cpu
runtime/internal/atomic
internal/bytealg
runtime/internal/sys
runtime/internal/math
math/bits
runtime
math
unicode/utf8
internal/race
sync/atomic
unicode
internal/testlog
container/list
crypto/internal/subtle
crypto/subtle
vendor/golang.org/x/crypto/cryptobyte/asn1
internal/nettrace
vendor/golang.org/x/crypto/internal/subtle
vendor/golang.org/x/crypto/curve25519
internal/reflectlite
sync
math/rand
internal/singleflight
errors
sort
strconv
io
internal/oserror
syscall
reflect
time
internal/poll
internal/syscall/unix
os
internal/fmtsort
bytes
bufio
fmt
encoding/binary
hash
log
compress/flate
hash/crc32
context
crypto/cipher
compress/gzip
strings
crypto/aes
crypto
crypto/des
math/big
crypto/internal/randutil
crypto/sha512
crypto/ed25519/internal/edwards25519
crypto/hmac
crypto/md5
crypto/rc4
crypto/sha1
crypto/sha256
crypto/rand
crypto/elliptic
encoding/asn1
crypto/ed25519
crypto/ecdsa
crypto/rsa
crypto/dsa
encoding/hex
crypto/x509/pkix
encoding/base64
vendor/golang.org/x/crypto/cryptobyte
encoding/pem
path/filepath
vendor/golang.org/x/net/dns/dnsmessage
io/ioutil
net/url
vendor/golang.org/x/crypto/internal/chacha20
vendor/golang.org/x/crypto/poly1305
net
vendor/golang.org/x/sys/cpu
vendor/golang.org/x/crypto/chacha20poly1305
vendor/golang.org/x/crypto/hkdf
vendor/golang.org/x/text/transform
vendor/golang.org/x/text/unicode/bidi
vendor/golang.org/x/text/secure/bidirule
vendor/golang.org/x/text/unicode/norm
vendor/golang.org/x/net/idna
crypto/x509
net/textproto
vendor/golang.org/x/net/http/httpguts
vendor/golang.org/x/net/http/httpproxy
crypto/tls
vendor/golang.org/x/net/http2/hpack
mime
mime/quotedprintable
mime/multipart
net/http/internal
path
net/http/httptrace
net/http
github.com/nemonik/helloworld-web
docker build --no-cache -t nemonik/helloworld-web .
Sending build context to Docker daemon  10.72MB
Step 1/6 : FROM scratch
 --->
Step 2/6 : MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>
 ---> Running in b113db9f57c2
Removing intermediate container b113db9f57c2
 ---> f42417e5e947
Step 3/6 : WORKDIR /
 ---> Running in 184c1c5031ce
Removing intermediate container 184c1c5031ce
 ---> 64b124581373
Step 4/6 : ADD helloworld-web /
 ---> 1b8337f69b2c
Step 5/6 : ENTRYPOINT ["/helloworld-web"]
 ---> Running in 17ce72b7899f
Removing intermediate container 17ce72b7899f
 ---> 268fa68e2f65
Step 6/6 : EXPOSE 3000
 ---> Running in f0718890639b
Removing intermediate container f0718890639b
 ---> 9015eb60e569
Successfully built 9015eb60e569
Successfully tagged nemonik/helloworld-web:latest
docker tag nemonik/helloworld-web 192.168.0.10:5000/nemonik/helloworld-web
docker push 192.168.0.10:5000/nemonik/helloworld-web
The push refers to repository [192.168.0.10:5000/nemonik/helloworld-web]
17e268bf386b: Pushed
latest: digest: sha256:2080f1daf0facf99f416364e03dcacfe1d891abef0033a1889891cc261c84802 size: 528
```

The Docker registry container image shipped by Docker does not provide a GUI, but we can verify by querying the catalog of the private registry through a web browser or Unix command line tool `curl` by entering into the command line

```bash
curl --no-progress-meter -X GET http://192.168.0.10:5000/v2/_catalog
```

Returns in the command line

```
{"repositories":["golang","nemonik/drone","nemonik/drone-runner-docker","nemonik/gitlab","nemonik/golang","nemonik/golang-sonarqube-scanner","nemonik/plantuml-server","nemonik/python","nemonik/sonarqube","nemonik/standalone-firefox","nemonik/zap2docker-stable","owasp/zap2docker-stable","plantuml/plantuml-server","python","selenium/standalone-firefox"]}
```

The pretty print form of this looks like so

```
{
  "repositories": [
    "golang",
    "nemonik/drone",
    "nemonik/drone-runner-docker",
    "nemonik/gitlab",
    "nemonik/golang",
    "nemonik/golang-sonarqube-scanner",
    "nemonik/plantuml-server",
    "nemonik/python",
    "nemonik/sonarqube",
    "nemonik/standalone-firefox",
    "nemonik/zap2docker-stable",
    "owasp/zap2docker-stable",
    "plantuml/plantuml-server",
    "python",
    "selenium/standalone-firefox"
  ]
}
```

Quite a bit of container images we got there, but these aren't the only ones in use by the class. There is also a passthrough Docker registry holding all the container images pulled from Docker Hub and not held in private registry.  "Passthrough" in a sense the images are cached in the repository and if asked for again the image will be pulled from this registry vice going all the way to Docker Hub to be retrieved.

These cached container images can be listed via

```
curl --no-progress-meter -X GET http://192.168.0.10:5001/v2/_catalog
```

with results that look like

```
{
  "repositories": [
    "library/busybox",
    "library/golang",
    "library/python",
    "library/sonarqube",
    "nemonik/taiga",
    "owasp/zap2docker-stable",
    "plantuml/plantuml-server",
    "rancher/coredns-coredns",
    "sameersbn/gitlab",
    "sameersbn/postgresql",
    "selenium/standalone-firefox"
  ]
}
```

when pretty printed.

To list container images the private registry holds for the `helloworld-web` container image enter

```bash
curl --no-progress-meter -X GET http://192.168.0.10:5000/v2/nemonik/helloworld-web/tags/list
```

Returns in the command line

```
{"name":"nemonik/helloworld-web","tags":["latest"]}
```

The pretty print of this look like

```
{ 
   "name":"nemonik/helloworld-web",
   "tags":[ 
      "latest"
   ]
}
```

### 9.9.14. Configure Drone to execute your CICD pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline" #FFFFFF
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

As you did for the purpose of CI (Continuous Integration) of the prior application, you will need to configure Drone to perform CICD (a combination of Continuous Integration and Continuous Delivery) on the `helloworld-web` application.

Complete the following:

1. Open <http://192.168.0.10/> in your browser and authenticate through GitLab on into Drone, if you need to.
2. Then select `SYNC` and watch as the arrows chase each other for a bit.
3. Then click `root/helloworld-web` repo and `ACTIVATE REPOSITORY`, then `SAVE` under the `Main` section to enable Drone orchestration for the project.  A `Successfully saved` modal will appear for a second or two in the bottom left of the page indicating you've activated the repository.
4. Then click the Drone logo in the upper left of the page to return home.

### 9.9.15. Add Static Analysis (*SonarQube*) step to pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline" #FFFFFF
-right->"Add build step\nto pipeline" 
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

So, lets create our pipeline starting with a `sonarqube` step to update SonarQube with code quality scans automatically by opening `.drone.yml` in our text editor 

```yaml
kind: pipeline
name: default

steps:
- name: sonarqube
  image: 192.168.0.10:5000/nemonik/golang-sonarqube-scanner:4.3.0.2102
  commands:
  - export DRONESRC=`pwd`
  - export GOBIN=$GOPATH/bin
  - mkdir -p $GOPATH/src/github.com/nemonik
  - cd $GOPATH/src/github.com/nemonik
  - ln -s $DRONESRC helloworld-web
  - cd helloworld-web
  - gometalinter.v2 --install
  - gometalinter.v2 --deadline=120s --checkstyle > gometalinter-report.out || true
  - golint > golint-report.out || true
  - go test -v ./... -coverprofile=coverage.out || true
  - go test -v ./... -json > report.json || true
  - sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go || true
```

Things to note in the above

- This step uses an image, `nemonik/golang-sonarqube-scanner:4.3.0.2102`, built on top of the `nemonik/golang:1.13.7` image to speed builds along.
- I may have forgotten to update the documentation.  To verify the container image tage is correct perform the following on the command-line and correct the drone step as needed
  ```
  curl --no-progress-meter -X GET http://192.168.0.10:5000/v2/nemonik/golang-sonarqube-scanner/tags/list
  ```
- Cut-and-pasting may split the last command (i.e., the line beginning with `  - sonar-scanner`) into multiple lines in your editor that when executed by Drone will result in your build failing. If this happens, correct in your editor and re-push. 
- The following commands is a bit of filesystem juggling, so that the scan can be executed

  ```yaml
    - export DRONESRC=`pwd`
    - export GOBIN=$GOPATH/bin
    - mkdir -p $GOPATH/src/github.com/nemonik
    - cd $GOPATH/src/github.com/nemonik
    - ln -s $DRONESRC helloworld-web
  ``` 

  What follows handles running the scan absorbing errors as they arise, so as to not break the build.

  ```yaml
    - gometalinter.v2 --install
    - gometalinter.v2 --deadline=120s --checkstyle > gometalinter-report.out || true
    - golint > golint-report.out || true
    - go test -v ./... -coverprofile=coverage.out || true
    - go test -v ./... -json > report.json || true
    - sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go || true
  ```

To execute your pipeline, push your changes to GitLab

```bash
git add .
git commit -m "added sonar step to pipeline"
git push origin master
```

Open on your host

<http://192.168.0.10/root/helloworld-web>

And monitor the progress of the build. The pipeline should execute in a few minutes.  

Typical success resembles

```
+ export DRONESRC=/drone/src
+ export GOBIN=$GOPATH/bin
+ mkdir -p $GOPATH/src/github.com/nemonik
+ cd $GOPATH/src/github.com/nemonik
+ ln -s $DRONESRC helloworld-web
+ cd helloworld-web
+ gometalinter.v2 --install
Installing:
  deadcode
  dupl
  errcheck
  gochecknoglobals
  gochecknoinits
  goconst
  gocyclo
  goimports
  golint
  gosec
  gosimple
  gotype
  gotypex
  ineffassign
  interfacer
  lll
  maligned
  megacheck
  misspell
  nakedret
  safesql
  staticcheck
  structcheck
  unconvert
  unparam
  unused
  varcheck
+ gometalinter.v2 --deadline=120s --checkstyle > gometalinter-report.out || true
+ golint > golint-report.out || true
+ go test -v ./... -coverprofile=coverage.out || true
=== RUN   TestLogRequest
--- PASS: TestLogRequest (0.00s)
=== RUN   TestHandler
--- PASS: TestHandler (0.00s)
PASS
coverage: 55.6% of statements
ok  	github.com/nemonik/helloworld-web	0.008s	coverage: 55.6% of statements
+ go test -v ./... -json > report.json || true
+ sonar-scanner -D sonar.host.url=http://192.168.0.205:9000 -D sonar.projectKey=helloworld-web -D sonar.projectName=helloworld-web -D sonar.projectVersion=1.0 -D sonar.sources=main.go -D sonar.go.gometalinter.reportPaths=gometalinter-report.out -D sonar.go.golint.reportPaths=golint-report.out -D sonar.go.coverage.reportPaths=coverage.out -D sonar.go.tests.reportPaths=report.json -D sonar.exclusions=**/*test.go || true
INFO: Scanner configuration file: /usr/local/sonar-scanner-4.3.0.2102-linux/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarQube Scanner 4.3.0.2102
INFO: Java 11.0.3 AdoptOpenJDK (64-bit)
INFO: Linux 4.19.98-0-virt amd64
INFO: User cache: /root/.sonar/cache
INFO: SonarQube server 7.9.1
INFO: Default locale: "en_US", source code encoding: "US-ASCII" (analysis is platform dependent)
INFO: Load global settings
INFO: Load global settings (done) | time=81ms
INFO: Server id: 138C7C5C-AXA10KgUwFu7OPeQythr
INFO: User cache: /root/.sonar/cache
INFO: Load/download plugins
INFO: Load plugins index
INFO: Load plugins index (done) | time=65ms
INFO: Load/download plugins (done) | time=1796ms
INFO: Process project properties
INFO: Execute project builders
INFO: Execute project builders (done) | time=4ms
INFO: Project key: helloworld-web
INFO: Base dir: /go/src/github.com/nemonik/helloworld-web
INFO: Working dir: /go/src/github.com/nemonik/helloworld-web/.scannerwork
INFO: Load project settings for component key: 'helloworld-web'
INFO: Load project settings for component key: 'helloworld-web' (done) | time=21ms
INFO: Load quality profiles
INFO: Load quality profiles (done) | time=45ms
INFO: Detected DroneCI
INFO: Load active rules
INFO: Load active rules (done) | time=671ms
INFO: Indexing files...
INFO: Project configuration:
INFO:   Excluded sources: **/*test.go
INFO: 3 files indexed
INFO: 0 files ignored because of inclusion/exclusion patterns
INFO: 0 files ignored because of scm ignore settings
INFO: Quality profile for go: Sonar way
INFO: ------------- Run sensors on module helloworld-web
INFO: Load metrics repository
INFO: Load metrics repository (done) | time=28ms
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by net.sf.cglib.core.ReflectUtils$1 (file:/root/.sonar/cache/866bb1adbf016ea515620f1aaa15ec53/sonar-javascript-plugin.jar) to method java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
WARNING: Please consider reporting this to the maintainers of net.sf.cglib.core.ReflectUtils$1
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
INFO: Sensor JaCoCo XML Report Importer [jacoco]
INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=8ms
INFO: Sensor SonarGo [go]
INFO: 1 source files to be analyzed
INFO: Load project repositories
INFO: Load project repositories (done) | time=23ms
INFO: Sensor SonarGo [go] (done) | time=297ms
INFO: 1/1 source files have been analyzed
INFO: Sensor Go Unit Test Report [go]
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestLogRequest
WARN: Failed to find test file for package github.com/nemonik/helloworld-web and test TestHandler
INFO: Sensor Go Unit Test Report [go] (done) | time=20ms
INFO: Sensor Go Cover sensor for Go coverage [go]
INFO: Load coverage report from '/go/src/github.com/nemonik/helloworld-web/coverage.out'
INFO: Sensor Go Cover sensor for Go coverage [go] (done) | time=26ms
INFO: Sensor Import of Golint issues [go]
INFO: GoLintReportSensor: Importing /go/src/github.com/nemonik/helloworld-web/golint-report.out
INFO: Sensor Import of Golint issues [go] (done) | time=0ms
INFO: Sensor Import of GoMetaLinter issues [go]
INFO: GoMetaLinterReportSensor: Importing /go/src/github.com/nemonik/helloworld-web/gometalinter-report.out
INFO: Sensor Import of GoMetaLinter issues [go] (done) | time=3ms
INFO: Sensor JavaXmlSensor [java]
INFO: Sensor JavaXmlSensor [java] (done) | time=7ms
INFO: Sensor HTML [web]
INFO: Sensor HTML [web] (done) | time=27ms
INFO: ------------- Run sensors on project
INFO: Sensor Zero Coverage Sensor
INFO: Sensor Zero Coverage Sensor (done) | time=5ms
INFO: Calculating CPD for 1 file
INFO: CPD calculation finished
INFO: Analysis report generated in 73ms, dir size=73 KB
INFO: Analysis report compressed in 10ms, zip size=11 KB
INFO: Analysis report uploaded in 35ms
INFO: ANALYSIS SUCCESSFUL, you can browse http://192.168.0.205:9000/dashboard?id=helloworld-web
INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
INFO: More about the report processing at http://192.168.0.205:9000/api/ce/task?id=AXA2MJCXxXdPaj5QXDrh
INFO: Analysis total time: 3.949 s
INFO: ------------------------------------------------------------------------
INFO: EXECUTION SUCCESS
INFO: ------------------------------------------------------------------------
INFO: Total time: 7.423s
INFO: Final Memory: 12M/44M
INFO: ------------------------------------------------------------------------
```

### 9.9.16. Add the build step to the pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline" 
-right->"Add build step\nto pipeline" #FFFFFF
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Add a build step to our `.drone.yml`

```yaml
- name: build
  image: 192.168.0.10:5000/nemonik/golang:1.13.7
  commands:
  - make build
```

To execute your pipeline, push your changes to GitLab

```bash
git add .
git commit -m "added build step to pipeline"
git push origin master
```

In a Web browser open Drone at <http://192.168.0.10/root/helloworld-web> and click on the build being executed to monitor progress.

Output for `build` will resemble

```
+ make build
CGO_ENABLED=0 GOOS=linux go build -a -o helloworld-web -v
math/bits
internal/race
unicode/utf8
runtime/internal/sys
unicode
internal/cpu
sync/atomic
runtime/internal/atomic
container/list
runtime/internal/math
crypto/internal/subtle
internal/testlog
crypto/subtle
vendor/golang.org/x/crypto/cryptobyte/asn1
internal/bytealg
math
internal/nettrace
vendor/golang.org/x/crypto/internal/subtle
vendor/golang.org/x/crypto/curve25519
runtime
internal/reflectlite
sync
internal/singleflight
math/rand
errors
sort
internal/oserror
vendor/golang.org/x/net/dns/dnsmessage
strconv
io
syscall
crypto/internal/randutil
hash
bytes
strings
hash/crc32
crypto/hmac
vendor/golang.org/x/crypto/hkdf
path
crypto
crypto/rc4
reflect
bufio
vendor/golang.org/x/text/transform
internal/syscall/unix
time
context
internal/poll
os
internal/fmtsort
encoding/binary
fmt
path/filepath
net
crypto/cipher
crypto/sha512
crypto/ed25519/internal/edwards25519
crypto/md5
crypto/sha1
crypto/sha256
encoding/base64
io/ioutil
crypto/aes
crypto/des
encoding/pem
vendor/golang.org/x/crypto/internal/chacha20
vendor/golang.org/x/crypto/poly1305
vendor/golang.org/x/sys/cpu
log
compress/flate
encoding/hex
math/big
net/url
vendor/golang.org/x/crypto/chacha20poly1305
vendor/golang.org/x/text/unicode/norm
vendor/golang.org/x/text/unicode/bidi
vendor/golang.org/x/net/http2/hpack
mime
mime/quotedprintable
compress/gzip
net/http/internal
vendor/golang.org/x/text/secure/bidirule
vendor/golang.org/x/net/idna
net/textproto
vendor/golang.org/x/net/http/httpproxy
crypto/rand
crypto/dsa
crypto/elliptic
encoding/asn1
vendor/golang.org/x/net/http/httpguts
crypto/ed25519
crypto/rsa
mime/multipart
crypto/ecdsa
crypto/x509/pkix
vendor/golang.org/x/crypto/cryptobyte
crypto/x509
crypto/tls
net/http/httptrace
net/http
_/drone/src
```

Mirroring what you saw in development in your local environment.

### 9.9.17. Add container image publish step to pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline" #FFFFFF
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Add the publish step to your `.drone.yml` so that the container image is publish to the private registry via the pipeline.  The `publish:` step must be indented the same as the prior `build:` step.

```yaml
- name: publish
  image: plugins/docker
  settings:
    storage_driver: overlay
    insecure: true
    registry: 192.168.0.10:5000
    repo: 192.168.0.10:5000/nemonik/helloworld-web
    force_tag: true
    tags:
    - latest
```

This step makes use of `plugins/docker` container to publish the `nemonik/helloworld-web` docker image to the private registry.

To execute your pipeline, push your changes to GitLab

```bash
git add .
git commit -m "added publish step to pipeline"
git push origin master
```

The publish step will resemble:

```
+ /usr/local/bin/dockerd --data-root /var/lib/docker -s overlay --insecure-registry 192.168.0.10:5000
Registry credentials not provided. Guest mode enabled.
+ /usr/local/bin/docker version
Client: Docker Engine - Community
 Version:           18.09.0
 API version:       1.39
 Go version:        go1.10.4
 Git commit:        4d60db4
 Built:             Wed Nov  7 00:46:51 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.0
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.4
  Git commit:       4d60db4
  Built:            Wed Nov  7 00:52:55 2018
  OS/Arch:          linux/amd64
  Experimental:     false
+ /usr/local/bin/docker info
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 18.09.0
Storage Driver: overlay
 Backing Filesystem: extfs
 Supports d_type: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 468a545b9edcd5932818eb9de8e72413e616e86e
runc version: 69663f0bd4b60df09991c08812a60108003fa340
init version: fec3683
Security Options:
 seccomp
  Profile: default
Kernel Version: 4.19.98-0-virt
Operating System: Alpine Linux v3.8 (containerized)
OSType: linux
Architecture: x86_64
CPUs: 8
WARNING: No swap limit support
WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
Total Memory: 7.786GiB
Name: ac13303435b2
ID: R4T4:H6RI:BVXU:B4VB:PRXH:DZVS:VJIH:WMVZ:RCMP:LRED:FW3T:EHR3
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 192.168.0.10:5000
 127.0.0.0/8
Live Restore Enabled: false
Product License: Community Engine

+ /usr/local/bin/docker build --rm=true -f Dockerfile -t 89289971260b36ae681991d005b5bcc6cf3d98a8 . --pull=true --label org.label-schema.schema-version=1.0 --label org.label-schema.build-date=2020-02-11T21:51:30Z --label org.label-schema.vcs-ref=89289971260b36ae681991d005b5bcc6cf3d98a8 --label org.label-schema.vcs-url=http://192.168.0.202/root/helloworld-web.git
Sending build context to Docker daemon  10.75MB

Step 1/10 : FROM scratch
 ---> 
Step 2/10 : MAINTAINER Michael Joseph Walsh <nemonik@gmail.com>
 ---> Running in 5c187501e27e
Removing intermediate container 5c187501e27e
 ---> 3589a7b2cd1a
Step 3/10 : WORKDIR /
 ---> Running in b87f2d6ab0f8
Removing intermediate container b87f2d6ab0f8
 ---> 3e9b1eace1e4
Step 4/10 : ADD helloworld-web /
 ---> deeac6bb0ee3
Step 5/10 : ENTRYPOINT ["/helloworld-web"]
 ---> Running in adfac70a6c57
Removing intermediate container adfac70a6c57
 ---> 92c45eb84597
Step 6/10 : EXPOSE 3000
 ---> Running in 04e1f4c3dd7f
Removing intermediate container 04e1f4c3dd7f
 ---> 99451b177e3a
Step 7/10 : LABEL org.label-schema.build-date=2020-02-11T21:51:30Z
 ---> Running in 432e8d669b58
Removing intermediate container 432e8d669b58
 ---> 25de31c296bc
Step 8/10 : LABEL org.label-schema.schema-version=1.0
 ---> Running in cac59f261404
Removing intermediate container cac59f261404
 ---> 0071e07e8b95
Step 9/10 : LABEL org.label-schema.vcs-ref=89289971260b36ae681991d005b5bcc6cf3d98a8
 ---> Running in 325d72bb77f3
Removing intermediate container 325d72bb77f3
 ---> 420dc2bc93b6
Step 10/10 : LABEL org.label-schema.vcs-url=http://192.168.0.202/root/helloworld-web.git
 ---> Running in db379bb45195
Removing intermediate container db379bb45195
 ---> 59fd805ffd19
Successfully built 59fd805ffd19
Successfully tagged 89289971260b36ae681991d005b5bcc6cf3d98a8:latest
+ /usr/local/bin/docker tag 89289971260b36ae681991d005b5bcc6cf3d98a8 192.168.0.10:5000/nemonik/helloworld-web:latest
+ /usr/local/bin/docker push 192.168.0.10:5000/nemonik/helloworld-web:latest
The push refers to repository [192.168.0.10:5000/nemonik/helloworld-web]
9e55b147d94f: Preparing
9e55b147d94f: Pushed
latest: digest: sha256:d32f78d4eaf40eae3aee5facd27985fad8c1f4ae47844a06fc1894f3b9564f7b size: 528
+ /usr/local/bin/docker rmi 89289971260b36ae681991d005b5bcc6cf3d98a8
Untagged: 89289971260b36ae681991d005b5bcc6cf3d98a8:latest
+ /usr/local/bin/docker system prune -f
Total reclaimed space: 0B
```

Indicating the `publish` step executed, successfully.

This step is typically painfully slow if your container isn't optimized suchs as ours as this step leverages docker-in-docker to perform its tasks.

### 9.9.18. Add container deploy step to pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline" #FFFFFF
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"

-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

We're going to add a `deploy` step to our Drone pipeline to secure shell into `master` vagrant and deploy the `nemonik/helloworld` container image published by the prior step.

Now we could put our credentials straight into our pipeline, but keeping "security" in mind we're going to make use of a Drone Secret to store `vagrant` user's private key and then use this secret in executing the `deploy` step.  Even better would be create a service account on the `master` server for the sole purpose of performing deployments. 

First we need to retrieve the private key used by our vagrant user to secure shell (i.e., ssh) into the `master` vagrant.  We can retrieve this by executing the following command in the root of our project on the host computer (i.e., not inside a vagrant) in another shell

```bash
vagrant ssh-config master
```

Whose output will resemble

```
Host master
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /Users/nemonik/.vagrant.d/insecure_private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

Find the line starting with `IdentityFile` and use this with the shell command `cat` to view its contents like so

```bash
cat /Users/nemonik/.vagrant.d/insecure_private_key
```

`cat` will output 

```
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
+vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
-----END RSA PRIVATE KEY-----
```

Now, what's this business about `insecure_private_key`?  Well, by default `vagrant up` command will replace the insecure key pair in the box it uses as a starting point with a new key pair when provisioning each vagrant.  All the vagrants for this class were deliberately configured to use the `insecure_private_key` to ease the teaching of this class, but keeping "security" in mind it would've been more secure to configure `vagrant up` by default to generate a new private key for the `master` vagrant.  

To configure `vagrant up` to generate a private key per vagrant, replacing the `insecure_private_key`, simply comment out the following line in the project's `Vagrantfile` as the default value for `config.ssh.insert_key` is `true`. 

```ruby
  config.ssh.insert_key = false
```

In the next step you can simply cut-and-paste the contents of the `insecure_private_key` above.  Otherwise, you need to copy the contents of the generated key.

In your browser you're going to add a secret to your Drone project by following these steps

1. <http://192.168.0.10/root/helloworld-web/settings>
2. Under `Secrets`, enter `insecure_private_key` into the `Secret Name` form field and then cut-and-paste the contents of `insecure_private_key` file into `Secret Value` form field and then click `Add A Secret`.
3. Then click `ACTIVITY FEED` at the top of the page to return to project's activity feed.

If you closed your shell to `development` you can get back to your project by reconnecting via `vagrant ssh development` and entering

```bash
cd ~/go/src/github.com/nemonik/helloworld-web
```

Now, open `.drone.yml` in your editor and add the following `deploy:` step below the existing steps in your pipeline

```yaml
- name: deploy
  image: appleboy/drone-ssh
  settings:
    key:
      from_secret: insecure_private_key
    host: 192.168.0.10
    port: 22
    username: vagrant
    command_timeout: 5m
    script:
    - docker stop helloworld-web 2>/dev/null
    - docker rm helloworld-web 2>/dev/null
    - docker rmi 192.168.0.10:5000/nemonik/helloworld-web 2>/dev/null
    - docker run -d --restart=always --name helloworld-web --publish 3000:3000 192.168.0.10:5000/nemonik/helloworld-web
```

To execute your pipeline, push your changes to GitLab

```bash
git add .drone.yml
git commit -m "added deploy step to pipeline"
git push origin master
```

The final deploy step output will resemble:

```
======CMD======
docker stop helloworld-web 2>/dev/null
docker rm helloworld-web 2>/dev/null
docker rmi 192.168.0.10:5000/nemonik/helloworld-web 2>/dev/null
docker run -d --restart=always --name helloworld-web --publish 3000:3000 192.168.0.10:5000/nemonik/helloworld-web
======END======
err: Unable to find image '192.168.0.10:5000/nemonik/helloworld-web:latest' locally
err: latest: Pulling from nemonik/helloworld-web
err: 9e94e439c1d0: Pulling fs layer
err: 9e94e439c1d0: Download complete
err: 9e94e439c1d0: Pull complete
err: Digest: sha256:932616bcc82a494e2531c218ebbb57210e7f3dfc75c01a3492c1361fc23faff2
err: Status: Downloaded newer image for 192.168.0.10:5000/nemonik/helloworld-web:latest
out: 756f84653491b4c74d06f0fbbd031aa71a21ce936113f5f290b1fc16711c5732
==============================================
✅ Successfully executed commands to all host.
==============================================
```

Open

<http://192.168.0.10/root/helloworld-web> 

on your host and monitor the progress of the build. 

The pipeline should execute in a few minutes.

Once completed successfully, on your host open secure shell to your `master` vagrant via

```bash
vagrant ssh master
```

Then list the running Docker containers filtering for the one the pipeline just created

```bash
docker ps --filter "name=helloworld-web"
```

Command line output will resemble

```
master:~$ docker ps --filter "name=helloworld-web"
CONTAINER ID        IMAGE                                       COMMAND             CREATED              STATUS              PORTS                    NAMES
756f84653491        192.168.0.10:5000/nemonik/helloworld-web   "/helloworld-web"   About a minute ago   Up About a minute   0.0.0.0:3000->3000/tcp   helloworld-web
```

Then either on your docker host in a browser open

<http://192.168.0.10:3000>

or in the command-line of your `development` vagrant enter 

```bash
curl --no-progress-meter http://192.168.0.10:3000
```

Either way the container will return

```
Hello world!
```

So, now we have beginnings of a real CICD pipeline. There are no strings on me err. you.

### 9.9.19. Add compliance and policy automation (InSpec) test to the pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline" #FFFFFF
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

First let me switch gears into discussing DevSecOps.  

The *Dev* part of the *DevOps* clipped compound stands for *development* (i.e., the application developers) and *Ops* stands for; well, "every technology operational stakeholder (e.g., network engineers administrators, testers, and why yes, security engineers.)"  *DevSecOps* has recently emerged with the focus to embed security thought and collaboration into your team's culture when working an applications software development life cycle (SDLC) and *security-as-code* into your application pipelines.  If you're doing DevOps correctly, you're also inherently performing the methods and repeated practices of DevSecOps.  In DevOps, every technology operational stakeholder discipline must be included in the team without needing to fork DevOps to include said discipline.  We don't need *DevNetOps* nor do we need *DevTestOps* nor we need *DevShempOps*...

So, let us add some *security-as-code* to our project.

Authoring InSpec tests permit you to author compliance-as-code, a form of security-as-code, thereby turning compliance, security, and other policy requirements into automated tests.

InSpec has a very robust support for both the Docker container and its host, see: https://lollyrock.com/posts/inspec-for-docker/ for more information for using InSpec with Docker.

More on InSpec in general can be found here

https://www.inspec.io/docs/

And these specific sections are relevant to Docker:

https://www.inspec.io/docs/reference/resources/docker_container/

https://www.inspec.io/docs/reference/resources/docker/

https://www.inspec.io/docs/reference/resources/docker_image/

A really good tutorial focused on InSpec can be found here:

http://www.anniehedgie.com/inspec-basics-1

#### 9.9.19.1. First author an InSpec test

Back in the `development` vagrant at the root of the `helloworld-web` project, we'll initialize an InSpec profile to verify your container's compliance to policy and configuration guidance.  Yep, you're "gonna" be a security engineer. 

```bash
inspec init profile helloworld
```

Accept product license by entering 

```
yes
```

And the output from inpec will resemble

```
Persisting 1 product license...
✔ 1 product license persisted.

+---------------------------------------------+

 ─────────────────────────── InSpec Code Generator ───────────────────────────

Creating new profile at /home/vagrant/go/src/github.com/nemonik/helloworld-web/helloworld
 • Creating file inspec.yml
 • Creating file README.md
 • Creating directory controls
 • Creating file controls/example.rb
```

Then complete following

```bash
cd helloworld/controls
rm example.rb
```

Then author a simple Ruby-based tests to verify the expected state of the `nemonik/helloworld-web:latest` Docker container by creating `helloworld.rb` in an editor with this content:

```ruby
control 'docker-checks-1.1' do
  impact 0.7 # High Impact
  tag "nist": ['CM-6', 'Rev_4']
  title 'Verify Docker Container exists and is running'

  describe docker_container(name: 'helloworld-web') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq '192.168.0.10:5000/nemonik/helloworld-web' }
    its('ports') { should eq '0.0.0.0:3000->3000/tcp' }
    its('command') { should eq '/helloworld-web' }
  end
end
```

And then go up one directory

```bash
cd ..
```

And edit the profile's metadata file, `inspec.yml` replacing its contents with  the following:

```yaml
name: helloworld-tests
title: InSpec Profile
maintainer: Michael Joseph Walsh
copyright: Michael Joseph Walsh
copyright_email: walsh@nemonik.comm
license: New BSD License
summary: A minimal InSpec Compliance Profile for helloworld-web
version: 0.0.1
supports:
  platform: os
```

#### 9.9.19.2. Execute your test

First, we'll execute the test against container running locally by first spinning up a `192.168.0.10:5000/nemonik/helloworld-web:latest` container via

```bash
docker run -d -p 3000:3000 --name helloworld-web 192.168.0.10:5000/nemonik/helloworld-web:latest
```

If this command fails you likely already have a instance of the container running, you can kill the previous instance and try again

```
docker stop helloworld-web
docker rm helloworld-web
docker run -d -p 3000:3000 --name helloworld-web 192.168.0.10:5000/nemonik/helloworld-web:latest
```

And then in the root of your `helloworld-web` project

```bash
cd ..
```

run the inspec test

```bash
inspec exec helloworld
```

The output of InSpec test will resemble

```
Profile: InSpec Profile (helloworld-tests)
Version: 0.0.1
Target:  local://

  ✔  docker-checks-1.1: Verify Docker Container exists and is running
     ✔  Docker Container helloworld-web is expected to exist
     ✔  Docker Container helloworld-web is expected to be running
     ✔  Docker Container helloworld-web repo is expected to eq "192.168.0.10:5000/nemonik/helloworld-web"
     ✔  Docker Container helloworld-web ports is expected to eq "0.0.0.0:3000->3000/tcp"
     ✔  Docker Container helloworld-web command is expected to eq "/helloworld-web"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 5 successful, 0 failures, 0 skipped
```

***Note***

- If when running the test (i.e., `inspec exec helloworld`) you see a stack trace, check the contents of your `./helloworld/inspec.yml` file for any stray characters

  ```
  [vagrant@development helloworld-web]$ inspec exec helloworld
  Traceback (most recent call last):
    23: from /usr/bin/inspec:186:in `<main>'
    22: from /usr/bin/inspec:186:in `load'
    21: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-bin-4.16.0/bin/inspec:11:in `<top (required)>'
    20: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/base_cli.rb:33:in `start'
    19: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/thor-0.20.3/lib/thor/base.rb:466:in `start'
    18: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/thor-0.20.3/lib/thor.rb:387:in `dispatch'
    17: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/thor-0.20.3/lib/thor/invocation.rb:126:in `invoke_command'
    16: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/thor-0.20.3/lib/thor/command.rb:27:in `run'
    15: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/cli.rb:291:in `exec'
    14: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/cli.rb:291:in `each'
    13: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/cli.rb:291:in `block in exec'
    12: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/runner.rb:185:in `add_target'
    11: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/profile.rb:73:in `for_target'
    10: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/profile.rb:67:in `for_fetcher'
     9: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/profile.rb:60:in `for_path'
     8: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/profile.rb:60:in `new'
     7: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/profile.rb:134:in `initialize'
     6: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/input_registry.rb:302:in `block (2 levels) in <class:InputRegistry>'
     5: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/input_registry.rb:135:in `bind_profile_inputs'
     4: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/input_registry.rb:255:in `bind_inputs_from_metadata'
     3: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/input_registry.rb:255:in `each'
     2: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec/input_registry.rb:255:in `block in bind_inputs_from_metadata'
     1: from /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec input_registry.rb:262:in `handle_raw_input_from_metadata'
     /opt/inspec/embedded/lib/ruby/gems/2.6.0/gems/inspec-4.16.0/lib/inspec input_registry.rb:262:in `join': no implicit conversion of nil into String (TypeError)
   ``` 
- 
  ```bash
  docker rm -f helloworld-web
  ```
- If upon executing `inspec` it errors out with

  > Could not fetch inspec profile in "InSpec.Rb"

  Then you are not in the correct folder.  You need to be in the root of the `helloworld-web` directory of your project.

#### 9.9.19.3. Add InSpec to the pipeline

We really should have an InSpec container to execute this step.  Maybe I'll do this in the next revision of my class, but since InSpec is already installed on the `master` vagrant, we'll use `appleboy/drone-ssh` container to ssh into `master` and execute our InSpec profile from the pipeline.

In the `helloworld-web` project, edit `.drone.yml` and add the following step

```yaml
- name: inspec
  image: appleboy/drone-ssh
  settings:
    key:
      from_secret: insecure_private_key
    host: 192.168.0.10
    port: 22
    username: vagrant
    command_timeout: 5m
    script:
      - source /etc/profile
      - WORK_DIR=`mktemp -d`
      - cd $WORK_DIR
      - git clone http://192.168.0.202/root/helloworld-web.git
      - cd helloworld-web
      - inspec exec --chef-license=accept-silent helloworld
      - cd ..
      - rm -Rf $WORK_DIR
```

To execute your pipeline, push your changes to GitLab

```bash
git add .
git commit -m "added inspec step to pipeline"
git push origin master
```

The output of the `inspec` step of the pipeline will resemble

```
======CMD======
source /etc/profile
WORK_DIR=`mktemp -d`
cd $WORK_DIR
git clone http://192.168.0.202/root/helloworld-web.git
cd helloworld-web
inspec exec --chef-license=accept-silent helloworld
cd ..
rm -Rf $WORK_DIR
======END======
err: Cloning into 'helloworld-web'...
out: 
out: Profile: InSpec Profile (helloworld-tests)
out: Version: 0.0.1
out: Target:  local://
out: 
out:   ✔  docker-checks-1.1: Verify Docker Container exists and is running
out:      ✔  Docker Container helloworld-web is expected to exist
out:      ✔  Docker Container helloworld-web is expected to be running
out:      ✔  Docker Container helloworld-web repo is expected to eq "192.168.0.10:5000/nemonik/helloworld-web"
out:      ✔  Docker Container helloworld-web ports is expected to eq "0.0.0.0:3000->3000/tcp"
out:      ✔  Docker Container helloworld-web command is expected to eq "/helloworld-web"
out: 
out: 
out: Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
out: Test Summary: 5 successful, 0 failures, 0 skipped
==============================================
✅ Successfully executed commands to all host.
==============================================
```

#### 9.9.19.4. Viewing the results in Heimdall-lite

MITRE maintains two projects for viewing of InSpec profiles and evaluations in a convenient interface.

We'll use Heimdall-lite, a single page JavaScript implementation of the MITRE Heimdall InSpec results viewer, to view the results in security engineer friendly manner.

Restart the container

```bash
docker run -d -p 3000:3000 --name helloworld-web 192.168.0.10:5000/nemonik/helloworld-web:latest
```

In the `helloworld-web` project on the `development` vagrant, use `inspec` to write a report in JSON to `/vagrant/inspec_helloworld.json`
  
```bash
inspec exec --chef-license=accept-silent helloworld --reporter json > /vagrant/inspec_helloworld.json
```


Open Heimdall-lite https://mitre.github.io/heimdall-lite/, select `Load JSON`, the `Browse` to navigate to `inspec_helloworld.json` in the root of the class project and upload to view the results. 

Upon leaving this section, remember to stop your `helloworld-web` docker container via

```bash
docker rm -f helloworld-web
```

**NOTE**

- If upon executing `inspec` it errors out with

  > Could not fetch InSpec profile in "inspec.rb"

  Then you are not in the correct folder.  You need to be in the root of the `helloworld-web` directory of your project.

### 9.9.20. Add automated functional test to pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline" #FFFFFF
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline"
-left-> (*)
```

Although, functional testing, where a system is tested against the functional requirements, is by far the most expensive, most brittle and arguably least valuable in comparison to integration and unit testing, it still has its place in testing an application.

In this section, we're going to write an automated functional test for `helloworld-web` application instead of relying on a manual functional test.  Why?  Because the automated functional test can be repeatedly and reliably executed over and over.  The same can be said not be said for tests written in english to be processed and executed by humans.

We're going to write our functional tests in Selenium, a portable software-testing framework for web applications.  Essentially, Selenium automates web browsers.

More can be found here

http://www.seleniumhq.org/

You'll need a couple of shells open to your `development` vagrant to complete this section.

#### 9.9.20.1. Run the *helloworld-web* application

In the first `vagrant ssh development` enter

```bash
docker run -d -p 3000:3000 --name helloworld-web nemonik/helloworld-web:latest
```

**NOTE**

- If you don't mind running more than a couple shells you can drop the `-d` argument and not daemonize the container, so you can watch its log.

#### 9.9.20.2. Pull and run Selenium Firefox Standalone

In another `vagrant ssh` to `development` enter

```
curl --no-progress-meter -X GET http://192.168.0.10:5000/v2/nemonik/standalone-firefox/tags/list
```

the output will resemble

```
{"name":"nemonik/standalone-firefox","tags":["3.141"]}
```

This tell you tag `3.141` is available, so let us pull it

```
docker pull 192.168.0.10:5000/nemonik/standalone-firefox:3.141
```

It will retrieved rather quickly, because the image was built on the `development` box via the Ansible automation.

Then enter into the command line

```bash
docker run -p 4444:4444 --name standalone-firefox 192.168.0.10:5000/nemonik/standalone-firefox:3.141
```

This stands up Selenium specifically running Firefox.  The container is running in the foreground so we can watch the log output.

A good start outputs to the command line

```
[vagrant@development helloworld-web]$ docker run -p 4444:4444 192.168.0.10:5000/nemonik/standalone-firefox:3.141
2019-09-18 15:04:54,535 INFO Included extra file "/etc/supervisor/conf.d/selenium.conf" during parsing
2019-09-18 15:04:54,537 INFO supervisord started with pid 7
2019-09-18 15:04:55,540 INFO spawned: 'xvfb' with pid 10
2019-09-18 15:04:55,543 INFO spawned: 'selenium-standalone' with pid 11
15:04:55.831 INFO [GridLauncherV3.parse] - Selenium server version: 3.141.59, revision: e82be7d358
2019-09-18 15:04:55,834 INFO success: xvfb entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2019-09-18 15:04:55,834 INFO success: selenium-standalone entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
15:04:55.914 INFO [GridLauncherV3.lambda$buildLaunchers$3] - Launching a standalone Selenium Server on port 4444
2019-09-18 15:04:55.965:INFO::main: Logging initialized @388ms to org.seleniumhq.jetty9.util.log.StdErrLog
15:04:56.203 INFO [WebDriverServlet.<init>] - Initialising WebDriverServlet
15:04:56.296 INFO [SeleniumServer.boot] - Selenium Server is up and running on port 4444
```

#### 9.9.20.3. Create our test automation

In another terminal `vagrant ssh` to `development`, so we can author and run our automated test.  

In this other terminal, we'll create a folder to hold our automated functional test like so

```bash
cd ~/go/src/github.com/nemonik/helloworld-web
mkdir selenium-test
cd selenium-test
```

We're going to write our test in Python.  Python is already installed on the `development` vagrant. Ansible uses it.  

We'll need to install a dependency, we can install by entering into the command line

```bash
python -m pip install --user 'selenium==3.141'
```

The output of looks something like

```
Collecting selenium==3.141 (from -r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/80/d6/4294f0b4bce4de0abf13e17190289f9d0613b0a44e5dd6a7f5ca98459853/selenium-3.141.0-py2.py3-none-any.whl (904kB)
    100% |████████████████████████████████| 911kB 17.1MB/s
Collecting urllib3 (from selenium==3.141->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/e8/74/6e4f91745020f967d09332bb2b8b9b10090957334692eb88ea4afe91b77f/urllib3-1.25.8-py2.py3-none-any.whl (125kB)
    100% |████████████████████████████████| 133kB 22.1MB/s
Installing collected packages: urllib3, selenium
Successfully installed selenium-3.141.0 urllib3-1.25.8
```

But let's create a `requirements.txt` file to hold our dependency with our text editor containing

```python
selenium==3.141
```

This allow the test's dependencies to be enumerated in a file including the specific version of the dependency, so their installation can be automated.

Then test out the requirements.txt file by entering

```bash
python -m pip install --user -r requirements.txt
```

Since, you already installed the dependency the output will resemble

```
Requirement already satisfied: selenium==3.141 in /home/vagrant/.local/lib/python3.7/site-packages (from -r requirements.txt (line 1)) (3.141.0)
Requirement already satisfied: urllib3 in /home/vagrant/.local/lib/python3.7/site-packages (from selenium==3.141->-r requirements.txt (line 1)) (1.25.8)
```

Then in an editor create `test_helloworld.py` Python-based unit test containing

```python
# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

import unittest
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import sys
import os

class HelloworldWebTest(unittest.TestCase):

    def setUp(self):

        webdriver.DesiredCapabilities.FIREFOX['proxy'] = {
            "proxyType":"DIRECT"
#                "noProxy":"os.environ['no_proxy']," + selenium_host # Selenium cannot handle no_proxy
    }

        self.driver = webdriver.Remote(command_executor="http://" + selenium_host + ":4444/wd/hub", desired_capabilities=webdriver.DesiredCapabilities.FIREFOX)

    def test_helloworld_web(self):
        driver = self.driver
        driver.get(helloworld_web_url)
        assert "Hello world!" in driver.page_source

    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    if len(sys.argv) == 3:
        selenium_host = sys.argv[1]
        helloworld_web_url = sys.argv[2]
    else:
        print "python test_hello_world.py selenium_host helloworld_web_url"
        sys.exit()

    del sys.argv[1:]
    unittest.main()
```

Save the file and exit.

You might notice the commented out section about `Selenium cannot handle no_proxy.`  Yeah.  This will later present a problem.

For now, now let us run our test by entering into the command line

```bash
python test_helloworld.py 192.168.0.9 http://192.168.0.9:3000
```

Successful command line output in this window will be

```
[vagrant@development selenium-test]$ python test_helloworld.py 192.168.0.10 http://192.168.0.9:3000
.
----------------------------------------------------------------------
Ran 1 test in 4.905s

OK
```

The other windows will show logging.

The `standalone-firefox` container will output

```
23:21:42.793 INFO [ProtocolHandshake.createSession] - Detected dialect: W3C
23:21:42.800 INFO [RemoteSession$Factory.lambda$performHandshake$0] - Started new session d8a5c1ec-34cf-4998-aa35-c4c253ca51ce (org.openqa.selenium.firefox.GeckoDriverService)
1581463302958	Marionette	INFO	Stopped listening on port 42305
23:22:45.290 INFO [ActiveSessionFactory.apply] - Capabilities are: {
  "acceptInsecureCerts": true,
  "browserName": "firefox",
  "marionette": true,
  "proxy": {
    "proxyType": "direct"
  }
}
23:22:45.290 INFO [ActiveSessionFactory.lambda$apply$11] - Matched factory org.openqa.selenium.grid.session.remote.ServicedSession$Factory (provider: org.openqa.selenium.firefox.GeckoDriverService)
1581463365329	mozrunner::runner	INFO	Running command: "/usr/bin/firefox" "-marionette" "-foreground" "-no-remote" "-profile" "/tmp/rust_mozprofile9uYjUL"
1581463365698	addons.webextension.doh-rollout@mozilla.org	WARN	Loading extension 'doh-rollout@mozilla.org': Reading manifest: Invalid extension permission: networkStatus
1581463365824	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: mozillaAddons
1581463365824	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: telemetry
1581463365824	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: resource://pdf.js/
1581463365825	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: about:reader*
1581463367753	Marionette	INFO	Listening on port 41255
1581463367848	Marionette	WARN	TLS certificate errors will be ignored for this session
1581463367855	Marionette	INFO	Proxy settings initialised: {"proxyType":"direct"}
23:22:47.882 INFO [ProtocolHandshake.createSession] - Detected dialect: W3C
23:22:47.884 INFO [RemoteSession$Factory.lambda$performHandshake$0] - Started new session ec348da5-0270-410f-8338-4f6e7219b2e3 (org.openqa.selenium.firefox.GeckoDriverService)
1581463368050	Marionette	INFO	Stopped listening on port 41255
```

`ctrl-c` in the on shell running `nemonik/standalone-firefox` container to stop it and

```bash
docker rm -f helloworld-web
```

to kill your daemonized `helloword-web` container.

#### 9.9.20.4. Enable `Trusted` for the repository in Drone

This next Drone step will require you to change the configuration of your project in Drone, so that is trusted, thereby allowing the pipeline to access a shared memory via `/dev/shm` path.

Enable the Trusted setting for the repository in Drone by opening

1. http://192.168.0.10/root/helloworld-web/settings

2. Under `Main` and then `Project Settings` check off `Trusted`.

3. Leave the others to their defaults and click `SAVE` and look for Drone to float a modal at the bottom left denoting

   ```
   Successfully saved
   ```

   indicating success.

4. Then click the Drone icon in the upper left of the page to return home.

#### 9.9.20.5. Add a *selenium* step to the pipeline

In one of your existing `vagrant ssh` to `development` enter into the command line

```bash
cd ~/go/src/github.com/nemonik/helloworld-web
```

Edit the `.drone.yml` file at the root of your `helloworld-web` project and add the following `selenium` step, the `shared_memory` volume, and a `firefox` service.

```yaml
- name: selenium
  image: 192.168.0.10:5000/nemonik/python:2.7.17
  commands:
  - export NO_PROXY=$NO_PROXY,$(python selenium-test/resolve.py firefox)
  - export no_proxy=$no_proxy,$(python selenium-test/resolve.py firefox)
  - cd selenium-test
  - python -m pip install -r requirements.txt
  - python test_helloworld.py firefox http://192.168.0.10:3000

volumes:
- name: shared_memory
  host:
    path: /dev/shm

services:
- name: firefox
  image: 192.168.0.10:5000/nemonik/standalone-firefox:3.141
  volumes:
  - name: shared_memory
    path: /dev/shm
```

**NOTE**

- `services` is not part of the prior steps, because it is not a step, but enumeration of services, so be careful when you edit the pipeline.

Drone uses the `services:` section to spin up a patched version of `selenium/standalone-firefox:3.141` exposed with the name `firefox`.  This is where the problem creeps in that I mentioned earlier, where the `selenium` step will hit corporate proxy to resolve `firefox`.  We don't want that to happen, so the `selenium:` step will makes use of another Python script to resolved `firefox` service to its private IP and add it the `no_proxy` and `NO_PROXY` environmental variables, so that the Python selenium test code doesn't attempt to pass the request on to the corporate proxy and result in the test failing.  

Create in a text editor `selenium-test/resolve.py` with

```python
# !/usr/bin/env python

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

import socket, sys

if __name__ == "__main__":
    if len(sys.argv) == 2:
        print socket.gethostbyname( sys.argv[1] )
```

To execute your pipeline, push your changes to GitLab

```bash
cd ~/go/src/github.com/nemonik/helloworld-web
git add .
git commit -m "added selenium step to pipeline"
git push origin master
```

Open on your host  

http://192.168.0.10/root/helloworld-web

And monitor the progress of the build. The pipeline should execute in a few minutes.

The selenium service will start up like so outputting

```
2020-02-11 23:27:23,409 INFO Included extra file "/etc/supervisor/conf.d/selenium.conf" during parsing
2020-02-11 23:27:23,411 INFO supervisord started with pid 8
2020-02-11 23:27:24,414 INFO spawned: 'xvfb' with pid 11
2020-02-11 23:27:24,417 INFO spawned: 'selenium-standalone' with pid 12
23:27:24.711 INFO [GridLauncherV3.parse] - Selenium server version: 3.141.59, revision: e82be7d358
2020-02-11 23:27:24,714 INFO success: xvfb entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2020-02-11 23:27:24,714 INFO success: selenium-standalone entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
23:27:24.835 INFO [GridLauncherV3.lambda$buildLaunchers$3] - Launching a standalone Selenium Server on port 4444
2020-02-11 23:27:24.897:INFO::main: Logging initialized @455ms to org.seleniumhq.jetty9.util.log.StdErrLog
23:27:25.304 INFO [WebDriverServlet.<init>] - Initialising WebDriverServlet
23:27:25.445 INFO [SeleniumServer.boot] - Selenium Server is up and running on port 4444
```

While successful output for the `selenium` stage will resemble

```
+ export NO_PROXY=$NO_PROXY,$(python selenium-test/resolve.py firefox)
+ export no_proxy=$no_proxy,$(python selenium-test/resolve.py firefox)
+ cd selenium-test
+ python -m pip install -r requirements.txt
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 is no longer maintained. A future version of pip will drop support for Python 2.7. More details about Python 2 support in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support
Collecting selenium==3.141
  Downloading selenium-3.141.0-py2.py3-none-any.whl (904 kB)
Collecting urllib3
  Downloading urllib3-1.25.8-py2.py3-none-any.whl (125 kB)
Installing collected packages: urllib3, selenium
Successfully installed selenium-3.141.0 urllib3-1.25.8
+ python test_helloworld.py firefox http://192.168.0.10:3000
.
----------------------------------------------------------------------
Ran 1 test in 7.519s

OK
```

The "DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. " notices are telling me I need to move to python 3.  We can ignore those for now... It just means I have some work to do.

If you click on the `firefox` service for this build, you will see similar output as the pre-flight you executed on `development`

```
23:29:28.276 INFO [ActiveSessionFactory.apply] - Capabilities are: {
  "acceptInsecureCerts": true,
  "browserName": "firefox",
  "marionette": true,
  "proxy": {
    "proxyType": "direct"
  }
}
23:29:28.278 INFO [ActiveSessionFactory.lambda$apply$11] - Matched factory org.openqa.selenium.grid.session.remote.ServicedSession$Factory (provider: org.openqa.selenium.firefox.GeckoDriverService)
1581463768764	mozrunner::runner	INFO	Running command: "/usr/bin/firefox" "-marionette" "-foreground" "-no-remote" "-profile" "/tmp/rust_mozprofileq7yYFT"
1581463769733	addons.webextension.doh-rollout@mozilla.org	WARN	Loading extension 'doh-rollout@mozilla.org': Reading manifest: Invalid extension permission: networkStatus
1581463769979	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: mozillaAddons
1581463769984	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: telemetry
1581463769984	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: resource://pdf.js/
1581463769984	addons.webextension.screenshots@mozilla.org	WARN	Loading extension 'screenshots@mozilla.org': Reading manifest: Invalid extension permission: about:reader*
1581463772348	Marionette	INFO	Listening on port 44727
1581463772390	Marionette	WARN	TLS certificate errors will be ignored for this session
1581463772400	Marionette	INFO	Proxy settings initialised: {"proxyType":"direct"}
23:29:32.479 INFO [ProtocolHandshake.createSession] - Detected dialect: W3C
23:29:32.519 INFO [RemoteSession$Factory.lambda$performHandshake$0] - Started new session 7e57655d-8384-443b-a5f2-386cd03f9be2 (org.openqa.selenium.firefox.GeckoDriverService)
1581463772778	Marionette	INFO	Stopped listening on port 44727
```

**NOTE**

- If your build fails outright with the message `default: linter: untrusted repositories cannot mount host volumes`, you have forgotten the enable `Trusted` for the repository in Drone.  You can go back do that and `RESTART` the build.

### 9.9.21. Add DAST step (*OWASP ZAP*) to pipeline

```plantuml
skinparam shadowing false

skinparam title {
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 30
}

skinparam activity {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityDiamond {
  BorderColor #0B5C92
  BackgroundColor #e0e59a
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

skinparam activityStart {
  Color #0B5C92
}

skinparam activityEnd {
  Color #0B5C92
}

skinparam arrow {
  Color #0B5C92
}

skinparam note {
  BorderColor #0B5C92
  BackgroundColor #FEFECE
  FontName "Yanone Kaffeesatz"
  FontStyle "Thin"
  FontSize 15
}

(*) -right->”Create\nthe project's\nbacklog”
-right->"Create\nthe project\nin GitLab"
-right->"Setup the project\nin the development\nVagrant"
-right->"Author\nthe application"
-right->"Build and run\nthe application"
-right->"Run gometalinter.v2\non application"
-down->"Fix\nthe application"
-left->"Author\nunit tests"
-left->"Perform\nstatic analysis\non the CLI"
-left->"Write\nthe Makefile"
-left->"Dockerize\nthe application"
-left->"Run the\nDocker container"
-down->"Push the container\nimage to the\nprivate registry"
-right->"Configure Drone\nto execute\nthe CICD pipeline"
-right->"Add\nStatic Analysis\n(SonarQube)\nstep to pipeline"
-right->"Add build step\nto pipeline"
-right->"Add container\nimage publish\nstep to pipeline"
-right->"Add container\ndeploy step\nto pipeline"
-down->"Add\ncomplaince automation\ntest (InSpec)\nstep to pipeline"
-left->"Add automated\nfuntional test\n(Selenium)\nto pipeline"
-left->"Add DAST step\n(OWASP ZAP)\nto the pipeline" #FFFFFF
-left-> (*)
```

Dynamic application security testing (DAST) is used to detect security vulnerabilities in an application while it is running, so as to help you remediate these concerns while in development.  Again, yet another example of "thinking about application and infrastructure security from the start."

The OWASP Zed Attack Proxy (ZAP) is one of the world’s most popular free DAST tools actively maintained by hundreds of international volunteers, so add a step to test the application.

First we'll exercise ZAP locally opening `vagrant ssh` to `development`.

At the root of the project, we need to query our Docker registry to determine what `zap2docker` container is available, we'll do this using `curl`

```bash
[vagrant@development helloworld-web]$ curl --no-progress-meter -X GET http://192.168.0.10:5000/v2/nemonik/zap2docker-stable/tags/list
{"name":"nemonik/zap2docker-stable","tags":["2.8.0--no-progress-meter"]}
```

We see have version `2.8.0` available, so will pull and run this tagged container inspecting the `nemonik/helloworld-web` container we deployed to the `master` vagrant in the prior section vice spinning up an instance on `development`. 

```
docker pull 192.168.0.10:5000/nemonik/zap2docker-stable:2.8.0
docker run 192.168.0.10:5000/nemonik/zap2docker-stable:2.8.0 zap-baseline.py -t http://192.168.0.10:3000
```

OWASP ZAP will take some time to run as it works to find security vulnerabilities in our running application, so give it time.

When finished its output will resemble

```
2020-02-11 23:33:30,259 Params: ['zap-x.sh', '-daemon', '-port', '46953', '-host', '0.0.0.0', '-config', 'api.disablekey=true', '-config', 'api.addrs.addr.name=.*', '-config', 'api.addrs.addr.regex=true', '-config', 'spider.maxDuration=1', '-addonupdate', '-addoninstall', 'pscanrulesBeta']
Feb 11, 2020 11:33:34 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
Total of 3 URLs
PASS: Cookie No HttpOnly Flag [10010]
PASS: Cookie Without Secure Flag [10011]
PASS: Incomplete or No Cache-control and Pragma HTTP Header Set [10015]
PASS: Web Browser XSS Protection Not Enabled [10016]
PASS: Cross-Domain JavaScript Source File Inclusion [10017]
PASS: Content-Type Header Missing [10019]
PASS: X-Frame-Options Header Scanner [10020]
PASS: Information Disclosure - Debug Error Messages [10023]
PASS: Information Disclosure - Sensitive Information in URL [10024]
PASS: Information Disclosure - Sensitive Information in HTTP Referrer Header [10025]
PASS: HTTP Parameter Override [10026]
PASS: Information Disclosure - Suspicious Comments [10027]
PASS: Open Redirect [10028]
PASS: Cookie Poisoning [10029]
PASS: User Controllable Charset [10030]
PASS: User Controllable HTML Element Attribute (Potential XSS) [10031]
PASS: Viewstate Scanner [10032]
PASS: Directory Browsing [10033]
PASS: Heartbleed OpenSSL Vulnerability (Indicative) [10034]
PASS: Strict-Transport-Security Header Scanner [10035]
PASS: HTTP Server Response Header Scanner [10036]
PASS: Server Leaks Information via "X-Powered-By" HTTP Response Header Field(s) [10037]
PASS: Content Security Policy (CSP) Header Not Set [10038]
PASS: X-Backend-Server Header Information Leak [10039]
PASS: Secure Pages Include Mixed Content [10040]
PASS: HTTP to HTTPS Insecure Transition in Form Post [10041]
PASS: HTTPS to HTTP Insecure Transition in Form Post [10042]
PASS: User Controllable JavaScript Event (XSS) [10043]
PASS: Big Redirect Detected (Potential Sensitive Information Leak) [10044]
PASS: Retrieved from Cache [10050]
PASS: X-ChromeLogger-Data (XCOLD) Header Information Leak [10052]
PASS: Cookie Without SameSite Attribute [10054]
PASS: CSP Scanner [10055]
PASS: X-Debug-Token Information Leak [10056]
PASS: Username Hash Found [10057]
PASS: X-AspNet-Version Response Header Scanner [10061]
PASS: PII Scanner [10062]
PASS: Timestamp Disclosure [10096]
PASS: Hash Disclosure [10097]
PASS: Cross-Domain Misconfiguration [10098]
PASS: Weak Authentication Method [10105]
PASS: Reverse Tabnabbing [10108]
PASS: Absence of Anti-CSRF Tokens [10202]
PASS: Private IP Disclosure [2]
PASS: Session ID in URL Rewrite [3]
PASS: Script Passive Scan Rules [50001]
PASS: Insecure JSF ViewState [90001]
PASS: Charset Mismatch [90011]
PASS: Application Error Disclosure [90022]
PASS: Loosely Scoped Cookie [90033]
WARN-NEW: X-Content-Type-Options Header Missing [10021] x 4
	http://192.168.0.10:3000/
	http://192.168.0.10:3000/robots.txt
	http://192.168.0.10:3000/sitemap.xml
	http://192.168.0.10:3000
FAIL-NEW: 0	FAIL-INPROG: 0	WARN-NEW: 1	WARN-INPROG: 0	INFO: 0	IGNORE: 0	PASS: 50
```

Its only gripe is to warn that our application doesn't return a *X-Content-Type-Options Header*.

Great, now lets add another step to our pipeline after the `selenium` step, but before `volumes:` block.

```yaml
- name: owasp-zaproxy
  image: 192.168.0.10:5000/nemonik/zap2docker-stable:2.8.0
  commands:
  - zap-baseline.py -t http://192.168.0.10:3000 || true
```

**NOTE**

- Again, add this new step right after the last above `volumes:`.

To execute your pipeline, push your changes to GitLab

```bash
git add .
git commit -m "added owasp-zaproxy step to pipeline"
git push origin master
```

Open on your host  

http://192.168.0.10/root/helloworld-web

And monitor the progress of the build. The pipeline should execute in a few minutes.

Successful output for this stage resembles the prior output

```
+ zap-baseline.py -t http://192.168.0.10:3000 || true
2020-02-11 23:44:11,411 Params: ['zap-x.sh', '-daemon', '-port', '59012', '-host', '0.0.0.0', '-config', 'api.disablekey=true', '-config', 'api.addrs.addr.name=.*', '-config', 'api.addrs.addr.regex=true', '-config', 'spider.maxDuration=1', '-addonupdate', '-addoninstall', 'pscanrulesBeta']
Feb 11, 2020 11:44:15 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
Total of 3 URLs
PASS: Cookie No HttpOnly Flag [10010]
PASS: Cookie Without Secure Flag [10011]
PASS: Incomplete or No Cache-control and Pragma HTTP Header Set [10015]
PASS: Web Browser XSS Protection Not Enabled [10016]
PASS: Cross-Domain JavaScript Source File Inclusion [10017]
PASS: Content-Type Header Missing [10019]
PASS: X-Frame-Options Header Scanner [10020]
PASS: Information Disclosure - Debug Error Messages [10023]
PASS: Information Disclosure - Sensitive Information in URL [10024]
PASS: Information Disclosure - Sensitive Information in HTTP Referrer Header [10025]
PASS: HTTP Parameter Override [10026]
PASS: Information Disclosure - Suspicious Comments [10027]
PASS: Open Redirect [10028]
PASS: Cookie Poisoning [10029]
PASS: User Controllable Charset [10030]
PASS: User Controllable HTML Element Attribute (Potential XSS) [10031]
PASS: Viewstate Scanner [10032]
PASS: Directory Browsing [10033]
PASS: Heartbleed OpenSSL Vulnerability (Indicative) [10034]
PASS: Strict-Transport-Security Header Scanner [10035]
PASS: HTTP Server Response Header Scanner [10036]
PASS: Server Leaks Information via "X-Powered-By" HTTP Response Header Field(s) [10037]
PASS: Content Security Policy (CSP) Header Not Set [10038]
PASS: X-Backend-Server Header Information Leak [10039]
PASS: Secure Pages Include Mixed Content [10040]
PASS: HTTP to HTTPS Insecure Transition in Form Post [10041]
PASS: HTTPS to HTTP Insecure Transition in Form Post [10042]
PASS: User Controllable JavaScript Event (XSS) [10043]
PASS: Big Redirect Detected (Potential Sensitive Information Leak) [10044]
PASS: Retrieved from Cache [10050]
PASS: X-ChromeLogger-Data (XCOLD) Header Information Leak [10052]
PASS: Cookie Without SameSite Attribute [10054]
PASS: CSP Scanner [10055]
PASS: X-Debug-Token Information Leak [10056]
PASS: Username Hash Found [10057]
PASS: X-AspNet-Version Response Header Scanner [10061]
PASS: PII Scanner [10062]
PASS: Timestamp Disclosure [10096]
PASS: Hash Disclosure [10097]
PASS: Cross-Domain Misconfiguration [10098]
PASS: Weak Authentication Method [10105]
PASS: Reverse Tabnabbing [10108]
PASS: Absence of Anti-CSRF Tokens [10202]
PASS: Private IP Disclosure [2]
PASS: Session ID in URL Rewrite [3]
PASS: Script Passive Scan Rules [50001]
PASS: Insecure JSF ViewState [90001]
PASS: Charset Mismatch [90011]
PASS: Application Error Disclosure [90022]
PASS: Loosely Scoped Cookie [90033]
WARN-NEW: X-Content-Type-Options Header Missing [10021] x 4 
	http://192.168.0.10:3000/
	http://192.168.0.10:3000/robots.txt
	http://192.168.0.10:3000
	http://192.168.0.10:3000/sitemap.xml
FAIL-NEW: 0	FAIL-INPROG: 0	WARN-NEW: 1	WARN-INPROG: 0	INFO: 0	IGNORE: 0	PASS: 50
```

Our application is relatively simple, so it was doubtful anything would be found, but there again is the warning about an *X-Content-Type-Options Header* being missing that could be resolved by adding additional handlers to the helloworld-web's main.go.

### 9.9.22. All the source for *helloworld-web*

The `helloworld-web` project can be viewed completed at

<https://github.com/nemonik/helloworld-web>

## 9.10. Additional best practices to consider around securing containerized applications

This class doesn't cover a number of container application development best practices.  A topic out of scope of the original intention of this course; especially, as I'm already cramming in several days of course material into a one-day course when taught in person, but perhaps subsequent course updates I'll cover a few of the following not already covered in the course material as additional topics. The biggest reason why relates with the followin sections. Agile and DevOps both exist to deliver features into the hands of users. We're not doing DevOps to do DevOps. If all anyone talks about is DevOps in the absense of the application life cycle you have a problem.  Also, DevOps is very much intertwined with modern cloud-native development this is the reason for the folloiwing sections. 

Wth that, here's some best practices for containerized application development and operation:

1. Follow https://docs.docker.com/develop/develop-images/dockerfile_best-practices/ and http://www.projectatomic.io/docs/docker-image-author-guidance/ guidance.
2. Re-use existing upstream images from trusted sources.  
   
   For an example, see my taiga Dockerfile [ansible/roles/taiga/templates/Dockerfile.j2](ansible/roles/taiga/templates/Dockerfile.j2) on line 1 where I base my container image on the `python:3.6` container image. (The link may only when the readme is rendered in GitHub.)
3. Avoid multiple processes executing in your own container images.  

   My taiga image breaks with this guidance in running Nginx and django, but Ngninx is managed as service in the container. See line 50 - 54 of [ansible/roles/taiga/files/docker-entrypoint.sh](ansible/roles/taiga/files/docker-entrypoint.sh).
4. Clean temporary files, such as, OS package repository caches, when creating your images.

   For an example, see my taiga Dockerfile [ansible/roles/taiga/templates/Dockerfile.j2](ansible/roles/taiga/templates/Dockerfile.j2) on line 22 where I `apt clean`.
5. Avoid running the container’s process as root. 

   See my taiga Dockerfile [ansible/roles/taiga/templates/Dockerfile.j2](ansible/roles/taiga/templates/Dockerfile.j2) lines 79 - 80 and 96 - 102. 

   That said, a number of containers don’t come this way and would require your time to refactor resulting in something you’ve forked and now must carry applying upstream changess unless you can convince upstream to go your way.  Also, some extenrnal applications rely on a container running at root.  Drone CI for one wants the containers you orchestrate your pipelines with to run as root. Jenkins container slaves are likely the same way, but I need to verify.
6. Harden your Docker configuration as per an InSpec compliance profile, such as https://github.com/mitre/docker-ce-cis-baseline and https://github.com/dev-sec/cis-docker-benchmark or if you are using another container runtime either find one for the runtime or write your own compliance profile.
7. Doing item-6 will require you to make use of a notary (https://github.com/theupdateframework/notary) and private Docker registry (e.g., https://hub.docker.com/_/registry, https://hub.docker.com/r/sonatype/nexus3). I’ve written Ansible IaC to deploy Notary and it was a real pain in the butt to figure it out and took my countless hours, because the documentation is to put it plainly, "Sh!t." It would seem, they (i.e., whoever owns Docker Enterprise now) wants you to use Docker Enterprise vice getting Notary up and running with Docker CE.
8. Put your application development through a CICD pipeline like this class of the following that applies: code format enforcement, linting, static analysis, build automation, unit testing, compliance-as-code for the container image, automated functional test, and dynamic analysis.
9. Consider adding to your CICD pipelines the exeuction of vulnerability scanning tools, such as, [Clair](https://coreos.com/clair/docs/latest/), [Docker Bench for Security](https://github.com/docker/docker-bench-security), [OpenSCAP Workbench](https://github.com/OpenSCAP/scap-workbench/releases), [Anchore](https://anchore.com/opensource/), et cetera.  There will be overlap between these and other similar tools.  Pick the ones that work the best for you, ones with frequent updates and having the largest vibrant community around.

## 9.11. Microservices

So, you may not realize it, but with the `helloworld-web` application what you've actually written is a microservice.

What's a microservice?

- Individually, microservices perform a single function (i.e., a single business capability or feature).  In our case, our application's single function is to return, "Hello world!\n"
- Communicate with other services via well-defined APIs.
- Can be written using different frameworks and programming languages.
- Can be deployed independently or as a group.

The benefit

- Traditional monolithic architectures don’t lend themselves to cloud deployments.
  - Nor do they scale.
  - They’re simply not “cloud-native.” (More on that word later.)
- In monolithic architectures, if a single feature experiences significant demand, the entire architecture must be scaled.
- In microservice architecture each feature runs as a separate service within its own container.
- Thereby, permitting each service to be scaled and maintained independently.
- Providing crash isolation, so if a single piece of your service is crashing, then the rest of your application continues to work.
- Providing isolation for security (Again more security thought.), so a compromise of one service only gains the adversary access to the resources of that single service.
- Providing independent scaling, so each microservice’s compute utilization can be independently scaled up and down.
- Increasing development velocity and lowering development risks thereby permitting teams to build faster in comparison to monolithic development.

So, with the `helloworld-web` application, you've developed a microservice, packaged it into a container (i.e., containerized it), and by doing so essentially created a cloud-native application.

In this era of cloud computing, DevOps and cloud-native application development are heavily intertwined.

### 9.11.1. What's cloud-native?

Cloud-native computing deploys applications as microservices - packaging each into its own container - and by doing so you have opened yourself up to the capability of being able to dynamically orchestrate the microservice to optimize resource utilization, elastic scaling, security isolation...  

### 9.11.2. Let's create a microservice

We can use our `helloworld-web` application with a few tweaks to create a microservice.

Granted our tiny, insignificant microservice won't do do much, but we can get a peak at the possibilities.

So, let's experiment with our little "microservice".

#### 9.11.2.1. Modify the helloworld-web application

In the `helloworld-web` project on the `development` vagrant edit the `go/src/github.com/nemonik/helloworld-web/main.go` to contain the following

```go
package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

var hostname string

func main() {
	hostname, _ = os.Hostname()
	http.HandleFunc("/", handler)
	fmt.Print("listening on :3000\n")
	log.Fatal(http.ListenAndServe(":3000", logRequest(http.DefaultServeMux)))
}

func handler(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "Hello world! %s\n", hostname)
	if err != nil {
		log.Fatal(err)
	}
}

func logRequest(handler http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Printf("%s  %s  %s\n", r.RemoteAddr, r.Method, r.URL)
		handler.ServeHTTP(w, r)
	})
}
```

Changes made:
- Added `os` package.
- Added the `hostname` global variable.
- Set `hostname` global in `main()`.
- Append `hostname` to output of the `handler`.

Why these changes were made will become apparent.

Build the container and push to the registry

```bash
make docker-push
```

#### 9.11.2.2. Create a Kubernetes manifest for the microservice

At the root of the `hellworld-web` application create a new file, a Kubernetes resource file for our application named `helloworld.yml` and add to it the following content

```yaml
---

apiVersion: v1
kind: Namespace
metadata:
  name: helloworld

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld-deployment
  namespace: helloworld
  labels:
    app: helloworld
spec:
  replicas: 1
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld-container
        image: 192.168.0.10:5000/nemonik/helloworld-web:latest
        imagePullPolicy: Always
        ports:
        - name: http
          containerPort: 3000

---

apiVersion: v1
kind: Service
metadata:
  name: helloworld-service
  namespace: helloworld
spec:
  ports:
  - name: http
    targetPort: http
    port: 80
  selector:
    app: helloworld

---

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: helloworld-ingress
  namespace: helloworld
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - http:
      paths:
      - path: /helloworld
        backend:
          serviceName: helloworld-service
          servicePort: http
```

This resource file is a collection of resource manifests used to deploy your `helloworld-web` container, exposed it via a service, and register the service with the Traefik reverse proxy via an ingress.

The first resource defines a `Namespace`

```yaml
---

apiVersion: v1
kind: Namespace
metadata:
  name: helloworld
```      

for our `helloworld` application.  A namespace is used to provide application scope.

To query for the current namespaces in the cluster perform the following

```bash
kubectl get namespace
```

whose output will resemble

```
[vagrant@development helloworld-web]$ kubectl get namespace
NAME                 STATUS   AGE
default              Active   42h
kube-system          Active   42h
kube-public          Active   42h
kube-node-lease      Active   42h
local-path-storage   Active   42h
registry             Active   42h
taiga                Active   42h
gitlab               Active   42h
plantuml-server      Active   42h
sonarqube            Active   42h
```

The next resource manifest is the `Deployment`

```yaml
---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld-deployment
  namespace: helloworld
  labels:
    app: helloworld
spec:
  replicas: 1
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld-container
        image: 192.168.0.10:5000/nemonik/helloworld-web:latest
        imagePullPolicy: Always
        ports:
        - name: http
          containerPort: 3000
```

A `Deployment` is used to define the desired state of our `helloworld` application. 

`imagePullPolicy` being set to `Always` is needed otherwise Docker will use the prior pulled image, if it exists.

To query the cluster for all the `Deployment`s type

```bash
kubectl get deployment --all-namespaces
```

And its output will resemble.  Almost every tool is being managed via Kubernetes with the exception of Drone CI.

```
[vagrant@development helloworld-web]$ kubectl get deployment --all-namespaces
NAMESPACE            NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
kube-system          traefik                  1/1     1            1           42h
kube-system          kubernetes-dashboard     1/1     1            1           42h
kube-system          coredns                  1/1     1            1           42h
registry             registry                 1/1     1            1           42h
taiga                postgresql               1/1     1            1           42h
taiga                taiga                    1/1     1            1           42h
gitlab               redis                    1/1     1            1           42h
gitlab               postgresql               1/1     1            1           42h
gitlab               gitlab                   1/1     1            1           42h
plantuml-server      plantuml-server          1/1     1            1           42h
sonarqube            postgresql               1/1     1            1           42h
sonarqube            sonarqube                1/1     1            1           42h
local-path-storage   local-path-provisioner   1/1     1            1           42h
```

A `Deployment` results in `Pod`, a group of containers being deployed together.

To list the `Pod`s in the cluster

```bash
kubectl get pod --all-namespaces
```

whose output will resemble

```
[vagrant@development helloworld-web]$ kubectl get pod --all-namespaces
NAMESPACE            NAME                                     READY   STATUS    RESTARTS   AGE
kube-system          traefik-66f759c696-ql7hq                 1/1     Running   0          42h
kube-system          kubernetes-dashboard-7d75c474bb-w5gx7    1/1     Running   0          42h
kube-system          coredns-66f496764-br445                  1/1     Running   0          42h
kube-system          svclb-traefik-6w9sk                      1/1     Running   0          42h
registry             svclb-registry-qc7w8                     1/1     Running   0          42h
kube-system          svclb-traefik-web-ui-cmvb9               1/1     Running   0          42h
registry             registry-779f7b957b-9fhhd                1/1     Running   0          42h
taiga                svclb-taiga-hzwk8                        1/1     Running   0          42h
taiga                postgresql-55867bd4cc-ntskp              1/1     Running   0          42h
taiga                taiga-c7cddb697-p2ltv                    1/1     Running   0          42h
gitlab               svclb-gitlab-z6j4v                       2/2     Running   0          42h
gitlab               redis-9bc4f4f77-plbmt                    1/1     Running   0          42h
gitlab               postgresql-57694695f-mxrkk               1/1     Running   0          42h
gitlab               gitlab-fd84dc8dd-lghpn                   1/1     Running   0          42h
plantuml-server      svclb-plantuml-server-z7wwj              1/1     Running   0          42h
plantuml-server      plantuml-server-54df8b596d-5whns         1/1     Running   0          42h
sonarqube            svclb-sonarqube-ls24f                    1/1     Running   0          42h
sonarqube            postgresql-f557c84d8-7tptv               1/1     Running   0          42h
sonarqube            sonarqube-5dfbc585cc-rzfjn               1/1     Running   0          42h
kube-system          svclb-traefik-5p8pb                      1/1     Running   0          41h
sonarqube            svclb-sonarqube-clqcb                    1/1     Running   0          41h
kube-system          svclb-traefik-web-ui-w72s9               1/1     Running   0          41h
registry             svclb-registry-dcffd                     1/1     Running   0          41h
gitlab               svclb-gitlab-58ldz                       2/2     Running   0          41h
taiga                svclb-taiga-9n7b6                        1/1     Running   0          41h
plantuml-server      svclb-plantuml-server-hpk5b              1/1     Running   0          41h
local-path-storage   local-path-provisioner-ccbdd96dc-cgq6r   1/1     Running   1          42h
```

The next resource defines a `Service` used to expose our `helloworld` application as a network service.

```yaml
---

apiVersion: v1
kind: Service
metadata:
  name: helloworld-service
  namespace: helloworld
spec:
  ports:
  - name: http
    targetPort: http
    port: 80
  selector:
    app: helloworld
```

Which we could expose externally on a port, but in this case we've exposed externally through the Traefik reverse proxy via defining an `Ingress`

```yaml
---

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: helloworld-ingress
  namespace: helloworld
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - http:
      paths:
      - path: /helloworld
        backend:
          serviceName: helloworld-service
          servicePort: http
```

An `Ingress` gives `Service`s externally-reachable URLs, load balance traffic...  We are exposing our service via Traefik at http://192.168.0.206/helloworld.

Once our application is deployed to the cluster, Traefik's dashboard will permit a view into how it is handling things at http://192.168.0.206:8080/dashboard/

#### 9.11.2.3. Deploy your application

To deploy our application to the cluster, on the `development` vagrant enter

```bash
kubectl apply -f helloworld.yml
```

Whose output will resemble

```
[vagrant@development helloworld-web]$ kubectl apply -f helloworld.yml
namespace/helloworld created
deployment.apps/helloworld-deployment created
service/helloworld-service created
ingress.extensions/helloworld-ingress created
```

To monitor progress enter into the command-line

```bash
kubectl --namespace=helloworld get all
```

Whose output will resemble

```
[vagrant@development helloworld-web]$ kubectl --namespace=helloworld get all
NAME                                        READY   STATUS    RESTARTS   AGE
pod/helloworld-deployment-f767b5b57-4tg62   1/1     Running   0          67s


NAME                         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/helloworld-service   ClusterIP   10.43.171.227   <none>        80/TCP    67s

NAME                                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/helloworld-deployment   1/1     1            1           67s

NAME                                              DESIRED   CURRENT   READY   AGE
replicaset.apps/helloworld-deployment-f767b5b57   1         1         1       67s
```

I often prepend the command with `watch` to monitor progress

```bash
watch kubectl --namespace=helloworld get all
```

What you see above is the cluster is managing 1 pod of the `192.168.0.10:5000/nemonik/helloworld-web:latest` container.

You can retrieve more information about this pod with 

```bash
kubectl --namespace=helloworld get pods -o wide
```

Whose output will resemble.  

```
[vagrant@development helloworld-web]$ kubectl --namespace=helloworld get pods -o wide
NAME                                    READY   STATUS    RESTARTS   AGE     IP           NODE        NOMINATED NODE   READINESS GATES
helloworld-deployment-f767b5b57-4tg62   1/1     Running   0          4m52s   10.42.0.58   toolchain   <none>           <none>
```

One `service` is being manage and `replicatset` is maintaining the specified 1 pod at any given time.

#### 9.11.2.4. Test your microservice

Now test your microservice

```
curl --no-progress-meter http://192.168.0.206/helloworld
```

The output will look like

```
Hello world! helloworld-deployment-cf4667475-pqhk4
```

That random hex number is the result of our code change.  It is the host name of the container that responded to your request.

#### 9.11.2.5. Scale your microservice

Now, let's scale our application.  Open the Traefik Dashboard

<http://192.168.0.206:8080/dashboard/>

Traefik is an open-source reverse proxy and load balancer for HTTP and TCP-based applications.  You'll see one `/helloworld` front-end and one `/helloworld` back-end.

Leave the browser open to the Traefik Dashboard to watch it add back-end instances.

Let's scale from 1 to 4 replicas, while keeping an eye on the Traefik Dashboard, via

```bash
kubectl scale --namespace=helloworld --replicas=4 deployment.apps/helloworld-deployment
```

whose output will resemble

```
helloworld-deployment
deployment.apps/helloworld-deployment scaled
```

And you'll see additional back-ends come into service in the Traefik Dashboard.

Re-running 

```bash
kubectl --namespace=helloworld get all
```

will also return output resembling

```
NAME                                        READY   STATUS    RESTARTS   AGE
pod/helloworld-deployment-cf4667475-5d77b   1/1     Running   0          16m
pod/helloworld-deployment-cf4667475-755jr   1/1     Running   0          100s
pod/helloworld-deployment-cf4667475-jh2hz   1/1     Running   0          100s
pod/helloworld-deployment-cf4667475-vvhqn   1/1     Running   0          16m

NAME                         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/helloworld-service   ClusterIP   10.43.231.201   <none>        80/TCP    16m

NAME                                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/helloworld-deployment   4/4     4            4           16m

NAME                                              DESIRED   CURRENT   READY   AGE
replicaset.apps/helloworld-deployment-cf4667475   4         4         4       16m
```

And running 

```bash
kubectl --namespace=helloworld get pods -o wide
```

May show you, at least in this case, that Pods are spread across the cluster like so

```
NAME                                     READY   STATUS    RESTARTS   AGE     IP           NODE          NOMINATED NODE   READINESS GATES
helloworld-deployment-6879449688-5d4ls   1/1     Running   0          2m35s   10.42.0.32   toolchain     <none>           <none>
helloworld-deployment-6879449688-vj65k   1/1     Running   0          32s     10.42.1.10   development   <none>           <none>
helloworld-deployment-6879449688-cq55w   1/1     Running   0          32s     10.42.0.33   toolchain     <none>           <none>
helloworld-deployment-6879449688-26xsv   1/1     Running   0          32s     10.42.0.34   toolchain     <none>           <none>
```

It usually is immaterial where in the cluster a Pod is running, but the point here is to show you that the replicas are spread across the cluster thereby increasing the application's availability. 

So, the cluster is now running 4 replicas.  Let's explore the ramifications of this by running `curl` hitting the Traefik ingress several times in a row via

```bash
for i in {1..10}
do
curl --no-progress-meter http://192.168.0.206/helloworld
done
```

The output will resemble 

```
Hello world! helloworld-deployment-cf4667475-vvhqn
Hello world! helloworld-deployment-cf4667475-5d77b
Hello world! helloworld-deployment-cf4667475-755jr
Hello world! helloworld-deployment-cf4667475-jh2hz
Hello world! helloworld-deployment-cf4667475-vvhqn
Hello world! helloworld-deployment-cf4667475-5d77b
Hello world! helloworld-deployment-cf4667475-755jr
Hello world! helloworld-deployment-cf4667475-jh2hz
Hello world! helloworld-deployment-cf4667475-vvhqn
Hello world! helloworld-deployment-cf4667475-5d77b
```

Notice how the `curl` requests are round-robin load balanced across the replicas.

You can re-run `kubectl` to scale the number of replicas to 8

```bash
kubectl scale --namespace=helloworld --replicas=8 deployment.apps/helloworld-deployment
```

And down to say 3

```bash
kubectl scale --namespace=helloworld --replicas=3 deployment.apps/helloworld-deployment
```

To auto-scale based on load we'd have to install Metrics Server (Resource Metrics API) and configure a Horizontal Pod Autoscaler (HPA)

<https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/>

## 9.12. Using what you've learned

Git clone the Python+Flask Magic Eight Ball web app

https://github.com/nemonik/magiceightball

and develop a pipeline for much like the helloworold-web application.

Do this and you've passed my course.

## 9.13. Shoo away your vagrants

If you're done with your vagrants, shoo them away from the root of the project on the host

```bash
vagrant halt
vagrant destroy -f
./box/remove_box.sh
```

or

```bash
./kill_em_all.sh
```

And they're gone.

## 9.14. That's it

That's a wrap.
