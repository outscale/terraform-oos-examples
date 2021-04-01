platform = ${PLATFORM}
version = 3.34.99
plugin_folder = ~/.terraform.d/plugins/registry.terraform.io/hashicorp/aws/$(version)/$(platform)
plugin_filename = terraform-provider-aws_v$(version)
plugin_fullpath = $(plugin_folder)/$(plugin_filename)
source_name = terraform-provider-aws
source_url = https://github.com/outscale-dev/$(source_name).git
source_branch = oos
pre_built_root_url = https://terraform-oos-examples.oos.eu-west-2.outscale.com/registry.terraform.io/hashicorp/aws

all: install

.PHONY: install
install: $(plugin_fullpath)
	@echo "install OK"

$(plugin_fullpath): $(source_name)/$(source_name)
	mkdir -p $(plugin_folder)
	cp $^ $@

$(source_name)/$(source_name): $(source_name)
	cd $(source_name) && go build .

$(source_name):
	git clone -b $(source_branch) --single-branch $(source_url)

.PHONY: install-prebuilt
install-prebuilt:
	mkdir -p $(plugin_folder)
	curl $(pre_built_root_url)/$(version)/$(platform)/$(plugin_filename) -o $(plugin_fullpath)
	chmod u+x $(plugin_fullpath)

.PHONY: clean
clean:
	cd examples && rm -rf .terraform.lock.hcl .terraform terraform.tfstate*
