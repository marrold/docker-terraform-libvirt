# docker-terraform-libvirt

A container built with [the official terraform image](https://hub.docker.com/r/hashicorp/terraform/) and [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

Terraform is pinned to version 0.14.10 and the provider is pinned to 0.6.3

## Usage
`docker build -t docker-terraform-libvirt`
`docker run -it -v $PWD:/opt -w /opt docker-terraform-libvirt init $path_to_tf_files`

## License

This project is licensed under the terms of the _MIT license_, please check the dependencies for their associated licenses. 
