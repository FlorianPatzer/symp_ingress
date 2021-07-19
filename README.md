## About The Project

Managing external access to the SyMP services:

### Built With

* [Docker](https://docs.docker.com/docker-for-windows/install/)
* [nginx](https://www.nginx.com/)

## Getting Started

Simply download the project and run the preconfigured containers.

### Prerequisites

There are two configurations for the exposure of the services. The can be found in the `nginx` folder:

* **Localhost Configuration:** `localhost.conf` exposes the services as a path from localhost. For this configuration no additional stuff is needed. An example service can be reached at:
```
https://localhost/*your_service_name*
```

* **Subdomain Configuration:** `subdomains.conf` exposes the services as subdomains from the mDNS address of the ingress container. For this configuration a running mDNS server inside Docker with externally reachable containers (i.e. externally resolvable container address from DNS name) is needed. There is already a solution to this problem, available in the [Helpers](https://gitlab-ext.iosb.fraunhofer.de/symp/symp-helpers) project. An example service can be reached at:
```
https://symp-*your_service_name*.ingress.docker
```

### Installation

   - One-Liner: Use `docker-compose up --build` to build the containers and start them directly
   - Use `docker-compose build` to build the containers.
   - Use `docker-compose up` to start the containers.


## Usage

| Service Name           | Localhost address        | Subdomain address                  |
|------------------------|--------------------------|------------------------------------|
|Client                  | https://localhost/client | https://symp-client.ingress.docker |
|Analysis Hub Frontend   | https://localhost/ah     | https://symp-ah.ingress.docker     |
|System Model Engine     | https://localhost/sme    | https://symp-sme.ingress.docker    |
|Camunda                 | https://localhost/camunda| https://symp-camunda.ingress.docker|
|Security Analysis Engine| https://localhost/sae    | https://symp-sae.ingress.docker    |


## Roadmap

See the [open issues](https://github.com/github_username/repo_name/issues) for a list of proposed features (and known issues).
