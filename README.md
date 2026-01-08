# DevOps Feedback App

Simple Flask app for DevOps CI/CD assessment.
The application is intentionally lightweight so that the focus is on DevOps practices rather than application complexity.

## CI/CD Pipeline

GitHub Actions is used to implement continuous integration.
On each push to the main branch, automated tests are executed to validate the application.

## Infrastructure as Code

Terraform is used to define AWS infrastructure in the `iac/` directory.
A GitHub Actions workflow automatically runs Terraform formatting, validation, and planning using securely stored AWS credentials.

