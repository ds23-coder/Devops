# DevOps Feedback App

A lightweight Flask application and full CI/CD + Infrastructure as Code implementation created for a Level 5 DevOps assessment.

This project demonstrates:

- A functioning cloud-hosted application
- Automated testing
- Continuous Integration using GitHub Actions
- Infrastructure as Code using Terraform
- Secure handling of credentials
- Evaluation of pipeline effectiveness and limitations

---

## Project Overview

The purpose of this project is to demonstrate practical DevOps principles including automation, repeatability, security, and infrastructure management using modern industry tooling.

The application is intentionally simple so that the focus remains on DevOps workflows rather than application complexity.

---

## User Stories

The solution is designed around the following user stories:

### User Story 1 – End User
As an end user, I want to submit feedback via a simple web interface so that I can provide input without technical knowledge.

### User Story 2 – Developer
As a developer, I want automated tests to run on every push so that defects are detected early and code quality is maintained.

### User Story 3 – DevOps Engineer
As a DevOps engineer, I want infrastructure defined as code so that environments are reproducible, auditable, and consistent.

### User Story 4 – Organisation
As an organisation, I want credentials stored securely so that secrets are not exposed in source control.

---

## Application Overview

The application is built using **Flask** and provides:

- A simple feedback submission interface  
- A health-check endpoint used by automated tests  
- Lightweight architecture suitable for CI validation  

The app is located in the `/app` directory.

---

## Automated Testing

Automated tests are implemented using **pytest** in the `/tests` directory.

The tests validate:

- Application startup behaviour  
- HTTP responses from core endpoints  
- Health-check availability  

This supports the DevOps principle of **shift-left testing**, ensuring that defects are detected early in the development lifecycle.

---

## Continuous Integration (CI)

CI is implemented using **GitHub Actions**.

On every push to the `main` branch, the pipeline:

1. Checks out the code  
2. Sets up the Python environment  
3. Installs dependencies  
4. Runs the automated test suite  

This ensures that broken or untested code cannot be merged without detection.

Benefits:

- Fast feedback to developers  
- Reduced human error  
- Consistent and repeatable validation  
- Improved change reliability  

---

## Infrastructure as Code (Terraform)

Infrastructure is defined using **Terraform** in the `/iac` directory.

Resources provisioned include:

- AWS EC2 instance  
- Security group rules  
- Networking configuration  
- Output of public IP address  

Terraform files:

- `main.tf` – core resources and provider configuration  
- `variables.tf` – reusable parameters  
- `outputs.tf` – exported infrastructure values  

Benefits:

- Reproducible environments  
- Version-controlled infrastructure  
- Reduced configuration drift  
- Auditability  

Terraform automation is integrated into GitHub Actions using a dedicated workflow, which performs:

- Formatting checks (`terraform fmt`)  
- Validation (`terraform validate`)  
- Execution planning (`terraform plan`)  

This ensures infrastructure changes are reviewed and validated before deployment.

---

## Security & Secrets Management

Sensitive credentials are stored using **GitHub Actions Secrets**.

Secrets are:

- Encrypted
- Not visible in source code
- Injected into workflows at runtime only

This prevents accidental exposure of credentials in the repository.

Security best practices applied:

- No secrets committed to GitHub  
- Pipeline access limited to required variables  
- Supports principle of least privilege  

In a production environment, this would be extended using AWS IAM roles and a dedicated secrets manager such as AWS Secrets Manager or HashiCorp Vault.

---

## Pipeline Evaluation

The CI pipeline is evaluated against three key criteria:

### Speed
Pipelines run automatically on every push, providing near real-time feedback.

### Reliability
Consistent scripted steps reduce configuration errors and manual mistakes.

### Repeatability
The pipeline produces the same result for the same inputs, supporting auditing and traceability.

Industry alignment:

- Improves lead time for changes  
- Reduces change failure rate  
- Improves recovery time by detecting failures early  

---

## Risks and Limitations

Identified risks include:

- Misconfigured IAM permissions  
- Terraform state conflicts  
- Pipeline failures blocking deployment  
- Uncontrolled cloud resource costs  

Mitigations:

- Least-privilege IAM policies  
- Remote Terraform state with locking (recommended)  
- Environment separation (dev/staging/prod)  
- Budget alerts and resource monitoring  

---

## Future Improvements

If extended further, the project would include:

- Multiple deployment environments  
- Approval gates for infrastructure changes  
- Container image vulnerability scanning  
- Centralised secrets management  
- Monitoring and alerting (CloudWatch / Prometheus)  
- Deployment automation (CD stage)

---

## Conclusion

This project demonstrates a complete DevOps workflow including:

- Functional application delivery  
- Automated testing and CI  
- Infrastructure provisioning using Terraform  
- Secure credential management  
- Professional evaluation of strengths and limitations  

The implementation reflects modern DevOps practices used in real-world organisations.
