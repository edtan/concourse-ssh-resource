# SSH Resource

A resource for running a command through SSH primarily for simple deploys based on a small alpine base image.

## Installing

Add the following to the `resource_types` section of a pipeline config:

```yaml
---
resource_types:
- name: concourse-ssh-resource
  type: docker-image
  source:
    repository: edtan1/concourse-ssh-resource
```

## Source configuration

```yaml
---
resources:
- name: my-server-ssh
  type: concourse-ssh-resource
  source:
    hostname: my-server-hostname
    username: my-username
    private_key: ((ssh-private-key))
```

* `hostname`: *Required.* Server to connect to.

* `username`: *Required.* Username.

* `private_key`: *Required.* The private key to use - use a [credentials manager](https://concourse-ci.org/creds.html) for this!

* `port`: *Optional. Default `22`.* Port.

## `check`: no-op

This resource currently does nothing for `check`.

## `in`: no-op

This resource currently does nothing for `in`.

## `out`: Run a command through ssh

Runs the command in the provided in `params`.  The following command will be run:

```
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -p $port -i $private_key_file $username@$hostname $command
```

### Configuration:

``` yaml
plan:
- put: my-server-ssh
  params:
    command: ./deploy.sh
```

### Parameters

* `command`: *Required.* The command to run on the server.
