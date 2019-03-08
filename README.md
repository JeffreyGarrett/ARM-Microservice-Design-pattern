# intro
this repo is designed to illlustrate a design pattern for deploying microservices architecture on azure utilizing Azure resources and ARM templates.  We hope to spark thought and help in clarifying and simplify getting up and running.  

# file structure
```
├── deployments (name says it all, where you keep your deployment configs and scripts)
│   ├── Azure-EastUS (the region your deploying in)
│   │   └── microservice1  (service in the region your deploying)
│   │       ├── deploy.dev.sh  (one deployment script/parameters files for every long lived cluster)
│   │       ├── deploy.sh
│   │       ├── parameters.dev.json
│   │       └── parameters.json
│   └── Local-Testing  (helpful folder to separate test deployments in test subscription)
│       └── microservice1
│           ├── deploy.sh
│           └── parameters.json
└── public  (where templatized resources live)
    ├── resources (individual resources such as storage account, cosmosdb, webapp etc.)
    │   └── global  (those resources that have location 'global')
    │       └── Active-Directory
    └── services   (your microservices.)
        ├── api-gateway.json
        ├── microservice1.json
        └── microservice2.json
```

# things to note
- linked templates are used due to it's more extensible functionality but has some oddities
- hard coding the deployment parameters in a declarative manner will help in reducing errors.  Read more in the scripts
- this works best with a ci/cd and does not assume a versioning pattern
- these templates are not designed for production or local use in some cases

# CI/CD
- note you should have test for each level of the structure: resources/services/deployments
- suggest to have e2e tests setup for different layers 
- since deployment config is the most common changes, this setup makes those the least intensive testing as you only have to test that one deployment vs everthing

*amount of testing correlates to level of change*

resources: large
services: medium
deployment: small

this works in the sense that manual testing from an ops perspective is less not more, while automated testing will do the heavy lifting


# deploying

Because linked templates require the templates to be public, you'll need a way to broadcast templates.  In order to speed up development host your deployments locally using ngrok.  This allows for deployments quickly and iteratively without pushing to repos for new feature branches and testing new infrastructure deployments.

- install http-server  `npm install -g http-server`
- install ngrok `npm install -g ngrok`
- from `public` folder deploy http server `http-server ./ -p 8080`
- deplpoy ngrok `ngrok http 8080`
- update your deployment script (in deployments folder)
- run your deployment.sh script (see examples)

# NOTE
- this is an example does not include security or other deployment needs
- this doesn't include perfect examples: suggest you see azure's template repo's

