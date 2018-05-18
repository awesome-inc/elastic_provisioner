# Elastic Provisioner

Import & export Elasticsearch data, e.g. Kibana dashboards & configuration.

[![dockeri.co](http://dockeri.co/image/awesomeinc/elastic_provisioner)](https://hub.docker.com/r/awesomeinc/elastic_provisioner/)

[![GitHub issues](https://img.shields.io/github/issues/awesome-inc/elastic_provisioner.svg "GitHub issues")](https://github.com/awesome-inc/elastic_provisioner)
[![GitHub stars](https://img.shields.io/github/stars/awesome-inc/elastic_provisioner "GitHub stars")](https://github.com/awesome-inc/elastic_provisioner)

## Provision (Import)

Upload documents from `/var/import` to Elasticsearch running on `http://localhost:9200`

```bash
$docker run --rm \
  -e ES_BASE_URI=http://localhost:9200 \
  -v /var/import:/app/import \
  awesomeinc/elastic_provisioner

00_wait_for_es
Waiting for Elasticsearch to come up...

01_import
Provisioning 'http://elasticsearch:9200'...
....
Provisioning done.
```

## Export

Export documents of an Elasticsearch index to `/var/export`:

```bash
$docker run --rm \
  -v /var/export:/app/export \
  awesomeinc/elastic_provisioner \
  export.rb [.kibana] [export]

Exporting 'http://elasticsearch:9200/.kibana' to 'export'...
...
Exporting done.
```

This fetches the `.kibana` index and downloads documents into `/var/export`.

## FAQ

### Docker for Windows

#### Connection refused to localhost:9200

A glitch when running elasticsearch via docker on localhost using *Docker for Windows*.
Instead of `localhost` use `host.docker.internal`, cf. e.g. 

- [Access host from a docker container (dev.to 2018-03-31 with Docker 18.03.0-ce)](https://dev.to/bufferings/access-host-from-a-docker-container-4099)