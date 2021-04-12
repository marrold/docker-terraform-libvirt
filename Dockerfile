FROM golang:alpine as build

RUN apk add --update-cache git make gcc pkgconfig libvirt-dev libc-dev && \
  mkdir -p /usr/src && \
  cd /usr/src && \
  git clone https://github.com/dmacvicar/terraform-provider-libvirt.git && \
  cd terraform-provider-libvirt && \
  git checkout 67f4f2a && \
  make

FROM hashicorp/terraform:0.14.10

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libvirt gcc libxslt cdrkit openssh-client && \
    mkdir -p /root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.3/linux_amd64/
COPY --from=build /usr/src/terraform-provider-libvirt/terraform-provider-libvirt /root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.3/linux_amd64/terraform-provider-libvirt

WORKDIR $GOPATH
ENTRYPOINT ["terraform"]
