# Terraform Tools

This repo is for any tools needed to manage or enhance the use of Terraform

## Usage

### Docker

To be used locally or in a pipeline to allow for deploying Terraform code. Tools included are:

- [Terraform](https://terraform.io)
- [TFLint](https://github.com/terraform-linters/tflint)
- [Trivy](https://github.com/aquasecurity/trivy)
- [Terraform-Docs](https://github.com/terraform-docs/terraform-docs/)
- [Infracost](https://github.com/infracost/infracost)

After building the image, use docker run from your repo or source to mount a volume and access the tools.

```
docker run --rm -v `pwd`:/data terraform plan
```
