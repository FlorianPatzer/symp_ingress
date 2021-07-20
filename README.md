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

*Note: This projects is an attemt to resemble the configuration created in [Rancher](https://rancher.k8s.ilt-dmz.iosb.fraunhofer.de/g/clusters).*

| Service Name           | Localhost address        | Subdomain address                  | Subdomain address                                 |
|------------------------|--------------------------|------------------------------------|---------------------------------------------------|
|Client                  | https://localhost/client | https://symp-client.ingress.docker |https://symp-client.k8s.ilt-dmz.iosb.fraunhofer.de |
|Analysis Hub            | https://localhost/ah     | https://symp-ah.ingress.docker     |https://symp-ah.k8s.ilt-dmz.iosb.fraunhofer.de     |
|System Model Engine     | https://localhost/sme    | https://symp-sme.ingress.docker    |https://symp-sme.k8s.ilt-dmz.iosb.fraunhofer.de    |
|Camunda                 | https://localhost/camunda| https://symp-camunda.ingress.docker|https://symp-camunda.k8s.ilt-dmz.iosb.fraunhofer.de|
|Security Analysis Engine| https://localhost/sae    | https://symp-sae.ingress.docker    |https://symp-sae.k8s.ilt-dmz.iosb.fraunhofer.de    |

## Roadmap

See the [open issues](https://gitlab-ext.iosb.fraunhofer.de/symp/symp-ingress/-/issues) for a list of proposed features (and known issues).