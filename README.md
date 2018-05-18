# Elastic Provisioner

Import & export Elasticsearch data, e.g. Kibana dashboards & configuration.

[![dockeri.co](http://dockeri.co/image/awesomeinc/elastic_provisioner)](https://hub.docker.com/r/awesomeinc/elastic_provisioner/)

[![GitHub issues](https://img.shields.io/github/issues/awesome-inc/elastic_provisioner.svg "GitHub issues")](https://github.com/awesome-inc/elastic_provisioner)
[![GitHub stars](https://img.shields.io/github/stars/awesome-inc/elastic_provisioner "GitHub stars")](https://github.com/awesome-inc/elastic_provisioner)


## Provision (Import)

Upload documents from `import` to Elasticsearch (`ES_BASE_URI=http://localhost:9200`)

```bash
docker run --rm \
  -e ES_BASE_URI=http://localhost:9200 \
  -v /var/import:/app/import \
  awesomeinc/elastic_provisioner
```

## Export

Export documents of an Elasticsearch index (`ES_BASE_URI=http://localhost:9200`)

```bash
docker run --rm \
  -e ES_BASE_URI=http://localhost:9200 \
  -v /var/export:/app/export \
  awesomeinc/elastic_provisioner \
  ruby export.rb [index=.kibana] [output=export]
```

This fetches the `.kibana` index and downloads documents into `/var/export`.
