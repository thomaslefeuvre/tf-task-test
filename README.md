# Platform Engineering Task

## Take-home task

This task involves the automation of a deployment pipeline for two serverless functions. It is intended to take at least 1 hour to prepare. If you find yourself spending longer than one hour, please note down what you would do if you had more time and we will discuss it in the next interview — do not worry about finishing. We are looking for an indication of your thought processes outside of an interview context, not a comprehensive or in-depth solution. 

When you have completed your solution, please upload your code to a public GitHub repository and email the link to [cls@powerx.ai](mailto:cls@powerx.ai). Feel free to ask any questions or clarifications at any time.

We are looking to evaluate:

- Your approach to automation and deployment
- Your ability to write idiomatic and maintainable code
- Your understanding of CI/CD best practices
- The way you choose development priorities

# Problem statement

Our company has developed two new microservices, which now need a continuous integration and deployment pipeline. The code for both services is stored in the same mono-repo, but use two different programming languages (Python and TypeScript). 

**Your task is to write a CI/CD pipeline to build both projects and deploy them to AWS Lambda.**

# Codebase

The service code can be found within this repository. You can fork this repository to create your own copy to work on.

Both services have a README explaining the (simple) build steps you will need to automate, but you should not need to modify the service code. After compiling/bundling the code, your automation needs to deploy the new artifacts to AWS Lambda. Any infrastructure-as-code should be written using Terraform.

# Infrastructure

We recommend that you test your pipeline against a live AWS account to ensure things are working as they should. If you do not have access to a suitable account, please let us know so we can make alternative arrangements. Similarly, if you are unable to use Github Actions for automations, we may be able to consider implementations which use other services.

# Additional Considerations

When we review your solution together, we may discuss the following questions:

- How have you handled the security considerations of the pipeline?
- What strategies can be implemented to handle errors and rollbacks during deployment?
- How might this pipeline need to be adapted if the repository was very active?
- How can we make the code easy to maintain and extend for future developers?
- How can you reduce the iteration time during development of your pipeline?
