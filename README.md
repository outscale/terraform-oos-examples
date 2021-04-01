This repository shows how to use [terraform](https://www.terraform.io/) AWS's S3 provider with Outscale Object Storage (OOS).

Beeing able to use a non-AWS S3 service with official AWS S3 provider is still [work in progress](https://github.com/hashicorp/terraform-provider-aws/issues/13726) so we will need to use a patched version of official AWS provider.

# Get patched terraform-provider-aws

Because some features are not supported by OOS or are very specific to AWS services, [official terraform-provider-aws](https://github.com/hashicorp/terraform-provider-aws) has been adapted by Outscale and other [contributors](https://github.com/hashicorp/terraform-provider-aws/pull/17564).

This allow us to disable non-supported features (mostly in  `provider` and `bucket` blocks) while keeping the module AWS-compatible. You can get this patched terraform-provider-aws version by either building it locally or getting a pre-built module.

## Build locally

To ease the process, you can automatically fetch, build and install [patched terraform-provider-aws module](https://github.com/outscale-dev/terraform-provider-aws/tree/oos):
1. You will need [git](https://git-scm.com/), [golang](https://golang.org/) and [make](https://www.gnu.org/software/make/) installed.
2. Run `PLATFORM=linux_amd64 make install` (set `darwin_amd64` for OSX users).

## Get pre-built module

Alternatively, you can get a pre-compiled module for your platform.
Only `linux_amd64`and `darwin_amd64` platforms are available for now.

1. You will need [make](https://www.gnu.org/software/make/) installed.
2. Run `PLATFORM=linux_amd64 make install-prebuilt`

## Verify you installation

Once installed, you should see a similar file structure in your home directory:
```bash
cd ~
tree .terraform.d/
.terraform.d/
└── plugins
    └── registry.terraform.io
        └── hashicorp
            └── aws
                └── 3.34.99
                    └── linux_amd64
                        └── terraform-provider-aws_v3.34.99
```

# Setup your credentials

You will need to setup your credentials and region details through environement variables:
```bash
export TF_VAR_access_key="myAccessKey"
export TF_VAR_secret_key="mySecretKey"
export TF_VAR_region="eu-west-2"
export TF_VAR_endpoint="https://oos.eu-west-2.outscale.com"
```

Alternatively, you can write those details in `examples/terraform.tfvars` (don't forget to uncomment).

# Run examples

Once the provider built and your credentials filled, you should be able to run examples.
Make sur you have at least terraform >= 0.13.

```bash
cd examples
terraform init
terraform plan
terraform apply
terraform destroy
```

# Contributing

Want to add more examples? Have a question? Feel free to open an issue.

# License

> Copyright Outscale SAS
>
> BSD-3-Clause

This project is compliant with [REUSE](https://reuse.software/).
